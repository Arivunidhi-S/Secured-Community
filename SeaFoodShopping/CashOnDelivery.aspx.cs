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
using Telerik.Web.UI.Calendar;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;
using System.Text;
using System.Net.Mail;
using System.Security.Cryptography;

public partial class CashOnDelivery : System.Web.UI.Page
{
    public DataTable dtPreview = new DataTable();
  

    string Status = string.Empty;

    public string CustomerID = string.Empty, Name = string.Empty, Mobile = string.Empty, Email = string.Empty, Address1 = string.Empty, Address2 = string.Empty, PostCode = string.Empty, City = string.Empty, State = string.Empty, Country = string.Empty,Amount=string.Empty;

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("param1").ToString();
            lblOrderno.Text = @Param.ToString();
            lblstatus.Text = "Thank you! You Will Receive Your Order With In 3 Hours.";
            lblstatus.ForeColor = Color.Green;
            string sql = "select CustomerID,Name,Mobile,Email,Address1,Address2,PostCode,City,State,Country,sentamount,ReferenceID from ShippingAddress where DELETED=0 and ShippingID='" + @Param.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                CustomerID = reader["CustomerID"].ToString();
                Name = reader["Name"].ToString();
                Mobile = reader["Mobile"].ToString();
                Email = reader["Email"].ToString();
                Address1 = reader["Address1"].ToString();
                Address2 = reader["Address2"].ToString();
                PostCode = reader["PostCode"].ToString();
                City = reader["City"].ToString();
                State = reader["State"].ToString();
                Country = reader["Country"].ToString();
                Amount = reader["sentamount"].ToString();
                lblOrderno.Text = reader["ReferenceID"].ToString();
            }
            BusinessTier.DisposeReader(reader);
            lblstatus.Text = "Thank you! You Will Receive Your Order Within 30 minutes to 2 Hours";
            int update = BusinessTier.OrderConfirmation(connMenu, @Param.ToString().Trim(),
                        "success", @Param.ToString().Trim(),
                        "1", DateTime.Now.ToString("MM/dd/yyyy"),
                        Amount.ToString().Trim(), 
                        CustomerID.ToString().Trim(), "N");
            BusinessTier.DisposeConnection(connMenu);

            if (update >= 1)
            {
                string msg = string.Empty;
                msg = "<font face='Cambria Math'>Dear " + Name.ToString() + ",<br><br>" + "Your Order No # <b>" + lblOrderno.Text.ToString() + "</b> has been placed on <b>" + String.Format("{0:dddd, MMMM dd, yyyy hh:mm}", DateTime.Now) + "</b> via Cash On Delivery. <br><br> *Please take note delivery will be made within 30 minutes to 2 Hours.*<br><br>Your Order will be delivered to below address:<br><br><b>" + Name.ToString() + " <br>" + Address1.ToString() + " &nbsp;" + Address2.ToString() + " <br>" + PostCode.ToString() + " &nbsp;" + City.ToString() + " <br>" + State.ToString() + "  &nbsp;" + Country.ToString() + "</b>";
                msg = msg + "<br><br>Enjoy your Shopping at Fishmarket !!!<br><br>Thanks & Regards<br><table border='1' bordercolor='#b4b1b4' style='border: 1px solid; border-collapse: collapse;'><tr><td> <b>Admin</b><br> Fishmarket <br>Qatar</td><td><a href='http://fishmarket.com.qa' style='text-decoration: none'><img src='" + ConfigurationManager.AppSettings["ImagePath"].ToString() + "web/images/MailLogo.png' alt='' /></a></td></tr><tr align='center'><td colspan='2'><a href='http://fishmarket.com.qa' style='text-decoration: none'>Fishmarket.com.qa </a></td></tr></table> </font>";
               

                BusinessTier.SendMail(Email.ToString(), "Fish Market Cash On Delivery Order Confirmation", msg);
            }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(CustomerID.ToString(), "CashOnDelivery", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("shippingaddress.aspx");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    private string GetVCode(string input)
    {
        SHA1CryptoServiceProvider objSHA1 = new SHA1CryptoServiceProvider();

        objSHA1.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));

        byte[] buffer = objSHA1.Hash;
        string HashValue = System.Convert.ToBase64String(buffer);

        return HashValue;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            string @Param = string.Empty;
            //@Param = "31";
            @Param = Request.QueryString.Get("param1").ToString();
            string sql1 = "select count(*) as Cart, sum(DiscountPrice*Qnty) as Total, sum(ShippingCost*Qnty) as ShipCost from Vw_AddCart where DELETED=0 and PayMethod='Cash On Delivery' and ShippingID='" + @Param.ToString() + "'";
            SqlCommand cmd1 = new SqlCommand(sql1, connMenu);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            if (reader1.Read())
            {
                lblTotal.Text = Convert.ToDecimal(reader1["Total"]).ToString("#0.00");
                lblShippingCost.Text = Convert.ToDecimal(reader1["ShipCost"]).ToString("#0.00");
            }
            lblGrandTotal.Text = (Convert.ToDecimal(lblTotal.Text) + Convert.ToDecimal(lblShippingCost.Text)).ToString();
            BusinessTier.DisposeReader(reader1);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Page_Load", "CashOnDelivery", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
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
            Response.Redirect("index.aspx");
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_NeedDataSource", "CashOnDelivery", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {

        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();

        string @Param = string.Empty;
        //@Param = "31";
        @Param = Request.QueryString.Get("param1").ToString();
        String today = DateTime.Now.ToString();
        DateTime dtinsDate = DateTime.Parse(today);
        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
        DataTable g_datatable = new DataTable();
        string sql = "select * FROM Vw_AddCart WHERE shippingid='" + @Param.ToString() + "' and Deleted=0 and PayMethod='Cash On Delivery'  and Customerid='" + CustomerID.ToString() + "' ";  // and CREATED_DATE='" + today.ToString() + "'
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            Label cboQnty = (Label)e.Item.FindControl("cboQnty");
            RadComboBox cboQnty1 = (RadComboBox)e.Item.FindControl("cboQnty1");
            /*This Lable for inside Grid*/
            lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString("#0.00");
            decimal qty = Convert.ToDecimal(cboQnty.Text.ToString().Trim());
            string AddcartID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"].ToString();
            string ProductID = cboQnty.ToolTip.ToString().Trim();

            //if (Status.ToString() == "1")
            //{
            BusinessTier.Stock_Update(conn, AddcartID.ToString(), ProductID.ToString(), lblPrice.ToolTip.ToString(), Convert.ToDecimal(qty.ToString()), CustomerID.ToString().Trim(), "U");
            //}
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(CustomerID.ToString(), "CashOnDelivery", "RadGrid1_ItemDataBound", ex.ToString(), "Audit");
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

    protected void btnMoreBuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx", false);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        String path = string.Empty;
        path = WebConfigurationManager.AppSettings["ImagePath"].ToString();
        path += "\\web\\";
        string link = string.Empty;
        link = path + "\\Report.aspx?param1=" + lblOrderno.Text.ToString() + "&param2=Bill";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + link + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1000,height=900');", true);

    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }
}