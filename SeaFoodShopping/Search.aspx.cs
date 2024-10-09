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
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;

public partial class Search : System.Web.UI.Page
{
    public DataTable dtProductsItems = new DataTable();

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            if (string.IsNullOrEmpty(txtsearch.Text.ToString()))
            {
                @Param = Request.QueryString.Get("Param").ToString();
            }
            else
            {
                @Param = txtsearch.Text.ToString();
            }
            
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);
            if (string.IsNullOrEmpty(@Param.ToString()))
            {
                BusinessTier.DisposeConnection(connMenu);
                return;
            }
            Regex charregex = new Regex(@"[^a-zA-Z0-9\s.]");
            if ((charregex.IsMatch(@Param.ToString().Trim())))
            {               
                return;
            }
            SqlDataReader readerMenu = BusinessTier.getSearchList(connMenu, @Param);
            dtProductsItems.Load(readerMenu);
            BusinessTier.DisposeReader(readerMenu);

            BusinessTier.DisposeConnection(connMenu);

            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblLog.Text = "Logout";
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;
            }
            else
            {
                lblWelcome.Text = "My Account";
                lblLog.Text = "Login";
            }
            lblcart.Text = Session["Cart"].ToString();
        }
        catch (Exception ex)
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            Session["Cart"] = "0";
            lblWelcome.Text = "My Account";
            lblLog.Text = "Login";
            lblcart.Text = Session["Cart"].ToString();
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect(url, false);
        }
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            @Param = txtsearch.Text.ToString();
            if (string.IsNullOrEmpty(@Param.ToString()))
            {
                return;
            }
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();

            SqlDataReader readerMenu = BusinessTier.getSearchList(connMenu, @Param);
            dtProductsItems.Load(readerMenu);
            BusinessTier.DisposeReader(readerMenu);

            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {
          
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        if (lblLog.Text == "Logout")
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            Response.Redirect("index.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void lnkurl_Onclick(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

}