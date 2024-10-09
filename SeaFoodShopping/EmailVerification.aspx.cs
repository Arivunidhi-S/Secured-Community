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
using System.Threading;

public partial class EmailVerification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            Session["AddCart"] = "";
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            string sql = "update BusinessRegister set EmailVerification=1 where Email='" + @Param.ToString() + "' and  deleted=0";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            cmd.ExecuteNonQuery();
            BusinessTier.DisposeConnection(connMenu);
            Response.Redirect("login.aspx", false);
        }
        catch (Exception ex)
        {
            Response.Redirect("index.aspx",false);
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }
}