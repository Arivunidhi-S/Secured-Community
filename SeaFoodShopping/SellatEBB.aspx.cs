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

public partial class SellatEBB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
        {
            lblName.Text = Session["sesUserID"].ToString() + "'s";
            lblWelcome.Text = "Account";
            lblWelcome.Font.Bold = true;
            lblName.Font.Bold = true;
            lblcart.Text = Session["Cart"].ToString();
            if (!(Session["sesUserID"].ToString().ToString() == ""))
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
            lblWelcome.Text = "My Account";
            lblLog.Text = "Login";
        }
        if (!IsPostBack)
        {
            FillCapctha();
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

    private string ValidateNull()
    {
        Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
        string strRet = "";
        if (txtCompanyName.Text.ToString().Trim() == string.Empty)
            strRet = "Company name cannot be Empty. Please enter Valid Company name";
        else if (txtContactName.Text.ToString().Trim() == string.Empty)
            strRet = "Contact Person cannot be Empty. Please enter Valid Contact Person";
        else if (txtContactNo.Text.ToString().Trim() == string.Empty)
            strRet = "Contact No cannot be Empty. Please enter Valid Contact No";
        else if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
            strRet = "Email ID Format is Worng";
        else if (txtProductsSupply.Text.ToString().Trim() == string.Empty)
            strRet = "Products to Supply cannot be Empty. Please enter Valid Products to Supply";
        else
            strRet = "Y";
        return strRet;
    }

    protected void btnsumit_OnClick(object sender, EventArgs e)
    {
        try
        {
            string val = ValidateNull();
            if (val == "Y")
            {
                if (Session["captcha"].ToString() == txtCaptcha.Text)
                {

                    MailMessage message1 = new MailMessage();
                    message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                    message1.To.Add(new MailAddress(ConfigurationManager.AppSettings["MailAddress2"].ToString()));
                    message1.CC.Add(new MailAddress("arivu@e-serbadk.com"));
                    message1.CC.Add(new MailAddress("charan@e-serbadkgroup.com"));
                    message1.CC.Add(new MailAddress("ariffahimy@e-serbadkgroup.com"));
                    message1.Subject = "Supplier Register";
                    string strbody = string.Empty;

                    strbody = "<table border='0' width='100%'><tr><td><table border='1' width='100%'>";
                    strbody = strbody + "<tr><td style='width: 70px'>Company Name : </td> <td> <b>" + txtCompanyName.Text.ToString().ToString() + "</b> </td></tr>";
                    strbody = strbody + "<tr><td>Contact Person : </td> <td> " + txtContactName.Text.ToString().ToString() + " </td></tr>";
                    strbody = strbody + "<tr><td>Contact No : </td> <td> " + txtContactNo.Text.ToString().ToString() + " </td></tr>";
                    strbody = strbody + "<tr><td>Email : </td> <td> " + txtEmail.Text.ToString().ToString() + " </td></tr>";
                    strbody = strbody + "<tr><td>Website : </td> <td> <i>" + txtWebsite.Text.ToString().ToString() + " </i></td></tr>";
                    strbody = strbody + "<tr><td>Products to Supply : </td> <td> " + txtProductsSupply.Text.ToString().ToString() + " </td></tr>";
                    strbody = strbody + "<tr><td  style='vertical-align:top;'>Company Address : </td> <td> " + txtCompanyAddress.Text.ToString().ToString() + " </td></tr></table></td></tr></table>";
                    message1.IsBodyHtml = true;
                    message1.Body = strbody;
                    //message1.Body = strbody;
                    SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                    client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                    //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //client1.EnableSsl = true;
                    client1.Send(message1);

                    lblStatus.Text = "You have Sucessfully Register!";
                    lblStatus.ForeColor = Color.Green;
                    txtCompanyName.Text = "";
                    txtContactName.Text = "";
                    txtContactNo.Text = "";
                    txtEmail.Text = "";
                    txtWebsite.Text = "";
                    txtCompanyAddress.Text = "";
                    txtCaptcha.Text = "";
                    FillCapctha();
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
            lblStatus.Text = ex.ToString();
        }
    }
}