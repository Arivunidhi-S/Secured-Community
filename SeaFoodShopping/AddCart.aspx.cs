using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

using System.Globalization;
using System.Collections;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.OleDb;
using System.Drawing;

using System.Collections.Generic;
using System.Linq;
using Telerik.Web.UI.Calendar;
//using NCalc;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;



public partial class AddCart : System.Web.UI.Page
{
    public DataTable dtPreview = new DataTable();

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            //Session["sesUserID"] = "ipay88";
            //Session["CustomerID"] = "31";
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblLog.Text = "Logout";
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;

                SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
                dtMenuItems.Load(readerMenulist);
                BusinessTier.DisposeReader(readerMenulist);

            }
            else { lblWelcome.Text = "My Account"; lblLog.Text = "Login"; }
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "AddCart", "Page_Init", ex.ToString(), "Audit");
            BusinessTier.DisposeConnection(connMenu);
            Response.Redirect("index.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblpromotion.Visible = false;
        lblPRA.Visible = false;
        try
        {
            cartload();
        }
        catch (Exception ex)
        {
            Response.Redirect("index.aspx");
        }
    }

    public void cartload()
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();

        String today = DateTime.Now.ToString();
        DateTime dtinsDate = DateTime.Parse(today);
        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

        string sql = "select count(*) as Cart, sum(DiscountPrice*Qnty) as Total, sum(ShippingCost*Qnty) as ShipCost from Vw_AddCart where DELETED=0 and buy=0 and Customerid='" + Session["CustomerID"].ToString() + "' and CREATED_DATE='" + today.ToString() + "'";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblcart.Text = reader["Cart"].ToString();
            Session["Cart"] = reader["Cart"].ToString();
            lblTotal.Text =Convert.ToDecimal(reader["Total"]).ToString("#0.00");
            Session["Total"] = Convert.ToDecimal(reader["Total"]).ToString("#0.00");
            lblShippingCost.Text = Convert.ToDecimal(reader["ShipCost"]).ToString("#0.00");
            Session["ShipCost"] = Convert.ToDecimal(reader["ShipCost"]).ToString("#0.00");
        }
        lblGrandTotal.Text = (Convert.ToDecimal(lblTotal.Text) + Convert.ToDecimal(lblShippingCost.Text)).ToString("#0.00");

        BusinessTier.DisposeReader(reader);
        BusinessTier.DisposeConnection(connMenu);
    }

    // ---------------- %% ** !! RadGrid Functions !! ** %% ---------------- //

    protected void RadGridDisplay_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridDisplay.DataSource = DataSourceHelper();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_NeedDataSource", "AddCart", ex.ToString(), "Audit");
            Response.Redirect("index.aspx");
        }
    }

    public DataTable DataSourceHelper()
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();

        string @Param = string.Empty;
        @Param = Request.QueryString.Get("Param").ToString();
        String today = DateTime.Now.ToString();
        DateTime dtinsDate = DateTime.Parse(today);
        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
        //string today = "14/01/2016";
        //string today = DateTime.Now.ToShortDateString();
        DataTable g_datatable = new DataTable();
        string sql = "select * FROM Vw_AddCart WHERE Deleted=0 and buy=0 and Customerid='" + @Param + "' and CREATED_DATE='" + today.ToString() + "'";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGridDisplay_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();

        if (e.CommandName == "cboQntySelect" && e.Item is GridDataItem)
        {
            try
            {
                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    Label lblPrice = (Label)e.Item.FindControl("lblPrice");
                    Label lbltotal = (Label)e.Item.FindControl("lbltotal");
                    RadComboBox cboQnty = (RadComboBox)e.Item.FindControl("cboQnty");
                    lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString();

                }
                //e.Item.Selected = true;
                //string AddcartID = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"]).ToString();

            }
            catch (Exception ex)
            {
                InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_ItemCommand", "AddCart", ex.ToString(), "Audit");
            }
            finally
            {
                BusinessTier.DisposeConnection(conn);
            }
        }
    }

    protected void RadGridDisplay_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"].ToString();
            int flg = BusinessTier.AddCart(conn, Convert.ToInt32(ID.ToString()), 1, 1, 1, 1,1, Session["CustomerID"].ToString().Trim(), "D");
            BusinessTier.DisposeConnection(conn);
            cartload();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddCart", "RadGridDisplay_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    protected void RadGridDisplay_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            TextBox cboQnty1 = (TextBox)e.Item.FindControl("cboQnty1");
            Regex charregex = new Regex(@"[0-9]+\.?[0-9]*$/");
            //if ((charregex.IsMatch(cboQnty1.Text.ToString().Trim())))
            //{
            //    return;
            //}
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"].ToString();
            int flg = BusinessTier.AddCart(conn, Convert.ToInt32(ID.ToString()), 1, 1, 1, Convert.ToDecimal(cboQnty1.Text.ToString()),1, Session["CustomerID"].ToString().Trim(), "U1");
            BusinessTier.DisposeConnection(conn);
            cartload();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddCart", "RadGridDisplay_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            //if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            //{
            GridEditFormItem editedItem = e.Item as GridEditFormItem;
            //RadComboBox cboQnty = (RadComboBox)e.Item.FindControl("cboQnty");
            Label cboQnty = (Label)e.Item.FindControl("cboQnty");
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            //cboQnty.SelectedIndexChanged += new RadComboBoxSelectedIndexChangedEventHandler(cboQnty_OnSelectedIndexChanged);
            lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString("#0.00");
            //}

        }
        catch (Exception ex)
        {

        }

        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    protected void cboQnty_OnSelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        //RadComboBox combobox = (RadComboBox)sender;
        //GridEditFormItem editedItem = (GridEditFormItem)combobox.NamingContainer;
        ////GridEditFormItem editedItem = e.Item as GridEditFormItem;
        //RadComboBox cboQnty = (RadComboBox)editedItem.FindControl("cboQnty");
        //Label lblPrice = (Label)editedItem.FindControl("lblPrice");
        //Label lbltotal = (Label)editedItem.FindControl("lbltotal");
        //lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString();
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void btnbuy_OnClick(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(lblGrandTotal.Text.ToString()) < 30)
        {
            lblstatus.Text = "Minimum order amount to checkout is QAR 30";
            return;
        }

        if (string.IsNullOrEmpty(lblGrandTotal.ToolTip.ToString()))
        {
            Session["GrandTotal"] = lblGrandTotal.Text.ToString();
        }
        else
        {
            Session["GrandTotal"] = lblGrandTotal.ToolTip.ToString();
        }
        Session["PromotionID"] = txtPCode.ToolTip.ToString();
        Session["breakamount"] = lblpromotion.ToolTip.ToString();
        Response.Redirect("ShippingAddress.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        if (lblLog.Text == "Logout")
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            Response.Redirect("index.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string Today = DateTime.Now.ToString();
            DateTime idt2 = DateTime.Parse(Today);
            Today = idt2.Month + "/" + idt2.Day + "/" + idt2.Year + " 00:00:00";

            string sql = "Select Type,Discount,PromotionID from PromotionMaster where PromotionCode='" + txtPCode.Text.ToString() + "' and deleted=0 and FromDate <= '" + Today.ToString() + "' and ToDate >= '" + Today.ToString() + "' and Total<='" + lblTotal.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            string type = string.Empty;
            decimal disc = 0;
            if (rd.Read())
            {
                disc = Convert.ToDecimal(rd["Discount"].ToString());
                type = rd["Type"].ToString();
                txtPCode.ToolTip = rd["PromotionID"].ToString();
            }

            if (type == "RM")
            {
                decimal s = 0;
                s = (Convert.ToDecimal(lblTotal.Text));
                lblGrandTotal.Text = (s - disc).ToString();
                lblGrandTotal.ToolTip = (s - disc).ToString();
                lblpromotion.Visible = true;
                lblPRA.Visible = true;
                lblPRA.Text = "Discount :";
                lblpromotion.Text = "-" + disc.ToString() + "<br><br />";
                lblpromotion.ToolTip = disc.ToString();
            }

            else if (type == "Percentage")
            {
                decimal p = 0, r = 0, per = 0;
                p = Convert.ToDecimal(lblTotal.Text.ToString().Trim());
                r = Convert.ToDecimal(disc.ToString().Trim());
                per = p - ((r / 100) * p);
                lblpromotion.Visible = true;
                lblPRA.Visible = true;
                lblPRA.Text = "Discount(%) :";
                lblpromotion.ToolTip = decimal.Round((p - per), 2, MidpointRounding.AwayFromZero).ToString();
                lblpromotion.Text = "-" + decimal.Round((p - per), 2, MidpointRounding.AwayFromZero).ToString().Trim() + "<br><br />";
                //lblTotal.Text = decimal.Round(per, 2, MidpointRounding.AwayFromZero).ToString().Trim();
                lblGrandTotal.Text = (per + Convert.ToDecimal(lblShippingCost.Text)).ToString("0.00");
                lblGrandTotal.ToolTip = (per + Convert.ToDecimal(lblShippingCost.Text)).ToString("0.00");
            }
            else if (type == "Shipping")
            {
                lblpromotion.Visible = true;
                lblPRA.Visible = true;
                lblPRA.Text = "Discount Shipping Amount :";
                lblpromotion.ToolTip = lblShippingCost.Text.ToString();
                lblpromotion.Text = "-" + lblShippingCost.Text.ToString() + "<br><br />";
                lblGrandTotal.Text = lblTotal.Text;
                lblGrandTotal.ToolTip = lblTotal.Text;
            }
            //Session["breakamount"] = breakamount;

            BusinessTier.DisposeReader(rd);
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            //lblStatus.Text = ex.Message;
            BusinessTier.DisposeConnection(conn);
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderForm", "ItemClick", ex.ToString(), "Audit");
        }
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }

    protected void cboQuantity_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            String Insdate = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(Insdate);
            Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            //DataTable dtSize = new DataTable();


            RadComboBox comboBox = (RadComboBox)sender;

            string sql = "select pricingid FROM AddCartMaster WHERE Deleted=0 and buy=0 and productid='" + comboBox.ToolTip.ToString() + "' and CREATED_DATE='" + Insdate.ToString() + "' and CREATED_BY='" + Session["CustomerID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader rd = cmd.ExecuteReader();
            string hdpricingid = string.Empty;
            if (rd.Read())
            {
                hdpricingid = rd["pricingid"].ToString();
            }
            BusinessTier.DisposeReader(rd);

            if (hdpricingid == "0")
            { hdpricingid = ""; }
            SqlDataReader readerMenu = BusinessTier.getQty(connMenu, comboBox.ToolTip.ToString(), hdpricingid.ToString());

            if (readerMenu.Read())
            {

                //dtSize.Load(readerMenu);

                comboBox.Items.Clear();
                int stock = 0;
                if (Convert.ToInt32(readerMenu["tstock"].ToString()) < 5)
                {

                    stock = Convert.ToInt32(readerMenu["tstock"].ToString());
                    comboBox.Height = (stock * 20);
                }
                else
                {
                    stock = 5;
                    comboBox.Height = 100;
                }
                for (int i = 1; i <= stock; i++)
                {
                    RadComboBoxItem item = new RadComboBoxItem();

                    item.Text = i.ToString();// +" - " + row["Stock"].ToString();
                    item.Value = i.ToString();
                    comboBox.Items.Add(item);

                    item.DataBind();
                }
            }
            BusinessTier.DisposeReader(readerMenu);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

}