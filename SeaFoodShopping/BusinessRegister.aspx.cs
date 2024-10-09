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

public partial class BusinessRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCapctha();
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

    protected void btnBusinessRegister_OnClick(object sender, EventArgs e)
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
                lblStatus.Text = "** Email Address Already Exists **";
                return;
            }

            BusinessTier.DisposeReader(reader);

            string val = ValidateNull();
            if (val == "Y")
            {
                if (Session["captcha"].ToString() == txtCaptcha.Text)
                {
                    String path = string.Empty, path1 = string.Empty, DocFilePath1 = string.Empty, DocFilePath2 = string.Empty, DocFilePath3 = string.Empty, DocFilePath4 = string.Empty, DocFilePath5 = string.Empty, DocFilePath6 = string.Empty;
                    //path = WebConfigurationManager.AppSettings["WC_ImagePath"].ToString();
                    path = Server.MapPath("");
                    path += "\\Documents\\";
                    //path1 = WebConfigurationManager.AppSettings["DocumentsPath"].ToString();

                    if (!(string.IsNullOrEmpty(FileDoc1.FileName.ToString())))
                    {
                        FileDoc1.SaveAs(path + FileDoc1.FileName);
                        //image1 = path + FileDoc1.FileName;
                        DocFilePath1 = FileDoc1.FileName;
                    }
                    if (!(string.IsNullOrEmpty(FileDoc2.FileName.ToString())))
                    {
                        FileDoc2.SaveAs(path + FileDoc2.FileName);
                        DocFilePath2 = FileDoc2.FileName;
                    }
                    if (!(string.IsNullOrEmpty(FileDoc3.FileName.ToString())))
                    {
                        FileDoc3.SaveAs(path + FileDoc3.FileName);
                        DocFilePath3 =  FileDoc3.FileName;
                    }
                    if (!(string.IsNullOrEmpty(FileDoc4.FileName.ToString())))
                    {
                        FileDoc4.SaveAs(path + FileDoc4.FileName);
                        DocFilePath4 = FileDoc4.FileName;
                    }
                    if (!(string.IsNullOrEmpty(FileDoc5.FileName.ToString())))
                    {
                        FileDoc5.SaveAs(path + FileDoc5.FileName);
                        DocFilePath5 =  FileDoc5.FileName;
                    }
                    if (!(string.IsNullOrEmpty(FileDoc6.FileName.ToString())))
                    {
                        FileDoc6.SaveAs(path + FileDoc6.FileName);
                        DocFilePath6 =  FileDoc6.FileName;
                    }


                    int flg = BusinessTier.BusinessRegister(conn, 1, txtBusinessname.Text.ToString().Trim(), txtRegno.Text.ToString().Trim(), txtName.Text.ToString().Trim(), txtICnumber.Text.ToString().Trim(), txtContact.Text.ToString().Trim(), txtEmail.Text.ToString().Trim(), txtAddress.Text.ToString().Trim(), txtPassword.Text.ToString().Trim(), txtBank.Text.ToString().Trim(), txtAccountHolder.Text.ToString().Trim(), txtAccountno.Text.ToString().Trim(), txtBranchName.Text.ToString().Trim(), rdoButtonSettlementMethod.SelectedItem.Text.ToString().Trim(), 0, DocFilePath1.ToString(), DocFilePath2.ToString(), DocFilePath3.ToString(), DocFilePath4.ToString(), DocFilePath5.ToString(), DocFilePath6.ToString(), txtState.Text.ToString().Trim(), "Malaysia", Convert.ToInt32(txtPostcode.Text.ToString().Trim()), 006, "Business", "", "", "", "1", "N");
                    BusinessTier.DisposeConnection(conn);
                    if (flg >= 1)
                    {
                        MailMessage message1 = new MailMessage();
                        message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                        //message1.From = new MailAddress(Session["Email"].ToString().Trim());
                        message1.To.Add(new MailAddress(txtEmail.Text.ToString().Trim()));

                        message1.Subject = "EasyBuyBye Registration";
                        string msg = string.Empty;
                        msg = "Dear " + txtName.Text.ToString() + ",\n\n" + "You have Successfully Register on EasyBuyBye.com. You have approval soon on after verification of your documents.  \n Try this link to login " + ConfigurationManager.AppSettings["ImagePath"].ToString() + "EmailVerification.aspx?Param=" + txtEmail.Text.ToString().Trim() + " \nThank you\n\nby, \nAdmin";
                        message1.Body = msg;
                        SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                        client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                        //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                        //client1.EnableSsl = true;
                        client1.Send(message1);

                        lblStatus.Text = "You have Sucessfully Register!";
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

    private string ValidateNull()
    {
        Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
        string strRet = "";
        if (txtBusinessname.Text.ToString().Trim() == string.Empty)
            strRet = "Company name cannot be Empty. Please enter Valid Company name";
        else if (txtRegno.Text.ToString().Trim() == string.Empty)
            strRet = "Business Registration Number cannot be Empty. Please enter Valid Business Registration Number";
        else if (txtName.Text.ToString().Trim() == string.Empty)
            strRet = "ContactName cannot be Empty. Please enter Valid ContactName";
        else if (txtContact.Text.ToString().Trim() == string.Empty)
            strRet = "ContactNumber cannot be Empty. Please enter Valid ContactNumber";
        else if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
            strRet = "Email ID Format is Worng";
        else if (txtPassword.Text.ToString().Trim() == string.Empty)
            strRet = "Password cannot be Empty. Please enter Valid Password";
        else if (txtRetypePassword.Text.ToString().Trim() == string.Empty)
            strRet = "Please re-enter same Password";
        else if (txtPassword.Text.ToString().Trim() != txtRetypePassword.Text.ToString().Trim())
            strRet = "Password doesn't match. Please re-enter the Password";
        else
            strRet = "Y";
        return strRet;
    }

}