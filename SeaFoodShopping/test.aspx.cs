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
using System.Security.Cryptography;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string @Param = string.Empty;
        //@Param = Request.QueryString.Get("param1").ToString();

       //Response.Write(Request.QueryString.Get("status").ToString()+"<br>");
       // Response.Write(Request.QueryString.Get("referenceId").ToString() + "<br>");
       // Response.Write(Request.QueryString.Get("transactionId").ToString() + "<br>");
       // Response.Write(Request.QueryString.Get("datetime").ToString() + "<br>");
       // Response.Write(Request.QueryString.Get("amount").ToString()); 

    }

    protected void btnChangePassword_OnClick(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            if (string.IsNullOrEmpty(txtEmail.Text.ToString()))
            {
                lblStatus.Text = "Please enter your email id";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            else
            {
                Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
                if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
                {
                    lblStatus.Text = "Email id format is worng";
                    lblStatus.ForeColor = Color.Red;
                    return;
                                    }
                string CustomerID = string.Empty, Name = string.Empty, Mobile = string.Empty, Email = string.Empty, Address1 = string.Empty, Address2 = string.Empty, PostCode = string.Empty, City = string.Empty, State = string.Empty, Country = string.Empty, Amount = string.Empty;
                Name = "Test";
                Address1 = "Test St";
                Address2 = "Test Lane";
                PostCode = "1230333";
                City = "AlJamir";
                State = "Doha";
                Country ="Qatar";
                string lblOrderno = "FMQ12345";

                string msg = string.Empty;
                msg = "<font face='Cambria Math'>Dear " + Name.ToString() + ",<br><br>" + "Your Order No # <b>" + lblOrderno.ToString() + "</b> has been placed on <b>" + String.Format("{0:dddd, MMMM d, yyyy hh:mm tt}", DateTime.Now) + "</b> via Credit or Debit Card. <br><br> *Please take note delivery will be made within 2 hours.*<br><br>Your Order will be delivered to below address:<br><br><b>" + Name.ToString() + " <br>" + Address1.ToString() + " &nbsp;" + Address2.ToString() + " <br>" + PostCode.ToString() + " &nbsp;" + City.ToString() + " <br>" + State.ToString() + "  &nbsp;" + Country.ToString() + "</b>";
                msg = msg + "<br><br>Enjoy your Shopping at Fishmarket.com.qa !!!<br><br>Thanks & Regards<br><table border='1' bordercolor='#b4b1b4' style='border: 1px solid; border-collapse: collapse;'><tr><td> <b>Admin</b><br> Fishmarket <br>Qatar</td><td><a href='http://fishmarket.com.qa' style='text-decoration: none'><img src='" + ConfigurationManager.AppSettings["ImagePath"].ToString() + "web/images/MailLogo.png' alt='' /></a></td></tr><tr align='center'><td colspan='2'><a href='http://fishmarket.com.qa' style='text-decoration: none'>Fishmarket.com.qa </a></td></tr></table> </font>";
               
               
                BusinessTier.SendMail(txtEmail.Text.ToString(), "Test Mail", msg);

                lblStatus.Text = "Successfully Mail Sent";
                lblStatus.ForeColor = Color.Green;

            }
        }
        catch (Exception ex)
        {
           

            lblStatus.Text = ex.ToString();
            //using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
            //{
            //    serviceController.Stop();
            //}
        }
        finally
        {
          
        }
    }
}