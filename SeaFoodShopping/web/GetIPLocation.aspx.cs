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
using System.IO;
public partial class web_GetIPLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Label1.Text = GetIpAddress().ToString();
            //Label2.Text = GetCompCode().ToString();

            //ListBox1.Items.Clear();
            //ListBox1.DataSource = GetLocation(Label1.Text.ToString());
            //ListBox1.DataBind();

            //-------------------------------------
            //SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
            //foreach (DataRow row in GetLocation(Label1.Text.ToString()).Rows)
            //{
            //    //ListBox1 item = new ListBox1();
            //    //item.Text = row[0].ToString();
            //    //item.Value = row["CategoryID"].ToString();
            //    ListBox1.Items.Add(row[0].ToString());
            //    ListBox1.DataBind();
            //}

            //ListBox1.Items.Add(GetLocation(Label1.Text.ToString()).ToString());
            //----------------------------------------------------

         //   string VisitorsIPAddr = string.Empty;
         // //Users IP Address.                
         // if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
         // {
         //     //To get the IP address of the machine and not the proxy
         //     VisitorsIPAddr =   HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
         // }
         // else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
         // {
         //     VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
         // }

         //string res = "http://ipinfo.io/" + VisitorsIPAddr + "/city";

         // //string res = "http://ipinfo.io/" + Label1.Text.ToString() + "/city";

         // string ipResponse = IPRequestHelper(res);
         // //string ipResponse1 = IPRequestHelper(res1);
         // Label3.Text = ipResponse.ToString();


            string IP = "";

            //string strHostName = "";
            //strHostName = System.Net.Dns.GetHostName();
            //strHostName = HttpContext.Current.Request.UserHostAddress;

            //IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            //IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

            //IPAddress[] addr = ipEntry.AddressList;

            IP = HttpContext.Current.Request.UserHostAddress;
           
            //Initializing a new xml document object to begin reading the xml file returned
            XmlDocument doc = new XmlDocument();
            doc.Load("http://www.freegeoip.net/xml/" + IP.ToString());
            XmlNodeList nodeLstCity = doc.GetElementsByTagName("City");
            XmlNodeList nodeLstCountryName = doc.GetElementsByTagName("CountryName");
            IP = "" + nodeLstCity[0].InnerText + "<br>" + IP;

            //Label1.Text = nodeLstCountryName[0].InnerText.ToString();
            //Label3.Text = IP.ToString();

        }
        catch (Exception ex)
        {
            //Label1.Text = ex.ToString();
        }
    }

    protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGrid1.DataSource = DataSourceHelper();
        }
        catch (Exception ex)
        {
            // ShowMessage(9);
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "Master_Department", "NeedDataSource", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {
        int delval = 0;
        string sql = "";
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        sql = "select * FROM GetIPLocation WHERE Deleted='" + delval + "' order by IPLocationID desc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    public string IPRequestHelper(string url)
        {

            string checkURL = url;
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            StreamReader responseStream = new StreamReader(objResponse.GetResponseStream());
            string responseRead = responseStream.ReadToEnd();
            responseRead = responseRead.Replace("\n", String.Empty);
            responseStream.Close();
            responseStream.Dispose();
            return responseRead;
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
}