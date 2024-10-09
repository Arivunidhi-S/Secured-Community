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


public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignin_OnClick(object sender, EventArgs e)
    {
        string userid = WebConfigurationManager.AppSettings["UserID"].ToString();
        string password = WebConfigurationManager.AppSettings["Password1"].ToString();
        //SqlConnection conn = BusinessTier.getConnection();
        //conn.Open();
        //SqlDataReader reader1 = BusinessTier.VaildateUserLogin(conn, txtUserID.Text.ToString(), txtPassword.Text.ToString(), "Customer");
        if ((userid == txtUserID.Text.ToString().Trim()) && (password == txtPassword.Text.ToString().Trim()))
        {
            //Session["CustomerID"] = 1;
            Session["AdminID"] = userid.ToString();
            Response.Redirect("AdminPanel.aspx");
          

        }
        //if (reader1.Read())
        //{
        //    Session["sesUserID"] = (reader1["CustomerName"].ToString());
        //    Session["CustomerID"] = (reader1["CustomerID"].ToString());

        //    Response.Redirect("index.aspx");
        //}
        //BusinessTier.DisposeReader(reader1);
        //BusinessTier.DisposeConnection(conn);
    }
}