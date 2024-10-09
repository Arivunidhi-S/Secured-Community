using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Reflection;
using System.Net.Mail;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Collections;
using System.Data.OleDb;
using System.Drawing;
using System.Drawing.Printing;
using System.Data.Common;

using Stimulsoft.Report;
using Stimulsoft.Report.Web;
using Stimulsoft.Report.Viewer;
using Stimulsoft.Report.SaveLoad;
using Stimulsoft.Report.Export;
using Stimulsoft.Report.Print;
using Stimulsoft.Base;
using Stimulsoft.Controls;
using Stimulsoft.Report.Dictionary;
using Stimulsoft.Report.Controls;

using System.IO.MemoryMappedFiles;
using System.Web.Configuration;

public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string appPath = Request.PhysicalApplicationPath;
            //string appPath = WebConfigurationManager.AppSettings["ImagePath"].ToString();
            string srtParamval1 = "", srtParamval2 = "";
            srtParamval1 = Request.QueryString.Get("param1").ToString();
            srtParamval2 = Request.QueryString.Get("param2").ToString();
          
            //string strAttachmentpath = ConfigurationManager.AppSettings["WC_AttachementPath"].ToString();
           
            string con = BusinessTier.getConnection1();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            Stimulsoft.Report.StiReport stiReport1;
            string strsql = "";
            strsql = "select * from VW_OrderDetails where RefNo='" + srtParamval1.ToString() + "' and buy=1";
           
            SqlDataAdapter ad = new SqlDataAdapter(strsql, con);
            DataSet ds = new DataSet();
            ds.DataSetName = "DynamicDataSource";
            ds.Tables.Add("VW_OrderDetails");
            ad.Fill(ds, "VW_OrderDetails");
            stiReport1 = new StiReport();
            stiReport1.Dictionary.DataStore.Clear();
            stiReport1.Load(appPath + "\\web\\Report\\" + srtParamval2.ToString() + ".mrt");
            stiReport1.Dictionary.Databases.Clear();
            stiReport1.Dictionary.Databases.Add(new StiSqlDatabase("Connection", con));
            stiReport1.Dictionary.DataSources.Clear();
            stiReport1.RegData("VW_OrderDetails", ds);
            stiReport1.Dictionary.Synchronize();
            stiReport1.Compile();
            StiWebViewer1.Report = stiReport1;
            StiWebViewer1.ViewMode = StiWebViewMode.WholeReport;


        }
        catch (Exception Ex)
        {
           
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "Report", "Page_Load", Ex.ToString(), "Audit");
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