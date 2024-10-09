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
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;
using System.Text;
using System.Net.Mail;

public partial class AccontInfo : System.Web.UI.Page
{

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

                string sql = "select * from BusinessRegister where DELETED=0 and BusinessID='" + Session["CustomerID"].ToString() + "' ";
                SqlCommand cmd = new SqlCommand(sql, connMenu);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtBusinessname.Text = reader["BusinessName"].ToString();
                    txtName.Text = reader["Name"].ToString();
                    txtICnumber.Text = reader["ICno"].ToString();
                    txtContact.Text = reader["Contactno"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    cboGender.Text = reader["Gender"].ToString();
                    string line = reader["DOB"].ToString();
                    string[] tokens = line.Split(new char[] { '/' }, 3, 0);
                    //string strLink = tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    cboDate.Text = tokens[0].ToString();
                    cboMonth.Text = tokens[1].ToString();
                    cboYear.Text = tokens[2].ToString();
                    //txtState.Text = reader["State"].ToString();
                    //txtPostcode.Text = reader["Postcode"].ToString();
                    //txtPassword.Text = reader["Password"].ToString();
                    //txtRetypePassword.Text = reader["ShipCost"].ToString();
                }
                BusinessTier.DisposeReader(reader);

                SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
                dtMenuItems.Load(readerMenulist);
                BusinessTier.DisposeReader(readerMenulist);

                BusinessTier.DisposeConnection(connMenu);
                //Response.Redirect("index.aspx");
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";


            }
            else
            {
                Response.Redirect("Login.aspx", false);
                //TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                //lblName.Text = textInfo.ToTitleCase(Session["sesUserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AccontInfo", "Page_Init", ex.ToString(), "Audit");
            //lblStatus.Text = ex.ToString();

            Response.Redirect("index.aspx", false);
        }

        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
        }
        lblcart.Text = Session["Cart"].ToString();
    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
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

    protected void btnAddCategory_OnClick(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {

            //string sql = "select * from BusinessRegister where Email ='" + txtEmail.Text.ToString().Trim() + "' and deleted=0";

            //SqlCommand cmd = new SqlCommand(sql, conn);
            //SqlDataReader reader = cmd.ExecuteReader();
            //if (reader.Read())
            //{
            //    lblStatus.ForeColor = System.Drawing.Color.Red;
            //    lblStatus.Text = "Your email id is already have. try another email id.";
            //    return;
            //}

            //BusinessTier.DisposeReader(reader);
            string val = ValidateNull();
            if (val == "Y")
            {
                if (Session["captcha"].ToString() == txtCaptcha.Text)
                {
                    string dob = cboDate.Text.ToString() + "/" + cboMonth.Text.ToString() + "/" + cboYear.Text.ToString();
                    int flg = BusinessTier.BusinessRegister(conn, Convert.ToInt32(Session["CustomerID"].ToString()), txtBusinessname.Text.ToString().Trim(), "", txtName.Text.ToString().Trim(), txtICnumber.Text.ToString().Trim(), txtContact.Text.ToString().Trim(), txtEmail.Text.ToString().Trim(), "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "Malaysia", 0, 006, "Buyer", "", cboGender.Text.ToString(), dob.ToString(), "1", "BU");
                    BusinessTier.DisposeConnection(conn);
                    if (flg >= 1)
                    {
                        MailMessage message1 = new MailMessage();
                        message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                        //message1.From = new MailAddress(Session["Email"].ToString().Trim());
                        message1.To.Add(new MailAddress(txtEmail.Text.ToString().Trim()));

                        message1.Subject = "Bussiness Register";
                        string msg = string.Empty;
                        msg = "Dear " + txtName.Text.ToString() + ",\n\n" + "You have Successfully Changed your details on EasyBuyBye.com.  \nThank you\n\nby, \nAdmin";
                        message1.Body = msg;
                        SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                        client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                        //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                        //client1.EnableSsl = true;
                        // client1.Send(message1);

                        lblStatus.Text = "You have Sucessfully Updated!";
                        lblStatus.ForeColor = Color.Green;
                        //Response.Redirect("index.aspx");
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
            lblStatus.Text = ex.Message.ToString();
            lblStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }


    }

    protected void lnkChangePassword_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx?Param1=b&Param=" + txtEmail.Text.ToString(), false);
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    private string ValidateNull()
    {
        Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
        string strRet = "";
        Regex charregex = new Regex(@"[^a-zA-Z0-9\s.]");
        if (txtName.Text.ToString().Trim() == string.Empty)
            strRet = "Name Cannot Be Empty. Please Enter Valid Name";
        else if ((charregex.IsMatch(txtName.Text.ToString().Trim())))
            strRet = "No special characters on the Name are allowed";
        else if (cboGender.Text.ToString().Trim() == string.Empty)
            strRet = "Gender Cannot Be Empty. Please Select Valid Gender";
        else if (cboDate.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Date";
        else if (cboMonth.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Month";
        else if (cboYear.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Year";
        else if (txtContact.Text.ToString().Trim() == string.Empty)
            strRet = "Contact Number Cannot Be Empty. Please Enter Valid Contact Number";
        //else if (txtEmail.Text.ToString().Trim() == string.Empty)
        //    strRet = "Email cannot be Empty. Please enter Valid Email";
        //else if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
        //    strRet = "Email ID Format is Worng";
        //else if (txtPassword.Text.ToString().Trim() == string.Empty)
        //    strRet = "Password cannot be Empty. Please enter Valid Password";
        //else if (txtRetypePassword.Text.ToString().Trim() == string.Empty)
        //    strRet = "Please re-enter same Password";
        //else if (txtPassword.Text.ToString().Trim() != txtRetypePassword.Text.ToString().Trim())
        //    strRet = "Password doesn't match. Please re-enter the Password";
        else
            strRet = "Y";
        return strRet;
    }

    protected void cboDate_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            for (int i = 1; i <= 31; i++)
            {
                RadComboBoxItem item = new RadComboBoxItem();

                item.Text = i.ToString();
                item.Value = i.ToString();

                comboBox.Items.Add(item);
                item.DataBind();
            }

        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboMonth_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            for (int i = 1; i <= 12; i++)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = i.ToString();
                item.Value = i.ToString();

                comboBox.Items.Add(item);
                item.DataBind();
            }

        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboYear_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            for (int i = 1935; i <= 2010; i++)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = i.ToString();
                item.Value = i.ToString();

                comboBox.Items.Add(item);
                item.DataBind();
            }

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