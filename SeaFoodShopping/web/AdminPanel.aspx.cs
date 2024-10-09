using System;
using System.IO;
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
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;

public partial class AdminPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                SqlConnection connSave = BusinessTier.getConnection();
                connSave.Open();
                connSave.Close();
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                //lblName.Text = textInfo.ToTitleCase(Session["AdminID"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!(string.IsNullOrEmpty(Session["AdminID"].ToString())))
        {
            //lblWelcome.Visible = true;
            //lblName.Text = Session["AdminID"].ToString();
        }
        else
        {
            //lblWelcome.Visible = false; 
        }
    }

    protected void TestMail_Onclick(object sender, EventArgs e)
    {
        //lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            string sql = "select * from [Newsletter]", Subject = string.Empty, msg = string.Empty;

            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Subject = reader["Subject"].ToString();
                msg = reader["MailContent"].ToString();
            }

            BusinessTier.DisposeReader(reader);

            string sql1 = "select * from [LeadEmail]";

            SqlCommand cmd1 = new SqlCommand(sql1, conn);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            while (reader1.Read())
            {
                sendmail(reader1["Email"].ToString(), Subject.ToString(), msg.ToString());
            }

            BusinessTier.DisposeReader(reader1);
            BusinessTier.DisposeConnection(conn);
            //lblStatus.Text = "You have Sucessfully sent email";
            //lblStatus.ForeColor = Color.Green;
        }
        catch (Exception ex)
        {
            //lblStatus.Text = ex.ToString();
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    private string sendmail(string tomail, string subject, string msg)
    {
        MailMessage message1 = new MailMessage();
        message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
        //message1.From = new MailAddress(Session["Email"].ToString().Trim());
        message1.To.Add(new MailAddress(tomail.ToString().Trim()));
        message1.ReplyToList.Add(ConfigurationManager.AppSettings["MailAddress"].ToString());
        message1.Subject = subject.ToString();

        message1.IsBodyHtml = true;
        message1.Body = msg;
        SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
        client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
        //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client1.EnableSsl = true;
        client1.Send(message1);
        return null;
    }

}