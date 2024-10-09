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
//using System.Threading.ThreadAbortException;
using System.Threading;

public partial class web_Zoom_ZoomImage : System.Web.UI.Page
{
    public DataTable dtPreview = new DataTable();
    public string image1 = string.Empty;
    public string image2 = string.Empty;
    public string image3 = string.Empty;
    public string image4 = string.Empty;
    public string image5 = string.Empty;


    protected void Page_Load(object sender, EventArgs e)
    {
        //string @Param = "32";
        string @Param = string.Empty;
        @Param = Request.QueryString.Get("Param").ToString();
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        //SqlDataReader readerMenu = BusinessTier.getPreview(connMenu, @Param);
        string sql = "select image1,image2,image3,image4,image5,Brand,Model,SellingPrice,ActualPrice,Details,Discount,DiscountPrice,CategoryID,ProductID from Vw_Products where productid='" + @Param.ToString() + "' and  deleted=0  and approve=1";

        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            int i = 0;
            image1 = reader["image1"].ToString();
            image2 = reader["image2"].ToString();
            image3 = reader["image3"].ToString();
            image4 = reader["image4"].ToString();
            image5 = reader["image5"].ToString();
            Image1.ImageUrl = reader["image1"].ToString();
            Image2.ImageUrl = reader["image1"].ToString();
            Image3.ImageUrl = reader["image2"].ToString();
            Image4.ImageUrl = reader["image2"].ToString();
            Image5.ImageUrl = reader["image3"].ToString();
            Image6.ImageUrl = reader["image3"].ToString();
            Image7.ImageUrl = reader["image4"].ToString();
            Image8.ImageUrl = reader["image4"].ToString();
            Image9.ImageUrl = reader["image5"].ToString();
            Image10.ImageUrl = reader["image5"].ToString();
            if (image1.ToString() != "")
            {
                i += 1;

            }
            if (image2.ToString() != "")
            {
                i += 1;
            }
            if (image3.ToString() != "")
            {
                i += 1;
            }
            if (image4.ToString() != "")
            {
                i += 1;
            }
            if (image5.ToString() != "")
            {
                i += 1;
            }
            if (i == 1)
            {
                i = 0;
            }
            param1.Value = i.ToString();
        }
        dtPreview.Load(reader);
        BusinessTier.DisposeReader(reader);
        BusinessTier.DisposeConnection(connMenu);
    }
}