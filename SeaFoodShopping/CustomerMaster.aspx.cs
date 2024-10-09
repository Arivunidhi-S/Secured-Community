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

public partial class CustomerMaster : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
            {
                if (!(Session["sesUserID"].ToString().Trim() == ""))
                {
                    lblLog.Text = "Logout";
                }
                else
                {
                    lblLog.Text = "Login";
                }
            }
            else
            {
                lblLog.Text = "Login";
            }
            if (!IsPostBack)
            {
                FillCapctha();
                lblcart.Text = Session["Cart"].ToString();
            }
        }
        catch (Exception ex)
        {
            Session["AddCart"] = "";
            Session["sesUserID"] = "";
            Session["CustomerID"] = "";
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
            Response.Redirect("index.aspx", false);
        }
        else
        {
            Response.Redirect("Login.aspx", false);
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

    protected void btnAddCategory_OnClick(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {

            string sql = "select * from BusinessRegister where Email ='" + txtEmail.Text.ToString().Trim() + "' and deleted=0";

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "** Email Address Already Exists Try Another Email  **";
                return;
            }

            BusinessTier.DisposeReader(reader);
            string val = ValidateNull();
            if (val == "Y")
            {
                if (Session["captcha"].ToString() == txtCaptcha.Text)
                {
                    string dob = cboDate.Text.ToString() + "/" + cboMonth.Text.ToString() + "/" + cboYear.Text.ToString();
                    //int flg = 2;
                    int flg = BusinessTier.BusinessRegister(conn, 1, txtBusinessname.Text.ToString().Trim(), "", txtName.Text.ToString().Trim(), txtICnumber.Text.ToString().Trim(), txtContact.Text.ToString().Trim(), txtEmail.Text.ToString().Trim(), "", txtPassword.Text.ToString().Trim(), "", "", "", "", "", 0, "", "", "", "", "", "", "", "Malaysia", 0, 006, "Buyer", "", cboGender.Text.ToString(), dob.ToString(), "1", "N");
                    BusinessTier.DisposeConnection(conn);
                    if (flg >= 1)
                    {
                        string Subject = "Fish Market Registration";
                        string msg = string.Empty;
                        msg = "<font face='Cambria Math'>Dear " + txtName.Text.ToString() + ",<br><br>" + "You have Successfully Register with Fishmarket <a href=" + ConfigurationManager.AppSettings["ImagePath"].ToString() + "EmailVerification.aspx?Param=" + txtEmail.Text.ToString().Trim() + ">Click Here</a> to validate your email and login.";
                        msg = msg + "<br><br><b>Your Login Details:</b><br> Username: <span style='background-color: #ffff42'> " + txtEmail.Text.ToString() + "</span><br> Password:<span style='background-color: #ffff42'> " + txtPassword.Text.ToString() + "</span><br><br>";
                        msg = msg + "Enjoy your Shopping at Fishmarket !!! <br><br> Thanks & Regards<br><table border='1' bordercolor='#b4b1b4' style='border: 1px solid; border-collapse: collapse;'><tr><td> <b>Admin</b><br> Fishmarket <br>Qatar</td><td><a href='http://fishmarket.com.qa' style='text-decoration: none'><img src='" + ConfigurationManager.AppSettings["ImagePath"].ToString() + "web/images/MailLogo.png' alt='' /></a></td></tr><tr align='center'><td colspan='2'><a href='http://fishmarket.com.qa' style='text-decoration: none'>Fishmarket.com.qa </a></td></tr></table> </font>";
                        
                        BusinessTier.SendMail(txtEmail.Text.ToString(), Subject, msg);
                        lblStatus.Text = "** You have Successfully Registered! Please go to your registered email address and click the given link **";
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
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "CustomerMaster", "btnAddCategory_OnClick", ex.ToString(), "Audit");
            //lblStatus.Text = ex.Message.ToString();
            //lblStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }


    }

    private string ValidateNull()
    {
        Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
        Regex charregex = new Regex(@"[^a-zA-Z0-9\s.]");
        string strRet = "";
        if (cboGender.Text.ToString().Trim() == string.Empty)
            strRet = "Gender Cannot Be Empty. Please Select Valid Gender";
        else if (txtName.Text.ToString().Trim() == string.Empty)
            strRet = "Name Cannot Be Empty. Please Enter Valid Name";
        else if ((charregex.IsMatch(txtName.Text.ToString().Trim())))
            strRet = "No special characters on the Name are allowed";
        else if (cboDate.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Date";
        else if (cboMonth.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Month";
        else if (cboYear.Text.ToString().Trim() == string.Empty)
            strRet = "Date Of Birth Cannot Be Empty. Please Select Valid Year";
        else if (txtEmail.Text.ToString().Trim() == string.Empty)
            strRet = "Email Cannot Be Empty. Please Enter Valid Email";
        else if (txtContact.Text.ToString().Trim() == string.Empty)
            strRet = "Contact number cannot be Empty. Please enter Valid Mobile";

        else if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
            strRet = "** Invalid Email Address **";

        else if (txtPassword.Text.ToString().Trim() == string.Empty)
            strRet = "Password Cannot Be Empty. Please Enter Valid Password";
        else if (txtRetypePassword.Text.ToString().Trim() == string.Empty)
            strRet = "Please Re-Enter Same Password";
        else if (txtPassword.Text.ToString().Trim() != txtRetypePassword.Text.ToString().Trim())
            strRet = "Password Doesn't Match. Please Re-Enter The Password";
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