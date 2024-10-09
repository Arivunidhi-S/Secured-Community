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
//using System.Threading.ThreadAbortException;
using System.Threading;


public partial class Preview : System.Web.UI.Page
{
    public DataTable dtPreview = new DataTable();

    public DataTable dtRecentitems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtProductReview = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
           
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            string strLink = "ZoomImage.aspx?Param=" + @Param.ToString();
            param1.Value = strLink.ToString();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            //SqlDataReader readerMenu = BusinessTier.getPreview(connMenu, @Param);
            string sql = "select image1,image2,image3,image4,image5,Brand,Model,SellingPrice,ActualPrice,Details,Discount,DiscountPrice,CategoryID,ProductID,Category,shippingcost,TotalStock from Vw_Products where productid='" + @Param.ToString() + "' and  deleted=0  and MasterDel=0 and  approve=1";

            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader reader = cmd.ExecuteReader();
            dtPreview.Load(reader);
            string catid = dtPreview.Rows[0][12].ToString();
            string proid = dtPreview.Rows[0][13].ToString();
            hdqnty.Value = dtPreview.Rows[0][16].ToString();

            if (hdqnty.Value == "0")
            {
                button.Enabled = false;
                lblstatus.Text = "Sold Out - In Stock Soon";
            }


            if (string.IsNullOrEmpty(dtPreview.Rows[0][0].ToString()))
            {
                BusinessTier.DisposeReader(reader);
                Response.Redirect("index.aspx");
            }
            else
            {
                if (string.IsNullOrEmpty(dtPreview.Rows[0][10].ToString()) || dtPreview.Rows[0][10].ToString() == "0")
                {
                    lblDiscountPrice.Text = "QAR" + dtPreview.Rows[0][7].ToString();
                    //lblDiscount.Text = dtPreview.Rows[0][10].ToString() + "%";
                    lblDiscount.Visible = false;
                }
                else
                {
                    lblprice.Text = "QAR" + dtPreview.Rows[0][7].ToString();
                    lblprice.CssClass = "linethrough";
                    lblDiscountPrice.Text = "QAR" + dtPreview.Rows[0][11].ToString();
                    lblDiscount.Text = dtPreview.Rows[0][10].ToString() + "%";
                }
            }
            if (dtPreview.Rows[0][15].ToString() != "0.00")
            {
                lblshipping.Visible = false;
            }
            BusinessTier.DisposeReader(reader);

            //string sql1 = "select TOP(4) Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod FROM Vw_Products where [CategoryID]= " + catid.ToString() + " and MasterDel=0 and  TotalStock>0 and [ProductID] not in(" + proid.ToString() + " ) ORDER BY newid()";

            //SqlCommand cmd1 = new SqlCommand(sql1, connMenu);
            //SqlDataReader reader1 = cmd1.ExecuteReader();
            //dtRecentitems.Load(reader1);

