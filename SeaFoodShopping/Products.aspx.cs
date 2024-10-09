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
//using NCalc;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;

public partial class Products : System.Web.UI.Page
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


            string @Param = string.Empty, @Param1 = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            @Param1 = Request.QueryString.Get("Param1").ToString();
            //if (@Param != "22" && @Param != "46")
            //{
            //    cboSize.Visible = false;
            //}
            //if (@Param != "32" && @Param != "31")
            //{
            //    lblWholesale.Visible = false;
            //}
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);

            //SqlDataReader readerMenu = new SqlDataReader();
            if (string.IsNullOrEmpty(cboProducts.Text.ToString()) && string.IsNullOrEmpty(cboSize.Text.ToString()) && @Param1.ToString() == "0")
            {
                //if (@Param1 == "0")
                //{
                SqlDataReader readerMenu = BusinessTier.getProductsList(connMenu, @Param);
                dtProductsItems.Load(readerMenu);
                BusinessTier.DisposeReader(readerMenu);
                //}
                //else
                //{
                //    SqlDataReader readerMenu = BusinessTier.getcboProductsList(connMenu, @Param, @Param1);
                //    dtProductsItems.Load(readerMenu);
                //    BusinessTier.DisposeReader(readerMenu);
                //}
            }
            else if (!(string.IsNullOrEmpty(cboSize.Text.ToString())))
            {
                @Param1 = cboSize.Text.ToString();
                //@Param = cboProducts.SelectedValue.ToString();
                SqlDataReader readerMenu = BusinessTier.getcboSizeList(connMenu, @Param, @Param1);
                dtProductsItems.Load(readerMenu);
                BusinessTier.DisposeReader(readerMenu);
            }

            else
            {
                if (!(string.IsNullOrEmpty(cboProducts.Text.ToString())))
                {
                    @Param1 = cboProducts.Text.ToString();
                }
                //@Param = cboProducts.SelectedValue.ToString();
                SqlDataReader readerMenu = BusinessTier.getcboProductsList(connMenu, @Param, @Param1);
                dtProductsItems.Load(readerMenu);
                BusinessTier.DisposeReader(readerMenu);
            }
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
            //string url = "index.aspx";
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect(url, false);
        }
    }

    protected void cboProduct_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getProductsDistinctList(connMenu, @Param);
            dtCategoryItems.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtCategoryItems.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Brand"].ToString();
                //item.Value = row["CategoryID"].ToString();
                comboBox.Items.Add(item);
                item.DataBind();
            }
            BusinessTier.DisposeReader(readerMenu);
            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {
            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboSize_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            DataTable dtSizeItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getProductsSizeList(connMenu, @Param);
            //if (readerMenu.Read())
            //{
            dtSizeItems.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtSizeItems.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Prosize"].ToString();
                //item.Value = row["CategoryID"].ToString();
                comboBox.Items.Add(item);
                item.DataBind();
            }
            //}
            BusinessTier.DisposeReader(readerMenu);
            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {
            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void cboProduct_SelectedIndexChanged(object sender, EventArgs e)
    {

        cboSize.Text = string.Empty;
    }

    protected void cboSize_SelectedIndexChanged(object sender, EventArgs e)
    {

        cboProducts.Text = string.Empty;
    }

    //protected void cboProduct_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    SqlConnection connMenu = BusinessTier.getConnection();
    //    connMenu.Open();
    //    try
    //    {
    //        string @Param = string.Empty, @Param1 = string.Empty;
    //        @Param = Request.QueryString.Get("Param").ToString();
    //        @Param1 = cboProducts.Text.ToString();

    //        SqlDataReader readerMenu = BusinessTier.getcboProductsList(connMenu, @Param, @Param1);
    //        dtProductsItems.Load(readerMenu);
    //        BusinessTier.DisposeReader(readerMenu);
    //        BusinessTier.DisposeConnection(connMenu);
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally
    //    {
    //        BusinessTier.DisposeConnection(connMenu);
    //    }

    //}

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

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }

    protected void lnkurl_Onclick(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

}