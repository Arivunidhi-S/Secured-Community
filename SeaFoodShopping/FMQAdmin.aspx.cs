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


public partial class SuplierLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtsysRegno.Visible = false;
    }

    protected void btnSignin_OnClick(object sender, EventArgs e)
    {
        try
        
        {
        string userid = WebConfigurationManager.AppSettings["UserID"].ToString();
        string password = WebConfigurationManager.AppSettings["Password"].ToString();
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        txtsysRegno.Text = "1";
        SqlDataReader reader1 = BusinessTier.VaildateUserLogin(conn, txtUserID.Text.ToString(), txtPassword.Text.ToString(), txtsysRegno.Text.ToString(), "Customer");
        
         if (reader1.Read())
        {
            Session["sesUserID"] = (reader1["Name"].ToString());
            Session["CustomerID"] = (reader1["BusinessID"].ToString());
            Session["RegistrationType"] = (reader1["RegistrationType"].ToString());

            Response.Redirect("AdminPage.aspx");
        }
         else
         {
             lblStatus.Text = "Authentication Failed: Invalid credentials.";
         }
        BusinessTier.DisposeReader(reader1);
        BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "FMQLogin", "btnSignin_OnClick", ex.ToString(), "Audit");
            Response.Redirect("AdminPage.aspx");
        }
    }

    protected void btnForgetPassword_OnClick(object sender, EventArgs e)
    {
        string strLink = "ForgetPassword.aspx?param=s";
        ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = (screen.width/2)-(600/2);var Mtop = (screen.height/2)-(300/2);window.open( '" + strLink + "', null, 'width=500,height=200,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=200');", true);
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }
}