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

public partial class web_InvoiceReport : System.Web.UI.Page
{
    public DataTable dtreport = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        string srtParamval1 = "";
        srtParamval1 = Request.QueryString.Get("param1").ToString();
        string srtParamval2 = "";
        srtParamval2 = Request.QueryString.Get("param2").ToString();
        string sql = "select InvoiceNo,convert(varchar,CREATED_DATE, 103),OrderNo,OrderName,Address1,Address2,PostCode,City,State,Country,Mobile,Brand,Model,Qnty,DiscountPrice, Qnty*DiscountPrice as totprice,Type,DiscountPromotion,ShippingCost,Paymethod,cutting from VW_OrderDetails where OrderNo='" + srtParamval1.ToString() + "' and buy=1";

        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        dtreport.Load(reader);
        BusinessTier.DisposeReader(reader);

        BusinessTier.DisposeConnection(connMenu);

        if (srtParamval2 == "Delivery")
        {
            lbltitle.Text = "DELIVERY REPORT";
        }
        else
        {
            lbltitle.Text = "INVOICE";
        }
    }
}