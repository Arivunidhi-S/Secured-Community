using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Adapters;
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
using System.IO;
using System.Reflection;

using System.Drawing.Imaging;
using System.Drawing.Drawing2D;


public partial class Feedback : System.Web.UI.Page
{
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
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblcart.Text = Session["Cart"].ToString();
            }
            else { Response.Redirect("login.aspx"); }

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            BusinessTier.DisposeConnection(connMenu);
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "AddressBook", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("login.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void btnAddFeedback_OnClick(object sender, EventArgs e)
    {

        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (string.IsNullOrEmpty(txtFeedback.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Feedback";
                return;
            }
            int flg = 0;

            flg = BusinessTier.Feedback(conn, 1, txtFeedback.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "N");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblGridStatus.Text = "Sucessfully Feedback Send";
                lblGridStatus.ForeColor = Color.Green;
            }
            txtFeedback.Text = string.Empty;
        }
        catch (Exception ex)
        {
            lblGridStatus.Text = ex.Message.ToString();
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Feedback", "btnAddFeedback_OnClick", ex.ToString(), "Audit");
            lblGridStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }
}