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
using System.Xml;

public partial class Index : System.Web.UI.Page
{

    //public DataTable dtCategoryItems = new DataTable();
    public DataTable dtRecentitems = new DataTable();

    public DataTable dtFeatureitems = new DataTable();

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        Session["AddCart"] = "";
        SqlConnection connMenu = BusinessTier.getConnection();
        try
        {
            int customerid = 0;
            if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
            {
                customerid = Convert.ToInt32(Session["CustomerID"].ToString());
                lblName.Text = Session["sesUserID"].ToString()+"'s";
                if (!(lblName.Text.ToString() == ""))
                {
                    lblWelcome.Visible = true;
                    lblLog.Text = "Logout";
                }
                else
                {
                    lblWelcome.Visible = false;
                    lblLog.Text = "Login";
                }

                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;
            }
            else
            {
                lblWelcome.Text="My Account";
                lblLog.Text = "Login";
                customerid = 0;
            }
            connMenu.Open();

            //SqlDataReader readerMenuF = BusinessTier.getFeatureitems(connMenu);
            //dtFeatureitems.Load(readerMenuF);
            //BusinessTier.DisposeReader(readerMenuF);

            SqlDataReader readerMenu = BusinessTier.getRecentitems(connMenu);
            dtRecentitems.Load(readerMenu);
            BusinessTier.DisposeReader(readerMenu);

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);

            String today = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(today);
            today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

            //string sql = "select count(*) as Cart  from AddCartMaster where DELETED=0 and buy=0 and Customerid='" + customerid.ToString() + "' and CREATED_DATE='" + today.ToString() + "'";
            //SqlCommand cmd = new SqlCommand(sql, connMenu);
            //SqlDataReader reader = cmd.ExecuteReader();
            //if (reader.Read())
            //{
            //    lblcart.Text = reader["Cart"].ToString();
            //    Session["Cart"] = reader["Cart"].ToString();
            //}
            //BusinessTier.DisposeReader(reader);

            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            lblWelcome.Visible = false;
            Response.Redirect("index.aspx");
        }
        finally
        {
            connMenu.Close();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            BusinessTier.GetIPLocation(HttpContext.Current.Request.UserHostAddress);
            //lblName.Text = BusinessTier.GetIPLocation(HttpContext.Current.Request.UserHostAddress);
        // lblName.Text = GetIpAddress().ToString();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "Index", "Page_Load", ex.ToString(), "Audit");
        }
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

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {

        Response.Redirect("Search.aspx?Param=" + txtsearch.Text.ToString(), false);
    }

    public static string GetIpAddress()  // Get IP Address
    {
        string ip = "";
        IPHostEntry ipEntry = Dns.GetHostEntry(GetCompCode());
        IPAddress[] addr = ipEntry.AddressList;
        ip = addr[2].ToString();
        return ip;
    }

    public static string GetCompCode()  // Get Computer Name
    {
        string strHostName = "";
        strHostName = Dns.GetHostName();
        return strHostName;
    }

    private DataTable GetLocation(string ipaddress) // Get location
    {
        WebRequest rssReq = WebRequest.Create("http://freegeoip.appspot.com/xml/" + ipaddress);
        WebProxy px = new WebProxy("http://freegeoip.appspot.com/xml/" + ipaddress, true);
        rssReq.Proxy = px;
        rssReq.Timeout = 2000;
        try
        {
            WebResponse rep = rssReq.GetResponse();
            XmlTextReader xtr = new XmlTextReader(rep.GetResponseStream());
            DataSet ds = new DataSet();
            ds.ReadXml(xtr);
            return ds.Tables[0];
        }
        catch
        {
            return null;
        }
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }
}