            //BusinessTier.DisposeReader(reader1);

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);

            SqlDataReader rdProductReview = BusinessTier.getProductReview(connMenu, @Param);
            dtProductReview.Load(rdProductReview);
            BusinessTier.DisposeReader(rdProductReview);

            BusinessTier.DisposeConnection(connMenu);
            
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblLog.Text = "Logout";
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;
            }
            else { lblWelcome.Text = "My Account"; lblLog.Text = "Login"; }
            lblcart.Text = Session["Cart"].ToString();
        }
        catch (Exception ex)
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            Session["Cart"] = "0";
            lblWelcome.Text = "My Account"; 
            lblLog.Text = "Login";
            lblcart.Text = Session["Cart"].ToString();
            //string url = "index.aspx";
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect(url, false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {              
                string @Param = string.Empty;
                @Param = Request.QueryString.Get("Param").ToString();
                SqlConnection connMenu = BusinessTier.getConnection();
                connMenu.Open();
                SqlDataReader readerMenu = BusinessTier.getSize(connMenu, @Param.ToString());
                if (readerMenu.Read())
                {
                    cboSize.Visible = true;
                    lblsize.Visible = true;
                }
                else
                {
                    cboSize.Visible = false;
                    lblsize.Visible = false;
                }
        
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'", true);
        //lblStatus.Text = string.Empty;
        //SqlConnection conn = BusinessTier.getConnection();
        //conn.Open();
        //int ProductID = 0;
        //foreach (GridDataItem grdItem in RadGridDisplay.Items)
        //{
        //    Label lblRunningNo = (Label)grdItem.FindControl("lblRunningNo");
        //    ProductID = Convert.ToInt32(lblRunningNo.ToolTip.ToString().Trim());
        //}
        //int flg = BusinessTier.ProductReview(conn, 1, Convert.ToInt32(HiddenField1.Value), txtReviewtitle.Text.ToString().Trim(), txtReviewdescription.Text.ToString().Trim(), ProductID, 1, Session["CustomerID"].ToString(), txtReviewtitle.ToolTip.ToString());
        //BusinessTier.DisposeConnection(conn);
        //if (txtReviewtitle.ToolTip == "N")
        //{
        //    lblStatus.Text = "Thank you! Successfully Submitted Your Review.";
        //}
        //else
        //{
        //    lblStatus.Text = "Thank you! Successfully Modify Your Review.";
        //}
        //lblStatus.ForeColor = Color.Green;
        //lblOrderNo.ToolTip = HiddenField1.Value;
    }

    protected void btnAddCart_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["CustomerID"].ToString()))
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            Session["AddCart"] = @Param.ToString();
            Response.Redirect("Login.aspx");
        }
       
        //Regex charregex = new Regex("(?:[^a-z0-9% ]|(?<=['\"])s)", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Compiled); 

        //if ((charregex.IsMatch(cboQuantity.Text.ToString().Trim())))
        //{
        //    lblstatus.Text = "Only Numbers are allowed in Quantity Field.";
        //   charregex.Replace(cboQuantity.Text, String.Empty);
        //   return;
        //}
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();


        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            int pricingid = 0;
            string sql = "select * from MasterPricing where productid='" + @Param.ToString() + "' and deleted=0";

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                hdqnty.Value = reader["Stock"].ToString();
                //if (!(string.IsNullOrEmpty(reader["ProColor"].ToString())))
                //{
                //    if ((string.IsNullOrEmpty(cboColor.Text.ToString())))
                //    {
                //        lblstatus.Text = "Please Select Any Color";
                //        return;
                //    }
                //}
                //if (!(string.IsNullOrEmpty(reader["ProSize"].ToString())))
                //{
                //    if ((string.IsNullOrEmpty(cboSize.Text.ToString())))
                //    {
                //        lblstatus.Text = "Please Select Any Size";
                //        return;
                //    }
                //}
            }

            BusinessTier.DisposeReader(reader);
            if ((string.IsNullOrEmpty(cboQuantity.Text.ToString())))
            {
                lblstatus.Text = "Please Enter Quantity";
                return;
            }
            if ((string.IsNullOrEmpty(rdCutting.SelectedValue.ToString())))
            {
                lblstatus.Text = "Please Select Need Cutting";
                return;
            }
            if (string.IsNullOrEmpty(cboColor.SelectedValue.ToString()) && string.IsNullOrEmpty(cboSize.SelectedValue.ToString()))
            {
                pricingid = 0;
            }
            else if (string.IsNullOrEmpty(cboColor.SelectedValue.ToString()))
            {
                pricingid = Convert.ToInt32(cboSize.SelectedValue.ToString().Trim());
            }
            else if (string.IsNullOrEmpty(cboSize.SelectedValue.ToString()))
            {
                pricingid = Convert.ToInt32(cboColor.SelectedValue.ToString().Trim());
            }

            String Insdate = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(Insdate);
            Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
            SqlDataReader rd = BusinessTier.getDuplicate(conn, @Param, Session["CustomerID"].ToString(), Insdate.ToString());
            if (rd.Read())
            {
                int AddcartID = Convert.ToInt32(rd["AddcartID"].ToString());
                decimal dtqty = Convert.ToInt32(rd["Qnty"].ToString());
                decimal qty = dtqty + Convert.ToInt32(cboQuantity.Text.ToString());
                BusinessTier.DisposeReader(rd);
                if (qty >= Convert.ToInt32(hdqnty.Value))
                {
                    int flg = BusinessTier.AddCart(conn, AddcartID, Convert.ToInt32(@Param.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), pricingid, Convert.ToDecimal(hdqnty.Value),Convert.ToInt32(rdCutting.SelectedValue.ToString()), Session["CustomerID"].ToString().Trim(), "U");
                }
                else
                {
                    int flg = BusinessTier.AddCart(conn, AddcartID, Convert.ToInt32(@Param.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), pricingid, qty, Convert.ToInt32(rdCutting.SelectedValue.ToString()), Session["CustomerID"].ToString().Trim(), "U");
                }
            }
            else
            {
                BusinessTier.DisposeReader(rd);
                int flg = BusinessTier.AddCart(conn, 1, Convert.ToInt32(@Param.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), pricingid, Convert.ToDecimal(cboQuantity.Text.ToString().Trim()),Convert.ToInt32(rdCutting.SelectedValue.ToString()), Session["CustomerID"].ToString().Trim(), "N");
            }


            BusinessTier.DisposeConnection(conn);
            Response.Redirect("AddCart.aspx?Param=" + Session["CustomerID"].ToString(), false);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "Preview", "btnAddCart_OnClick", ex.ToString(), "Audit");

        }
        finally
        {
            //BusinessTier.DisposeConnection(conn);
        }


    }

    protected void btnAddWishlist_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["CustomerID"].ToString()))
        {
            Response.Redirect("Login.aspx");
        }
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();

            string sql = "select * from MasterPricing where productid='" + @Param.ToString() + "' and deleted=0";

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (!(string.IsNullOrEmpty(reader["ProColor"].ToString())))
                {
                    if ((string.IsNullOrEmpty(cboColor.Text.ToString())))
                    {
                        lblstatus.Text = "Please Select Any Color";
                        return;
                    }
                }
                if (!(string.IsNullOrEmpty(reader["ProSize"].ToString())))
                {
                    if ((string.IsNullOrEmpty(cboSize.Text.ToString())))
                    {
                        lblstatus.Text = "Please Select Any Size";
                        return;
                    }
                }
            }

            BusinessTier.DisposeReader(reader);

            int pricingid = 0;
            if (string.IsNullOrEmpty(cboColor.SelectedValue.ToString()) && string.IsNullOrEmpty(cboSize.SelectedValue.ToString()))
            {
                pricingid = 0;
            }
            else if (string.IsNullOrEmpty(cboColor.SelectedValue.ToString()))
            {
                pricingid = Convert.ToInt32(cboSize.SelectedValue.ToString().Trim());
            }
            else if (string.IsNullOrEmpty(cboSize.SelectedValue.ToString()))
            {
                pricingid = Convert.ToInt32(cboColor.SelectedValue.ToString().Trim());
            }

            SqlDataReader rd = BusinessTier.getWishDuplicate(conn, @Param, Session["CustomerID"].ToString());
            if (!(rd.Read()))
            {
                BusinessTier.DisposeReader(rd);
                int flg = BusinessTier.AddWishlist(conn, 1, Convert.ToInt32(@Param.ToString().Trim()), Convert.ToInt32(Session["CustomerID"].ToString().Trim()), pricingid, Session["CustomerID"].ToString().Trim(), "N");
            }
            else
            {
                BusinessTier.DisposeReader(rd);
            }
            BusinessTier.DisposeConnection(conn);
            Response.Redirect("AddWishlist.aspx?Param=" + Session["CustomerID"].ToString(), false);
        }
        catch (Exception ex)
        {
            //lblStatus.Text = ex.Message.ToString();
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "Preview", "btnAddWishlist_OnClick", ex.ToString(), "Audit");
            //lblStatus.ForeColor = Color.Red;
            //Response.Redirect("Login.aspx");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
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

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }

    protected void lnkMoreImages_OnClick(object sender, EventArgs e)
    {
        string @Param = string.Empty;
        @Param = Request.QueryString.Get("Param").ToString();

        //ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = (screen.width/2)-(650/2);var Mtop = (screen.height/2)-(550/2);window.open( '" + strLink + "', null, 'width=650,height=550,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
        //Response.Redirect("ZoomImage.aspx?Param=" + @Param.ToString(), false);
    }

    protected void cboColor_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            DataTable dtColor = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getColor(connMenu, @Param.ToString());
            dtColor.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtColor.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                if (!(string.IsNullOrEmpty(row["ProColor"].ToString())))
                {
                    item.Text = row["ProColor"].ToString();// +" - " + row["Stock"].ToString();
                    item.Value = row["PricingID"].ToString();
                    comboBox.Items.Add(item);
                }
                item.DataBind();
            }
            BusinessTier.DisposeReader(readerMenu);
            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboSize_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            DataTable dtSize = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getSize(connMenu, @Param.ToString());
            dtSize.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtSize.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                if (!(string.IsNullOrEmpty(row["ProSize"].ToString())))
                {
                    item.Text = row["ProSize"].ToString();// +" - " + row["Stock"].ToString();
                    item.Value = row["PricingID"].ToString();
                    comboBox.Items.Add(item);
                }
                item.DataBind();
            }
            BusinessTier.DisposeReader(readerMenu);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboQuantity_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            String Insdate = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(Insdate);
            Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            //DataTable dtSize = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();


            SqlDataReader readerMenu = BusinessTier.getQty(connMenu, @Param.ToString(), cboSize.SelectedValue.ToString());

            if (readerMenu.Read())
            {

                //dtSize.Load(readerMenu);
                RadComboBox comboBox = (RadComboBox)sender;
                comboBox.Items.Clear();
                int stock = 0;
                if (Convert.ToInt32(readerMenu["tstock"].ToString()) < 25)
                {

                    stock = Convert.ToInt32(readerMenu["tstock"].ToString());
                    comboBox.Height = (stock * 20);
                }
                else
                {
                    stock = 25;
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

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

   
}