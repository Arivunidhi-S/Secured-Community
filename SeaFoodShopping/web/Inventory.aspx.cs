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

public partial class web_Inventory : System.Web.UI.Page
{
    public DataTable dtCatalogMaster = new DataTable();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();

        string sql = "select catalogid,CatalogName,QtyIn,UnitPrice,TotalPrice from CatalogMaster";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        dtCatalogMaster.Load(reader);
        BusinessTier.DisposeReader(reader);

        BusinessTier.DisposeConnection(connMenu);

      
    }

    protected int sumcatalog(int catalogid)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        int sumcat = 0;
        string sql = "select Sum(Qnty) as sumQty  from Vw_Catalog where catalogid=" + catalogid + "";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
      
        if (reader.Read())
        {
            if (!(string.IsNullOrEmpty(reader["sumQty"].ToString())))
            {
                sumcat = Convert.ToInt32(reader["sumQty"].ToString());
            }
        }
        BusinessTier.DisposeReader(reader);

        BusinessTier.DisposeConnection(connMenu);
        return sumcat;
    }

    protected int sumManual(int catalogid)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        int sumManu = 0;
        string sql = "select Sum(Qnty) as sumQty from Vw_Manual where catalogid=" + catalogid + "";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            if (!(string.IsNullOrEmpty(reader["sumQty"].ToString())))
            {
                sumManu = Convert.ToInt32(reader["sumQty"].ToString());
            }
        }
        //dtSumManual.Load(reader);
        BusinessTier.DisposeReader(reader);

        BusinessTier.DisposeConnection(connMenu);
        return sumManu;
    }
}