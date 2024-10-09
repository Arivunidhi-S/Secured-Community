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


public partial class AddWishlist : System.Web.UI.Page
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
            if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblcart.Text = Session["Cart"].ToString();
            }
            else { 
                //lblWelcome.Visible = false;
                Response.Redirect("Login.aspx", false);
            }

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);

            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            BusinessTier.DisposeConnection(connMenu);
            //Response.Redirect("index.aspx");
            Response.Redirect("Login.aspx", false);
            //InsertLogAuditTrail(Session["CustomerID"].ToString(), "Page_Init", "AddCart", ex.ToString(), "Audit");
        }
    }

    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}

    // ---------------- %% ** !! RadGrid Functions !! ** %% ---------------- //

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void RadGridDisplay_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridDisplay.DataSource = DataSourceHelper();
        }
        catch (Exception ex)
        {
            Response.Redirect("index.aspx");
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_NeedDataSource", "AddWishlist", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();

        string @Param = string.Empty;
        //@Param = Request.QueryString.Get("Param").ToString();
        @Param = Session["CustomerID"].ToString();

        DataTable g_datatable = new DataTable();
        string sql = "select * FROM Vw_WishList WHERE Customerid='" + @Param + "'";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGridDisplay_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["WishlistID"].ToString();
            int flg = BusinessTier.AddWishlist(conn, Convert.ToInt32(ID.ToString()), 0, 0, 0, Session["CustomerID"].ToString().Trim(), "D");
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddWishlist", "RadGridDisplay_DeleteCommand", ex.ToString(), "Audit");
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
            RadComboBox cboQnty = (RadComboBox)e.Item.FindControl("cboQnty");
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            //cboQnty.SelectedIndexChanged += new RadComboBoxSelectedIndexChangedEventHandler(cboQnty_OnSelectedIndexChanged);
            lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString();
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

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
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

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (e.CommandName == "Cart" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblRM = (Label)e.Item.FindControl("lblRM");
                Label lblPrice = (Label)e.Item.FindControl("lblPrice");

                string ProductID = lblPrice.ToolTip.ToString();
                string PricingID = lblRM.ToolTip.ToString();

                String Insdate = DateTime.Now.ToString();
                DateTime dtinsDate = DateTime.Parse(Insdate);
                Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
                SqlDataReader rd = BusinessTier.getDuplicate(conn, ProductID, Session["CustomerID"].ToString(), Insdate.ToString());
                if (rd.Read())
                {

                    int AddcartID = Convert.ToInt32(rd["AddcartID"].ToString());
                    int dtqty = Convert.ToInt32(rd["Qnty"].ToString());
                    BusinessTier.DisposeReader(rd);
                    int flg = BusinessTier.AddCart(conn, AddcartID, Convert.ToInt32(ProductID.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), Convert.ToInt32(PricingID.ToString().Trim()), 1,0, Session["CustomerID"].ToString().Trim(), "U");
                }
                else
                {
                    BusinessTier.DisposeReader(rd);
                    int flg = BusinessTier.AddCart(conn, 1, Convert.ToInt32(ProductID.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), Convert.ToInt32(PricingID.ToString().Trim()), 1,0, Session["CustomerID"].ToString().Trim(), "N");
                }
                BusinessTier.DisposeConnection(conn);
                Response.Redirect("AddCart.aspx?Param=" + Session["CustomerID"].ToString(), false);
            }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddWishlist", "RadGrid1_ItemCommand", ex.ToString(), "Audit");
        }
    }

    protected void btnAllCart_OnClick(object sender, EventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            foreach (GridDataItem item in RadGridDisplay.Items)
            {
                String Insdate = DateTime.Now.ToString();
                DateTime dtinsDate = DateTime.Parse(Insdate);
                Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

                CheckBox chkSelected = (CheckBox)item.FindControl("chkSelected");
                Label lblRM = (Label)item.FindControl("lblRM");
                Label lblPrice = (Label)item.FindControl("lblPrice");

                string ProductID = lblPrice.ToolTip.ToString();
                string PricingID = lblRM.ToolTip.ToString();

                if (chkSelected.Checked)
                {
                    SqlDataReader rd = BusinessTier.getDuplicate(conn, ProductID, Session["CustomerID"].ToString(), Insdate.ToString());
                    if (rd.Read())
                    {
                        int AddcartID = Convert.ToInt32(rd["AddcartID"].ToString());
                        //int dtqty = Convert.ToInt32(rd["Qnty"].ToString());
                        BusinessTier.DisposeReader(rd);
                        int flg = BusinessTier.AddCart(conn, AddcartID, Convert.ToInt32(ProductID.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), Convert.ToInt32(PricingID.ToString().Trim()), 1,1, Session["CustomerID"].ToString().Trim(), "U");
                    }
                    else
                    {
                        BusinessTier.DisposeReader(rd);
                        int flg = BusinessTier.AddCart(conn, 1, Convert.ToInt32(ProductID.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), Convert.ToInt32(PricingID.ToString().Trim()), 1,1, Session["CustomerID"].ToString().Trim(), "N");
                    }
                }

            }

            BusinessTier.DisposeConnection(conn);
            Response.Redirect("AddCart.aspx?Param=" + Session["CustomerID"].ToString(), false);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddWishlist", "btnAllCart_OnClick", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }
}