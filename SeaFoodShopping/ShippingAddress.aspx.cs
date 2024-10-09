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


public partial class ShippingAddress : System.Web.UI.Page
{
    //public string PromotionID = "0", breakamount = string.Empty;

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblLog.Text = "Logout";
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;

                txtState.ToolTip = Session["PromotionID"].ToString();
                txtCaptcha.ToolTip = Session["breakamount"].ToString();
                lblStatus.ToolTip = Session["GrandTotal"].ToString();

                String today = DateTime.Now.ToString();
                DateTime dtinsDate = DateTime.Parse(today);
                today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

                string sql = "select count(*) as Cart  from AddCartMaster where DELETED=0 and buy=0 and Customerid='" + Session["CustomerID"].ToString() + "' and CREATED_DATE='" + today.ToString() + "'";
                SqlCommand cmd = new SqlCommand(sql, connMenu);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblcart.Text = reader["Cart"].ToString();
                    Session["Cart"] = reader["Cart"].ToString();
                }
                BusinessTier.DisposeReader(reader);

                SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
                dtMenuItems.Load(readerMenulist);
                BusinessTier.DisposeReader(readerMenulist);

                BusinessTier.DisposeConnection(connMenu);

            }
            else { lblWelcome.Text = "My Account"; lblLog.Text = "Login"; }

        }
        catch (Exception ex)
        {
            BusinessTier.DisposeConnection(connMenu);
            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "ShippingAddress", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("index.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                FillCapctha();
            }
        }
        catch (Exception ex)
        {

            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "ShippingAddress", "Page_Load", ex.ToString(), "Audit");
            Response.Redirect("index.aspx");
        }
    }

    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "23456789ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Session["captcha"] = captcha.ToString();
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }

        catch
        {
            throw;
        }

    }

    protected void btnBuy_OnClick(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string val = ValidateNull();
            if (val == "Y")
            {

                if (Session["captcha"].ToString() == txtCaptcha.Text)
                {
                  
                    if (string.IsNullOrEmpty(txtState.ToolTip.ToString()))
                    {
                        txtState.ToolTip = "0";
                    }
                    if (string.IsNullOrEmpty(txtCountry.ToolTip.ToString()))
                    {
                        txtCaptcha.ToolTip = "0";
                    }

                    /// ************ For get orderno from AddCartMaster Table  ************ ///
                    int orderid = 0, shippingid = 0, i = 0;
                    String Insdate = DateTime.Now.ToString();
                    DateTime dtinsDate = DateTime.Parse(Insdate);
                    Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

                    string sql = "SELECT distinct(orderno) as orderid from AddCartMaster where DELETED=0 and buy=0 and Customerid='" + Session["CustomerID"].ToString().Trim() + "' and CREATED_DATE='" + Insdate.ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // orderid = 2;
                        orderid = Convert.ToInt32(reader["orderid"].ToString());
                    }
                    BusinessTier.DisposeReader(reader);

                    /// ************ For Insert ShippingAddress Table ************ ///
                    int flg = 0;
                    flg = BusinessTier.InsertShippingAddress(conn, 1, cboAddress.Text.ToString().Trim(), Convert.ToInt32(txtMobile.Text.ToString().Trim()), txtEmail.Text.ToString().Trim(), txtAddress1.Text.ToString().Trim(), txtAddress2.Text.ToString().Trim(), txtAddress3.Text.ToString().Trim(), txtPostCode.Text.ToString().Trim(), txtCity.Text.ToString().Trim(), txtState.Text.ToString().Trim(), txtCountry.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), txtState.ToolTip.ToString(), lblStatus.ToolTip.ToString(), txtCaptcha.ToolTip.ToString(), rdPaymentMethod.SelectedItem.Text.ToString(), orderid.ToString(), Session["CustomerID"].ToString().Trim(), "N");
                   
                    /// ************ For get ShippingID from ShippingAddress Table  ************ ///
                    string sql1 = "select max(ShippingID) as ShippingID from ShippingAddress where DELETED=0 and Customerid='" + Session["CustomerID"].ToString().Trim() + "' and CREATED_DATE='" + Insdate.ToString() + "'";
                    SqlCommand cmd1 = new SqlCommand(sql1, conn);
                    SqlDataReader reader1 = cmd1.ExecuteReader();
                    if (reader1.Read())
                    {
                        shippingid = Convert.ToInt32(reader1["ShippingID"].ToString());
                    }
                    BusinessTier.DisposeReader(reader1);

                    /// ************ ************ ************ ************ ************ ************ ///q
                    if (rdPaymentMethod.SelectedValue.ToString() == "1")
                    {
                        Response.Redirect("CashOnDelivery.aspx?param1=" + shippingid, false);
                    }
                    else if (rdPaymentMethod.SelectedValue.ToString() == "2")
                    {
                        /// ************ For Select All Product Description in Vw_AddCart   ************ ///
                        string[] Brand = new string[20];
                        string ProdDesc = string.Empty;
                        string sql2 = "SELECT Brand from Vw_AddCart where DELETED=0 and buy=0 and Customerid='" + Session["CustomerID"].ToString().Trim() + "' and CREATED_DATE='" + Insdate.ToString() + "'";
                        SqlCommand cmd2 = new SqlCommand(sql2, conn);
                        SqlDataReader reader2 = cmd2.ExecuteReader();
                        while (reader2.Read())
                        {
                            Brand[i] = reader2["Brand"].ToString();
                            if (i == 0)
                            {
                                ProdDesc = Brand[i].ToString();
                            }
                            else
                            {
                                ProdDesc = ProdDesc.ToString().Trim() + " " + Brand[i].ToString();
                            }
                            i = i + 1;
                        }
                        BusinessTier.DisposeReader(reader2);

                        /// ************ ************ ************ ************ ************ ************ ///
                        /// 
                        /// 
                        /// 
                        /// 
                        /// ************ For Insert BankStatement Table ************ ///
                        string amount = lblStatus.ToolTip.ToString();
                        var GatewayId = ConfigurationManager.AppSettings["GatewayId"].ToString(CultureInfo.InvariantCulture);
                        var SecretKey = ConfigurationManager.AppSettings["SecretKey"].ToString(CultureInfo.InvariantCulture);
                        BusinessTier.BankStatement(conn, shippingid.ToString(), orderid.ToString(), GatewayId.ToString(), lblStatus.ToolTip.ToString(), "MYR", ProdDesc.ToString(), cboAddress.Text.ToString(), txtEmail.Text.ToString(), txtMobile.Text.ToString(), Session["CustomerID"].ToString().Trim(), "N");
                        BusinessTier.DisposeConnection(conn);


                        var ReturnURL = ConfigurationManager.AppSettings["ImagePath"].ToString() + "OrderConfirmation.aspx?param1=" + shippingid.ToString();
                        //var ReturnURL = ConfigurationManager.AppSettings["ImagePath"].ToString() + "test.aspx?param1=" + shippingid.ToString();
                        //var ReturnURL = ConfigurationManager.AppSettings["ImagePath"].ToString() + "test.aspx";
                        var BackendURL = ConfigurationManager.AppSettings["ImagePath"].ToString() + "BackEndProcess.aspx?param1=" + shippingid.ToString();
                        /// ************ ************ ************ ************ ************ ************ ///
                        /// 
                        /// 
                        /// 
                        /// 
                        /// ************ For Insert BankStatement Table ************ ///
                        Response.Write("<form name='frmTransaction' id='FMQ' action='https://qpayi.com:9100/api/gateway/v1.0' method='post' >");
                        Response.Write("<input type='hidden' name='action' value='capture' />");
                        Response.Write("<input type='hidden' name='gatewayId' value='" + GatewayId + "'>");
                        Response.Write("<input type='hidden' name='secretKey' value='" + SecretKey + "'>");
                        Response.Write("<input type='hidden' name='referenceId' value='" + orderid.ToString() + "'>");
                        Response.Write("<input type='hidden' name='amount' value='" + amount.ToString() + "'>");
                        Response.Write("<input type='hidden' name='currency' value='QAR'>");
                        Response.Write("<input type='hidden' name='mode' value='TEST'>");
                        Response.Write("<input type='hidden' name='description' value='" + ProdDesc.ToString() + "'>");
                        Response.Write("<input type='hidden' style='width:500px' name='returnUrl' value='" + ReturnURL.ToString() + "'>");
                        Response.Write("<input type='hidden' name='name' value='" + cboAddress.Text.ToString() + "'>");
                        Response.Write("<input type='hidden' style='width:500px' name='address' value='" + txtAddress1.Text + "," + txtAddress2.Text + "'>");
                        Response.Write("<input type='hidden' name='city' value='" + txtCity.Text.ToString() + "'>");
                        Response.Write("<input type='hidden' name='state' value='" + txtState.Text.ToString() + "'>");
                        Response.Write("<input type='hidden' name='country' value='" + txtCountry.SelectedValue.ToString() + "'>");
                        Response.Write("<input type='hidden' name='phone' value='" + txtMobile.Text.ToString() + "'>");
                        Response.Write("<input type='hidden' name='email' value='" + txtEmail.Text.ToString() + "'>");
                        Response.Write("</form>");
                        Response.Write("<script>FMQ.submit();</script>");
                    }
                }
                else
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = "Invalid Captcha Try again";
                    FillCapctha();
                }
            }
            else
            {
                lblStatus.Text = val.ToString();
                lblStatus.ForeColor = Color.Red;
            }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "ShippingAddress", "btnBuy_OnClick", ex.ToString(), "Audit");
            lblStatus.Text = ex.Message.ToString();
            lblStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    private string ValidateNull()
    {
        Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
        string strRet = "";
        Regex charregex = new Regex(@"[^a-zA-Z0-9\s.]");
        if (cboAddress.Text.ToString().Trim() == string.Empty)
            strRet = "Name cannot be Empty. Please enter Valid Name";
        else if ((charregex.IsMatch(cboAddress.Text.ToString().Trim())))
            strRet = "No special characters on the Name are allowed";
        else if (txtEmail.Text.ToString().Trim() == string.Empty)
            strRet = "Email cannot be Empty. Please enter Valid Email";
        else if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
            strRet = "Email ID Format is Worng";
        else if (txtMobile.Text.ToString().Trim() == string.Empty)
            strRet = "Mobile cannot be Empty. Please enter Valid Mobile";
        else if (txtAddress1.Text.ToString().Trim() == string.Empty)
            strRet = "Address1 cannot be Empty. Please enter Valid Address";
        else if (rdPaymentMethod.SelectedValue.ToString().Trim() == string.Empty)
            strRet = "Please Choose Payment Method";
        else
            strRet = "Y";

        return strRet;
    }

    private string GetVCode(string input)
    {
        //var result = "";

        SHA1CryptoServiceProvider objSHA1 = new SHA1CryptoServiceProvider();

        objSHA1.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));

        byte[] buffer = objSHA1.Hash;
        string HashValue = System.Convert.ToBase64String(buffer);

        return HashValue;


        //return result;
    }

    private string InitiateMolPayment(int orderId, int shippingId)
    {
        var order = orderId;
        var MerchantCode = ConfigurationManager.AppSettings["MerchantId"].ToString(CultureInfo.InvariantCulture);
        //test("ok");
        var verifyKey = ConfigurationManager.AppSettings["VerifyKey"].ToString(CultureInfo.InvariantCulture);
        //test("ok1");

        string amount = Session["GrandTotal"].ToString();

        // var Signature = GetVCode(verifyKey.ToString() + MerchantCode.ToString() + order.ToString() + amount.Replace(".", string.Empty) + "MYR");
        var Signature = GetVCode(verifyKey.ToString() + MerchantCode.ToString() + order.ToString() + "100MYR");
        //test("ok2");
        // var returnurl = ConfigurationManager.AppSettings["ImagePath"].ToString() + "OrderConfirmation.aspx";
        var returnurl = "http://www.serbaitproducts.com/E-Shopping/OrderConfirmation.aspx";
        //test("ok3");

        var paymentUrl = "https://www.mobile88.com/ePayment/entry.asp" + "?MerchantCode=" + MerchantCode + "&PaymentId=" + "&RefNo=" + order.ToString() + "&Amount=1.00" + "&Currency=MYR" +
                          "&ProdDesc=" + MerchantCode + "&UserName=" + cboAddress.Text.ToString() + "&UserEmail=" + txtEmail.Text.ToString() + "&UserContact=" + txtMobile.Text.ToString() +
                          "&Remark=" + "&Lang=UTF-8" + "&Signature=" + Signature + "&ResponseURL=" + returnurl.ToString() + "&BackendURL=" + returnurl.ToString();
        //test("ok4");
        return paymentUrl;
    }

    private string test(string test)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string sql = "INSERT INTO test([test]) VALUES('" + test.ToString() + "')";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            conn.Close();
        }
        return null;
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void cboAdress_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {

            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            string sql1 = "";
            sql1 = "select * from MasterAddress where DELETED=0 and [Name] LIKE @text + '%' and CREATED_BY='" + Session["CustomerID"].ToString() + "'  order by [Name]";
            SqlDataAdapter adapter1 = new SqlDataAdapter(sql1, conn);
            adapter1.SelectCommand.Parameters.AddWithValue("@Text", e.Text);
            DataTable dataTable1 = new DataTable();
            adapter1.Fill(dataTable1);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dataTable1.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Name"].ToString().Trim();
                item.Value = row["AddressId"].ToString().Trim();
                //item.Attributes.Add("Address", row["Address"].ToString().Trim());
                comboBox.Items.Add(item);
                item.DataBind();
            }
            adapter1.Dispose();
            BusinessTier.DisposeConnection(conn);

        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "AssignStaff", "cboProject_ItemrequestedChanged", ex.ToString(), "Audit");
        }

    }

    protected void cboAdress_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        try
        {
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            string sql = "Select * from MasterAddress where AddressId='" + cboAddress.SelectedValue.ToString() + "' and deleted=0";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                //txtName.Text = (rd["Name"].ToString());

                txtMobile.Text = (rd["Mobile"].ToString());
                txtEmail.Text = (rd["Email"].ToString());

                txtAddress1.Text = (rd["Address1"].ToString());
                txtAddress2.Text = (rd["Address2"].ToString());
                txtAddress3.Text = (rd["Address3"].ToString());
                txtPostCode.Text = (rd["Postcode"].ToString());
                txtCity.Text = (rd["City"].ToString());
                txtState.Text = (rd["State"].ToString());
                txtCountry.Text = (rd["Country"].ToString());
                txtCountry.ToolTip = (rd["AddressId"].ToString());
            }
            BusinessTier.DisposeReader(rd);
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {

        }

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

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }
}