using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Net;

using System.Globalization;
using System.Collections;
using System.Data.OleDb;
using System.Drawing;
using System.Xml;


/// <summary>
/// Summary description for Class1
/// </summary>
public class BusinessTier
{
    public BusinessTier()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataTable g_ErrorMessagesDataTable;

    public static SqlConnection getConnection()
    {
        string conString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conString);
        return conn;
    }

    public static string getConnection1()
    {
        string conString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
        return conString;
    }

    public static void DisposeConnection(SqlConnection conn)
    {
        conn.Close();
        conn.Dispose();
    }

    public static void DisposeReader(SqlDataReader reader)
    {
        reader.Close();
        reader.Dispose();
    }

    public static void DisposeAdapter(SqlDataAdapter adapter)
    {
        adapter.Dispose();
    }

    public static SqlDataReader VaildateUserLogin(SqlConnection connec, string Logind, string Password, string Regno, string flag)
    {
        SqlCommand cmd = new SqlCommand("sp_Validate_UserLogin", connec);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Useridp", Logind);
        cmd.Parameters.AddWithValue("@Passp", Password);
        cmd.Parameters.AddWithValue("@Regno", Regno);
        cmd.Parameters.AddWithValue("@Flagp", flag);
        SqlDataReader reader1 = cmd.ExecuteReader();
        return reader1;
    }

    //--------------------------< Function For Master Check IS Duplicate >--------------------------------------

    public static string GetIPLocation(string ip)
    {
        //string IP = "";
        //IP = HttpContext.Current.Request.UserHostAddress;
        //Initializing a new xml document object to begin reading the xml file returned
        XmlDocument doc = new XmlDocument();
        doc.Load("http://www.freegeoip.net/xml/" + ip.ToString());
        XmlNodeList nodeIP = doc.GetElementsByTagName("IP");
        XmlNodeList nodeCity = doc.GetElementsByTagName("City");
        XmlNodeList nodeRegionName = doc.GetElementsByTagName("RegionName");
        XmlNodeList nodeRegionCode = doc.GetElementsByTagName("RegionCode");
        XmlNodeList nodeCountryName = doc.GetElementsByTagName("CountryName");
        XmlNodeList nodeCountryCode = doc.GetElementsByTagName("CountryCode");
        XmlNodeList nodeTimeZone = doc.GetElementsByTagName("TimeZone");
        XmlNodeList nodeLatitude = doc.GetElementsByTagName("Latitude");
        XmlNodeList nodeLongitude = doc.GetElementsByTagName("Longitude");
        XmlNodeList nodeMetroCode = doc.GetElementsByTagName("MetroCode");
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        string sql = "select HitCounter from GetIPLocation where DELETED=0 and IP='" + nodeIP[0].InnerText.ToString().Trim() + "' ";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        string hit = "0";
        if (reader.Read())
        {
            int HitCounter = Convert.ToInt32(reader["HitCounter"].ToString());
            HitCounter = HitCounter + 1;
            hit = HitCounter.ToString();
            DisposeReader(reader);
            InsertIPLocation(connMenu, 1, nodeIP[0].InnerText.ToString(), nodeCity[0].InnerText.ToString(), nodeRegionName[0].InnerText.ToString(), nodeRegionCode[0].InnerText.ToString(), nodeCountryName[0].InnerText.ToString(), nodeCountryCode[0].InnerText.ToString(), nodeTimeZone[0].InnerText.ToString(), nodeLatitude[0].InnerText.ToString(), nodeLongitude[0].InnerText.ToString(), nodeMetroCode[0].InnerText.ToString(), HitCounter, "1", "U");
        }
        else
        {
            DisposeReader(reader);
            InsertIPLocation(connMenu, 1, nodeIP[0].InnerText.ToString(), nodeCity[0].InnerText.ToString(), nodeRegionName[0].InnerText.ToString(), nodeRegionCode[0].InnerText.ToString(), nodeCountryName[0].InnerText.ToString(), nodeCountryCode[0].InnerText.ToString(), nodeTimeZone[0].InnerText.ToString(), nodeLatitude[0].InnerText.ToString(), nodeLongitude[0].InnerText.ToString(), nodeMetroCode[0].InnerText.ToString(), 1, "1", "N");
        }


        DisposeConnection(connMenu);
        return hit.ToString();
    }

    public static int InsertIPLocation(SqlConnection conn, int IPLocationID, string IP, string City, string RegionName, string RegionCode, string CountryName, string CountryCode, string TimeZone, string Latitude, string Longitude, string MetroCode, int HitCounter, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_GetIPLocation]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@IPLocationID", IPLocationID);
        dCmd.Parameters.AddWithValue("@IP", IP);
        dCmd.Parameters.AddWithValue("@City", City);
        dCmd.Parameters.AddWithValue("@RegionName", RegionName);
        dCmd.Parameters.AddWithValue("@RegionCode", RegionCode);
        dCmd.Parameters.AddWithValue("@CountryName", CountryName);
        dCmd.Parameters.AddWithValue("@CountryCode", CountryCode);
        dCmd.Parameters.AddWithValue("@TimeZone", TimeZone);
        dCmd.Parameters.AddWithValue("@Latitude", Latitude);
        dCmd.Parameters.AddWithValue("@Longitude", Longitude);
        dCmd.Parameters.AddWithValue("@MetroCode", MetroCode);
        dCmd.Parameters.AddWithValue("@HitCounter", HitCounter);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static SqlDataReader IDCheck(SqlConnection con, string ID, string Flag)
    {
        SqlCommand cmd = new SqlCommand("sp_Master_IsDuplicate", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", ID);
        cmd.Parameters.AddWithValue("@Flag", Flag);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    //--------------------------< Function For Master Module >--------------------------------------

    public static int DeleteTables(SqlConnection conn, int ID, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_DeleteTables]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@ID", ID);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int Category(SqlConnection conn, int CategoryID, string Category, string BasicCategoryID, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("sp_CategoryMaster", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@CategoryID", CategoryID);
        dCmd.Parameters.AddWithValue("@Category", Category);
        dCmd.Parameters.AddWithValue("@BasicCategoryID", BasicCategoryID);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int Catalog(SqlConnection conn, int Catalogid, string Indate, string CatalogName, int QtyIn, decimal UnitPrice, decimal TotalPrice, int Damage, string Remarks, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("sp_CatalogMaster", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@Catalogid", Catalogid);
        dCmd.Parameters.AddWithValue("@Indate", Indate);
        dCmd.Parameters.AddWithValue("@CatalogName", CatalogName);
        dCmd.Parameters.AddWithValue("@QtyIn", QtyIn);
        dCmd.Parameters.AddWithValue("@UnitPrice", UnitPrice);
        dCmd.Parameters.AddWithValue("@TotalPrice", TotalPrice);
        dCmd.Parameters.AddWithValue("@Damage", Damage);
        dCmd.Parameters.AddWithValue("@Remarks", Remarks);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int Product(SqlConnection conn, int ProductID, int CategoryID, string Brand, string Model, decimal ActualPrice, int Discount, decimal DiscountPrice, decimal SellingPrice, decimal ShippingCost, string imagePath, string Details, int Weight, string URL, string CatalogName, int SupplierID, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_ProductMaster]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@CategoryID", CategoryID);
        dCmd.Parameters.AddWithValue("@Brand", Brand);
        dCmd.Parameters.AddWithValue("@Model", Model);
        dCmd.Parameters.AddWithValue("@ActualPrice", ActualPrice);
        dCmd.Parameters.AddWithValue("@Discount", Discount);
        dCmd.Parameters.AddWithValue("@DiscountPrice", DiscountPrice);
        dCmd.Parameters.AddWithValue("@SellingPrice", SellingPrice);
        dCmd.Parameters.AddWithValue("@ShippingCost", ShippingCost);
        dCmd.Parameters.AddWithValue("@imagePath", imagePath);
        dCmd.Parameters.AddWithValue("@Details", Details);

        dCmd.Parameters.AddWithValue("@Weight", Weight);
        dCmd.Parameters.AddWithValue("@URL", URL);
        dCmd.Parameters.AddWithValue("@CatalogName", CatalogName);
        dCmd.Parameters.AddWithValue("@SupplierID", SupplierID);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int ProductItem(SqlConnection conn, int ProductItemID, int ProductID, int TotalStock, string Image1, string Image2, string Image3, string Image4, string Image5, int Approve, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_ItemProduct]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@ProductItemID", ProductItemID);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@TotalStock", TotalStock);
        dCmd.Parameters.AddWithValue("@Image1", Image1);
        dCmd.Parameters.AddWithValue("@Image2", Image2);
        dCmd.Parameters.AddWithValue("@Image3", Image3);
        dCmd.Parameters.AddWithValue("@Image4", Image4);
        dCmd.Parameters.AddWithValue("@Image5", Image5);
        dCmd.Parameters.AddWithValue("@Approve", Approve);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int AddStock(SqlConnection conn, int PricingID, int ProductID, string ProColor, string ProSize, string Stock, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_AddStock]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@PricingID", PricingID);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@ProColor", ProColor);
        dCmd.Parameters.AddWithValue("@ProSize", ProSize);
        dCmd.Parameters.AddWithValue("@Stock", Stock);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int AddAdress(SqlConnection conn, int AddressId, string Name, string Mobile, string Email, string Address1, string Address2, string Address3, string Postcode, string City, string State, string Country, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_MasterAddress]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@AddressId", AddressId);
        dCmd.Parameters.AddWithValue("@Name", Name);

        dCmd.Parameters.AddWithValue("@Mobile", Mobile);
        dCmd.Parameters.AddWithValue("@Email", Email);

        dCmd.Parameters.AddWithValue("@Address1", Address1);
        dCmd.Parameters.AddWithValue("@Address2", Address2);
        dCmd.Parameters.AddWithValue("@Address3", Address3);

        dCmd.Parameters.AddWithValue("@Postcode", Postcode);
        dCmd.Parameters.AddWithValue("@City", City);
        dCmd.Parameters.AddWithValue("@State", State);
        dCmd.Parameters.AddWithValue("@Country", Country);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int ProductReview(SqlConnection conn, int ReviewID, int Rate, string ReviewTitle, string ProductReview, int ProductID, int Approve, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_ProductReview]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@ReviewID", ReviewID);
        dCmd.Parameters.AddWithValue("@Rate", Rate);
        dCmd.Parameters.AddWithValue("@ReviewTitle", ReviewTitle);

        dCmd.Parameters.AddWithValue("@ProductReview", ProductReview);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);

        dCmd.Parameters.AddWithValue("@Approve", Approve);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int Promotion(SqlConnection conn, int PromotionID, string PromotionCode, string Description, string Type, decimal Discount, decimal Total, string FromDate, string ToDate, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_PromotionMaster]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@PromotionID", PromotionID);
        dCmd.Parameters.AddWithValue("@PromotionCode", PromotionCode);

        dCmd.Parameters.AddWithValue("@Description", Description);
        dCmd.Parameters.AddWithValue("@Type", Type);

        dCmd.Parameters.AddWithValue("@Discount", Discount);
        dCmd.Parameters.AddWithValue("@Total", Total);
        dCmd.Parameters.AddWithValue("@FromDate", FromDate);

        dCmd.Parameters.AddWithValue("@ToDate", ToDate);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int Feedback(SqlConnection conn, int FeedbackID, string Feedback, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_MasterFeedback]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@FeedbackID", FeedbackID);
        dCmd.Parameters.AddWithValue("@Feedback", Feedback);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int SupplierDetails(SqlConnection conn, int SupplierID, string SupplierName, string PersonIncharge, string Mobile, string Fax, string Email, string Address1, string Address2, string PostCode, string City, string State, string Country, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_SupplierDetails]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@SupplierID", SupplierID);
        dCmd.Parameters.AddWithValue("@SupplierName", SupplierName);
        dCmd.Parameters.AddWithValue("@PersonIncharge", PersonIncharge);
        dCmd.Parameters.AddWithValue("@Mobile", Mobile);
        dCmd.Parameters.AddWithValue("@Fax", Fax);
        dCmd.Parameters.AddWithValue("@Email", Email);
        dCmd.Parameters.AddWithValue("@Address1", Address1);

        dCmd.Parameters.AddWithValue("@Address2", Address2);
        dCmd.Parameters.AddWithValue("@PostCode", PostCode);
        dCmd.Parameters.AddWithValue("@City", City);
        dCmd.Parameters.AddWithValue("@State", State);
        dCmd.Parameters.AddWithValue("@Country", Country);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int CustomerMaster(SqlConnection conn, int CustomerID, string CustomerName, string Email, int Contactno, string Address, string Password, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_CustomerMaster]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@CustomerID", CustomerID);
        dCmd.Parameters.AddWithValue("@CustomerName", CustomerName);
        dCmd.Parameters.AddWithValue("@Email", Email);
        dCmd.Parameters.AddWithValue("@Contactno", Contactno);
        dCmd.Parameters.AddWithValue("@Address", Address);
        dCmd.Parameters.AddWithValue("@Password", Password);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int SupplierMaster(SqlConnection conn, int SupplierID, string SupplierName, string Email, int BusinessID, string Address, string Password, string ProductName, decimal ActualPrice, decimal SellingPrice, decimal Profit, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_SupplierMaster]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@SupplierID", SupplierID);
        dCmd.Parameters.AddWithValue("@SupplierName", SupplierName);
        dCmd.Parameters.AddWithValue("@Email", Email);
        dCmd.Parameters.AddWithValue("@BusinessID", BusinessID);
        dCmd.Parameters.AddWithValue("@Address", Address);
        dCmd.Parameters.AddWithValue("@Password", Password);

        dCmd.Parameters.AddWithValue("@ProductName", ProductName);
        dCmd.Parameters.AddWithValue("@ActualPrice", ActualPrice);
        dCmd.Parameters.AddWithValue("@SellingPrice", SellingPrice);
        dCmd.Parameters.AddWithValue("@Profit", Profit);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int BusinessRegister(SqlConnection conn, int BusinessID, string BusinessName, string Regno, string Name, string ICno, string Contactno, string Email, string Address, string Password, string Bankname, string AccHdrName, string Accountno, string BranchName, string Settlement, int Approve, string MyKad, string bankstatement, string utilitiesbill, string form9, string form49, string GSTApproval, string State, string Country, int Postcode, int ISDCode, string RegistrationType, string SWIFTcode, string Gender, string DOB, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_BusinessRegister]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@BusinessID", BusinessID);
        dCmd.Parameters.AddWithValue("@BusinessName", BusinessName);
        dCmd.Parameters.AddWithValue("@Regno", Regno);
        dCmd.Parameters.AddWithValue("@Name", Name);
        dCmd.Parameters.AddWithValue("@ICno", ICno);
        dCmd.Parameters.AddWithValue("@Contactno", Contactno);
        dCmd.Parameters.AddWithValue("@Email", Email);

        dCmd.Parameters.AddWithValue("@Address", Address);
        dCmd.Parameters.AddWithValue("@Password", Password);
        dCmd.Parameters.AddWithValue("@Bankname", Bankname);
        dCmd.Parameters.AddWithValue("@AccHdrName", AccHdrName);
        dCmd.Parameters.AddWithValue("@Accountno", Accountno);
        dCmd.Parameters.AddWithValue("@BranchName", BranchName);
        dCmd.Parameters.AddWithValue("@Settlement", Settlement);

        dCmd.Parameters.AddWithValue("@Approve", Approve);

        dCmd.Parameters.AddWithValue("@MyKad", MyKad);
        dCmd.Parameters.AddWithValue("@bankstatement", bankstatement);
        dCmd.Parameters.AddWithValue("@utilitiesbill", utilitiesbill);
        dCmd.Parameters.AddWithValue("@form9", form9);
        dCmd.Parameters.AddWithValue("@form49", form49);
        dCmd.Parameters.AddWithValue("@GSTApproval", GSTApproval);

        dCmd.Parameters.AddWithValue("@State", State);
        dCmd.Parameters.AddWithValue("@Country", Country);
        dCmd.Parameters.AddWithValue("@Postcode", Postcode);
        dCmd.Parameters.AddWithValue("@ISDCode", ISDCode);
        dCmd.Parameters.AddWithValue("@RegistrationType", RegistrationType);
        dCmd.Parameters.AddWithValue("@SWIFTcode", SWIFTcode);

        dCmd.Parameters.AddWithValue("@Gender", Gender);
        dCmd.Parameters.AddWithValue("@DOB", DOB);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int AddCart(SqlConnection conn, int AddcartID, int ProductID, int CustomerID, int pricingid, decimal Qnty,int Cutting, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_AddCart]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@AddcartID", AddcartID);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@CustomerID", CustomerID);
        dCmd.Parameters.AddWithValue("@PricingID", pricingid);
        dCmd.Parameters.AddWithValue("@Qnty", Qnty);
        dCmd.Parameters.AddWithValue("@Cutting", Cutting);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int AddCartReturnCancel(SqlConnection conn, string OrderNo, string RunningNo, string CancelReturnReason, string Reimburse, string BankingType, string AccountName, string AccountNumber, string BankName, string Branch, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_AddCartReturnCancel]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@OrderNo", OrderNo);
        dCmd.Parameters.AddWithValue("@RunningNo", RunningNo);
        dCmd.Parameters.AddWithValue("@CancelReturnReason", CancelReturnReason);


        dCmd.Parameters.AddWithValue("@Reimburse", Reimburse);
        dCmd.Parameters.AddWithValue("@BankingType", BankingType);
        dCmd.Parameters.AddWithValue("@AccountName", AccountName);
        dCmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
        dCmd.Parameters.AddWithValue("@BankName", BankName);
        dCmd.Parameters.AddWithValue("@Branch", Branch);

        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int AddWishlist(SqlConnection conn, int WishlistID, int ProductID, int CustomerID, int PricingID, string userid, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_Wishlist]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@WishlistID", WishlistID);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@CustomerID", CustomerID);
        dCmd.Parameters.AddWithValue("@PricingID", PricingID);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static SqlDataReader getMasterModule(SqlConnection conn)
    {
        int delval = 0;
        string sql = "select * FROM Menulist ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getMasterModuleById(SqlConnection connect, string strModuleId)
    {
        int delval = 0;
        string sql = "select * FROM MasterModule WHERE Deleted='" + delval + "' and ModuleId='" + strModuleId + "' ORDER BY ModuleId";
        SqlCommand cmd = new SqlCommand(sql, connect);
        SqlDataReader reader1 = cmd.ExecuteReader();
        return reader1;

    }

    public static int DeleteModuleGrid(SqlConnection conn, string id)
    {
        SqlCommand dCmd = new SqlCommand("sp_MasterModule_Delete", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@moduleidp", id);
        return dCmd.ExecuteNonQuery();
    }

    public static SqlDataReader checkModuleName(SqlConnection connCheck, string name)
    {
        SqlCommand cmd = new SqlCommand("sp_MasterModule_IsDuplicate", connCheck);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@modulenamep", name);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static int SaveModuleMaster(SqlConnection conn, string name, string desc, string appflag, string userid, string saveflag, string modid)
    {
        string sp_Name;
        string RowValue = "0";
        if (saveflag.ToString() == "N")
        {
            sp_Name = "[sp_MasterModule_Insert]";
        }
        else
        {
            sp_Name = "[sp_MasterModule_Update]";
        }
        SqlCommand dCmd = new SqlCommand(sp_Name, conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        if (saveflag.ToString() == "U")
        {
            dCmd.Parameters.AddWithValue("@idp", modid);
            dCmd.Parameters.AddWithValue("@Rowp", RowValue);
        }
        dCmd.Parameters.AddWithValue("@namep", name);
        dCmd.Parameters.AddWithValue("@descriptionp", desc);
        dCmd.Parameters.AddWithValue("@approvalflag", appflag);
        dCmd.Parameters.AddWithValue("@useridp", userid);
        return dCmd.ExecuteNonQuery();
    }

    //--------------------------< Function For Master User >--------------------------------------

    public static SqlDataReader getMasterUserInfo(SqlConnection conn)
    {
        int delval = 0;
        string sql = "select * FROM Vw_MasterUser_Staff WHERE Deleted='" + delval + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getMasterUserByID(SqlConnection conn, string strID)
    {
        int delval = 0;
        string sql = "select * FROM Vw_MasterUser_Staff WHERE ID='" + strID + "' and  Deleted='" + delval + "' ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getUserNameByID(SqlConnection conn, string strID)
    {
        SqlCommand cmd = new SqlCommand("[sp_MasterUser_getUserName]", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@idp", strID);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static string getMasterUserIDByName(SqlConnection conn, string strName)
    {
        int delval = 0;
        string sql = "select ID FROM Vw_MasterUser_Staff WHERE UserName like '%" + strName + "%' and  Deleted='" + delval + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        string ret = reader[0].ToString();
        BusinessTier.DisposeReader(reader);
        //BusinessTier.DisposeConnection(conn);
        return ret;
    }

    public static SqlDataReader getMasterUserByLoginId(SqlConnection conn, string strLoginId)
    {
        int delval = 0;
        string sql = "select * FROM Vw_MasterUser_Staff WHERE Deleted='" + delval + "' and LoginId='" + strLoginId + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getMasterModulePermisnByUserId(SqlConnection connModulePermission, string strUserId)
    {
        int delval = 0;
        string sql = "select * FROM vw_MasterModulePermission_MasterModuleByModuleID WHERE Deleted='" + delval + "' and UserId='" + strUserId.ToString() + "' order by modulename";
        SqlCommand cmd = new SqlCommand(sql, connModulePermission);
        SqlDataReader readerModulePermission = cmd.ExecuteReader();
        return readerModulePermission;
    }

    public static int DeleteUserGrid(SqlConnection conn, string id)
    {
        SqlCommand dCmd = new SqlCommand("[sp_MasterUser_Delete]", conn);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@masteruseridp", id);
        return dCmd.ExecuteNonQuery();
    }

    public static int SaveUserMaster(SqlConnection connSave, int intstaffid, string strloginid, string strpass, string strCreatedByID, string strSaveFlag, string strCurrUserId)
    {
        string sp_Name;
        if (strSaveFlag.ToString() == "Insert")
        {
            sp_Name = "[sp_MasterUser_Insert]";
        }
        else
        {
            sp_Name = "[sp_MasterUser_Update]";
        }
        SqlCommand dCmd = new SqlCommand(sp_Name, connSave);
        dCmd.CommandType = CommandType.StoredProcedure;
        if (strSaveFlag.ToString() == "Update")
        {
            dCmd.Parameters.AddWithValue("@idp", strCurrUserId);
        }
        dCmd.Parameters.AddWithValue("@loginidp", strloginid);
        dCmd.Parameters.AddWithValue("@passp", strpass);
        dCmd.Parameters.AddWithValue("@Staffidp", intstaffid);
        // dCmd.Parameters.AddWithValue("@isapprovalrqrdp", strapprqrd);
        //  dCmd.Parameters.AddWithValue("@isnotifyrqrd", strnotifyrqrd);
        dCmd.Parameters.AddWithValue("@useridp", strCreatedByID);
        return dCmd.ExecuteNonQuery();
    }

    public static int InsertShippingAddress(SqlConnection connSave, int ShippingID, string Name, int Mobile, string Email, string Address1, string Address2, string Address3, string Postcode, string City, string State, string Country, string CustomerID, string PromotionID, string sentamount, string breakamount, string PayMethod, string ReferenceID, string useridp, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_ShippingAddress]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@ShippingID", ShippingID);
        dCmd.Parameters.AddWithValue("@Name", Name);
        dCmd.Parameters.AddWithValue("@Mobile", Mobile);
        dCmd.Parameters.AddWithValue("@Email", Email);
        dCmd.Parameters.AddWithValue("@Address1", Address1);
        dCmd.Parameters.AddWithValue("@Address2", Address2);
        dCmd.Parameters.AddWithValue("@Address3", Address3);

        dCmd.Parameters.AddWithValue("@Postcode", Postcode);
        dCmd.Parameters.AddWithValue("@City", City);
        dCmd.Parameters.AddWithValue("@State", State);
        dCmd.Parameters.AddWithValue("@Country", Country);
        dCmd.Parameters.AddWithValue("@CustomerID", CustomerID);

        dCmd.Parameters.AddWithValue("@PromotionID", PromotionID);
        dCmd.Parameters.AddWithValue("@breakamount", breakamount);
        dCmd.Parameters.AddWithValue("@sentamount", sentamount);
        dCmd.Parameters.AddWithValue("@PayMethod", PayMethod);
        dCmd.Parameters.AddWithValue("@ReferenceID", ReferenceID);

        dCmd.Parameters.AddWithValue("@useridp", useridp);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static int BankStatement(SqlConnection connSave, string ShippingID, string ReferenceID, string GatewayID, string Amount, string Currency, string ProdDesc, string UserName, string UserEmail, string UserContact, string useridp, string Flagp)
    {

        SqlCommand dCmd = new SqlCommand("[sp_BankStatement]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@ShippingID", ShippingID);
        dCmd.Parameters.AddWithValue("@ReferenceID", ReferenceID);
        dCmd.Parameters.AddWithValue("@GatewayID", GatewayID);
        dCmd.Parameters.AddWithValue("@Amount", Amount);
        dCmd.Parameters.AddWithValue("@Currency", Currency);
        dCmd.Parameters.AddWithValue("@ProdDesc", ProdDesc);
        dCmd.Parameters.AddWithValue("@UserName", UserName);

        dCmd.Parameters.AddWithValue("@UserEmail", UserEmail);
        dCmd.Parameters.AddWithValue("@UserContact", UserContact);

        dCmd.Parameters.AddWithValue("@useridp", useridp);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }


    public static int OrderConfirmation(SqlConnection connSave, string ShippingID, string Status, string ReferenceID, string TransId, string TransDate, string ReturnAmount, string useridp, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_OrderConfrimation]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@ShippingID", ShippingID);
        dCmd.Parameters.AddWithValue("@Status", Status);
        dCmd.Parameters.AddWithValue("@ReferenceID", ReferenceID);
        dCmd.Parameters.AddWithValue("@TransId", TransId);
        dCmd.Parameters.AddWithValue("@TransDate", TransDate);
        dCmd.Parameters.AddWithValue("@ReturnAmount", ReturnAmount);
        dCmd.Parameters.AddWithValue("@useridp", useridp);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static SqlDataReader checkUserLoginId(SqlConnection connCheck, string strLoginId)
    {
        SqlCommand cmd = new SqlCommand("[sp_MasterUser_IsDuplicate]", connCheck);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@loginidp", strLoginId);
        //cmd.Parameters.AddWithValue("@Flag", Flag);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader checkUserApprovalByUserId(SqlConnection connectUserAprvl, long lnguserid)
    {
        SqlCommand cmd = new SqlCommand("sp_MasterUserApproval_CheckUserId", connectUserAprvl);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@useridp", lnguserid);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static int SaveUserMasterApproval(SqlConnection connSave, long intloginid, long intlinebyline, string struserid)
    {
        SqlCommand dCmd = new SqlCommand("[sp_MasterUserApproval_Save]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@loginidp", intloginid);
        dCmd.Parameters.AddWithValue("@approvalp", intlinebyline);
        dCmd.Parameters.AddWithValue("@useridp", struserid);
        return dCmd.ExecuteNonQuery();
    }

    public static int SaveUserMasterModulePermission(SqlConnection connSave, long intloginid, long intlinebyline, string struserid)
    {
        SqlCommand dCmd = new SqlCommand("[sp_MasterUserModulePermission_Save]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@loginidp", intloginid);
        dCmd.Parameters.AddWithValue("@moduleidp", intlinebyline);
        // dCmd.Parameters.AddWithValue("@appflag", "Y");
        dCmd.Parameters.AddWithValue("@useridp", struserid);
        return dCmd.ExecuteNonQuery();
    }

    public static int Stock_Update(SqlConnection connSave, string AddCartid, string ProductID, string PricingID, decimal Qty, string struserid, string flag)
    {
        SqlCommand dCmd = new SqlCommand("[sp_Stock_Update]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@AddCartid", AddCartid);
        dCmd.Parameters.AddWithValue("@ProductID", ProductID);
        dCmd.Parameters.AddWithValue("@PricingID", PricingID);
        dCmd.Parameters.AddWithValue("@Qty", Qty);
        dCmd.Parameters.AddWithValue("@useridp", struserid);
        dCmd.Parameters.AddWithValue("@Flagp", flag);
        return dCmd.ExecuteNonQuery();
    }

    public static int ManualSalesEntry(SqlConnection connSave, int ManualSalesID, int orderno, string invoiceno, string paymentdate, int productid, string Description, int Qnty, decimal UnitPrice, decimal Amount, decimal TotalAmount, decimal GST, string Remarks, string BankingDate, int Customer, int Distributor, string DeliveryNo, int Paid, string useridp, string Flagp)
    {
        SqlCommand dCmd = new SqlCommand("[sp_ManualSalesEntry]", connSave);
        dCmd.CommandType = CommandType.StoredProcedure;

        dCmd.Parameters.AddWithValue("@ManualSalesID", ManualSalesID);
        dCmd.Parameters.AddWithValue("@orderno", orderno);
        dCmd.Parameters.AddWithValue("@invoiceno", invoiceno);
        dCmd.Parameters.AddWithValue("@paymentdate", paymentdate);
        dCmd.Parameters.AddWithValue("@productid", productid);
        dCmd.Parameters.AddWithValue("@Description", Description);
        dCmd.Parameters.AddWithValue("@Qnty", Qnty);
        dCmd.Parameters.AddWithValue("@UnitPrice", UnitPrice);
        dCmd.Parameters.AddWithValue("@Amount", Amount);
        dCmd.Parameters.AddWithValue("@TotalAmount", TotalAmount);
        dCmd.Parameters.AddWithValue("@GST", GST);
        dCmd.Parameters.AddWithValue("@Remarks", Remarks);
        dCmd.Parameters.AddWithValue("@BankingDate", BankingDate);
        dCmd.Parameters.AddWithValue("@Customer", Customer);
        dCmd.Parameters.AddWithValue("@Distributor", Distributor);
        dCmd.Parameters.AddWithValue("@DeliveryNo", DeliveryNo);
        dCmd.Parameters.AddWithValue("@Paid", Paid);
        dCmd.Parameters.AddWithValue("@useridp", useridp);
        dCmd.Parameters.AddWithValue("@Flagp", Flagp);
        return dCmd.ExecuteNonQuery();
    }

    public static void BindErrorMessageDetails(SqlConnection connError)
    {
        string sql = "select * FROM MasterErrorMessage order by OrderNo";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, connError);
        g_ErrorMessagesDataTable = new DataTable();
        sqlDataAdapter.Fill(g_ErrorMessagesDataTable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
    }

    public static void InsertLogAuditTrial(SqlConnection connLog, string userid, string module, string activity, string result, string flag)
    {
        string sp_Name;
        if (flag.ToString() == "Log")
        {
            sp_Name = "[sp_Master_Insert_Log]";
        }
        else
        {
            sp_Name = "[sp_Master_Insert_AuditTrail]";
        }

        SqlCommand dCmd = new SqlCommand(sp_Name, connLog);

        dCmd.CommandType = CommandType.StoredProcedure;
        dCmd.Parameters.AddWithValue("@useridp", userid);
        dCmd.Parameters.AddWithValue("@modulep", module);
        dCmd.Parameters.AddWithValue("@activityp", activity);
        dCmd.Parameters.AddWithValue("@resultp", result);
        dCmd.ExecuteNonQuery();
    }

    public static SqlDataReader getMenuList(SqlConnection conn)
    {
        string sql = "";
        //  if (usertype.ToString().Trim() == "admin")
        sql = "select BasicCategoryID,Categoryid,Category,BasicCategory,Priority from (select Categoryid,Category,BasicCategoryID,BasicCategory,Priority,row_number() over(partition by T.BasicCategoryID order by T.Priority asc) as rn from VW_BasicCategory as T where deleted=0) as n where n.rn <=1 order by Priority asc";
        // sql = "select BasicCategoryID,Categoryid,Category from (select Categoryid,Category,page,row_number() over(partition by T.page order by T.page desc) as rn from MasterCategory as T where deleted=0) as T where T.rn <= 1 ";
        //sql = "select Page from MasterCategory where deleted=0  group by  Page order by Page";
        //  else
        //   sql = "select Category, seqCategory from vw_MenuList_MasterModulePermission  where UserId='" + strUserId + "' group by Category,seqCategory order by seqCategory";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static DataTable getSubMenuItems(string category)
    {
        DataTable ret = new DataTable();
        SqlConnection conn = getConnection();
        conn.Open();
        string sql = "";
        //if (usertype.ToString().Trim() == "admin")
        //{
        //    sql = "select ModuleID, Href, Menulist FROM MenuList where Category = '" + category + "' order by seqMenu";
        //}
        //else
        //{
        sql = "select Category,BasicCategoryID,Categoryid from MasterCategory where deleted=0 and BasicCategoryID='" + category + "'  group by Category, BasicCategoryID,Categoryid order by Categoryid";
        //}
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        ret.Load(reader);
        BusinessTier.DisposeConnection(conn);
        return ret;
    }

    public static SqlDataReader getQty(SqlConnection conn, string ProductID, string Sizecheckflag)
    {
        string sql = "";
        if (Sizecheckflag.ToString() != "")
        {
            sql = "select stock as tstock from MasterPricing where deleted=0 and ProductID='" + ProductID.ToString() + "' and pricingid='" + Sizecheckflag.ToString() + "' ";
        }
        else
        {
            sql = "select Totalstock as tstock from MasterItemProduct where deleted=0 and ProductID='" + ProductID.ToString() + "'";
        }
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getSize(SqlConnection conn, string ProductID)
    {
        string sql = "";
        sql = "select PricingID,ProSize,Stock from MasterPricing where deleted=0 and Stock<>0 and ProductID='" + ProductID.ToString() + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getColor(SqlConnection conn, string ProductID)
    {
        string sql = "";
        sql = "select PricingID,ProColor,Stock from MasterPricing where deleted=0 and ProductID='" + ProductID.ToString() + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getBasicCategoryItems(SqlConnection conn, string category)
    {
        string sql = "";
        if (category == "")
        {
            sql = "select BasicCategory,BasicCategoryID from BasicCategoryMaster where deleted=0 group by BasicCategory,BasicCategoryID order by BasicCategoryID";
        }
        else
        {
            sql = "select BasicCategoryID from VW_BasicCategory where deleted=0 and Categoryid='" + category.ToString() + "'";
        }
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getCategoryItems(SqlConnection conn, string category)
    {
        string sql = "";
        sql = "select Category,Categoryid from MasterCategory where deleted=0 and BasicCategoryID='" + category + "'  group by Category, Categoryid order by Categoryid";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getBrandItems(SqlConnection conn, string categoryid, string userid)
    {
        string sql = "";
        sql = "select CategoryID,Brand,productid from MasterProducts where deleted=0 and CategoryID='" + categoryid.ToString() + "' and CREATED_BY='" + userid.ToString() + "'  group by CategoryID,Brand,productid order by Brand";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getModelItems(SqlConnection conn, string categoryid, string Brand, string userid)
    {
        string sql = "";
        sql = "select CategoryID,Model,productid from MasterProducts where deleted=0 and CategoryID='" + categoryid.ToString() + "' and Brand='" + Brand.ToString() + "' and CREATED_BY='" + userid.ToString() + "'  group by Model,CategoryID,productid order by Model";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getCategoryList(SqlConnection conn)
    {
        string sql = "select Category,Page,Categoryid from MasterCategory where deleted=0";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader BasicCategory(SqlConnection conn, string param)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Products where basiccategoryid = '" + param.ToString() + "' and MasterDel=0 and  Approve=1 order by productid desc";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getSearchList(SqlConnection conn, string param)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Products where basiccategory like '%" + param.ToString() + "%' or category like '%" + param.ToString() + "%' or brand like '%" + param.ToString() + "%' or model like '%" + param.ToString() + "%' and MasterDel=0 and  Approve=1 order by productid desc";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getAllfish(SqlConnection conn, string param)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Products where MasterDel=0 and  Approve=1 order by productid desc";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getRecentitems(SqlConnection conn)
    {
        //string sql = "SELECT TOP (20) Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Category as BrMod,left((Category),16)+'...' as ShortBrMod,TotalStock, ROW_NUMBER() OVER (ORDER BY ProductId ) as RowNum FROM Vw_Products where deleted=0 and MasterDel=0 and TotalStock>0  ORDER BY ProductId DESC";
        string sql = "SELECT TOP (20) Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock, ROW_NUMBER() OVER (ORDER BY ProductId ) as RowNum FROM Vw_Products where deleted=0 and MasterDel=0 and TotalStock>0 and approve=1 ORDER BY ProductId DESC";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getFeatureitems(SqlConnection conn)
    {
        // string sql = "select * from (select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod, ROW_NUMBER() OVER (ORDER BY ProductId) as RowNum,FeatureProductID from VW_FeatureProduct as t where deleted=0 )as t where t.RowNum <= 16 ORDER BY FeatureProductID";
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Category as BrMod,left((Category),16)+'...' as ShortBrMod, FeatureProductID from VW_FeatureProduct where deleted=0  ORDER BY FeatureProductID";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getProductsList(SqlConnection conn, string param)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Products where MasterDel=0 and Categoryid='" + param.ToString() + "' and  Approve=1 order by productid desc";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getcboProductsList(SqlConnection conn, string param, string param1)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Products where MasterDel=0 and Brand='" + param1.ToString() + "' and categoryid = '" + param.ToString() + "' and  Approve=1 order by productid desc";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getcboSizeList(SqlConnection conn, string param, string param1)
    {
        string sql = "select Brand,Model,SellingPrice,imagepath,productid,DiscountPrice,Discount,Brand + ' ' + Model as BrMod,left((Brand + ' ' + Model),16)+'...' as ShortBrMod,TotalStock,Category from Vw_Product_Size where MasterDel=0 and Prosize='" + param1.ToString() + "' and categoryid = '" + param.ToString() + "' and  Approve=1 and Stock<>0 order by productid desc";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getProductsDistinctList(SqlConnection conn, string param)
    {
        string sql = "select distinct(Brand),categoryid from MasterProducts where Categoryid='" + param.ToString() + "' and deleted=0";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getProductsSizeList(SqlConnection conn, string param)
    {
        string sql = "select Prosize,categoryid from Vw_Product_Size where Categoryid='" + param.ToString() + "' and deleted=0 group by Prosize,categoryid";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getPreview(SqlConnection conn, string param)
    {
        string sql = "select image1,image2,image3,image4,image5,Brand,Model,SellingPrice,Stock,Details from Vw_Products where MasterDel=0 and productid='" + param.ToString() + "' and  deleted=0";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();

        return reader;
    }

    public static SqlDataReader getDuplicate(SqlConnection conn, string param, string param1, string today)
    {
        //string today =DateTime.Now.ToShortDateString();
        string sql = "select * from AddCartMaster where productid='" + param.ToString() + "' and customerid='" + param1.ToString() + "' and  deleted=0 and buy=0 and CREATED_DATE='" + today.ToString() + "'";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getWishDuplicate(SqlConnection conn, string param, string param1)
    {
        string sql = "select * from WishListMaster where productid='" + param.ToString() + "' and customerid='" + param1.ToString() + "' and deleted=0";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getBusinessID(SqlConnection conn, string paramSysRegno, string paramEmail)
    {
        string sql = "select * from BusinessRegister where SysRegno='" + paramSysRegno.ToString() + "' and Email='" + paramEmail.ToString() + "' and  deleted=0";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getOrderNo(SqlConnection conn)
    {
        string sql = "";
        sql = "select distinct (OrderNo) from AddCartMaster where deleted=0 and ShippingID is not null order by OrderNo desc";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getOrderDetails(SqlConnection conn, string param, string param1)
    {
        string sql = "select OrderNo,sum(discountprice*Qnty),convert(varchar, created_date, 103) as cdate,PayMethod from VW_OrderDetails where customerid='" + param.ToString() + "' and DATEPART(yyyy,created_date)='" + param1.ToString() + "' and  deleted=0 and buy=1 and status='success' group by OrderNo,created_date,PayMethod order by OrderNo desc";

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getProductReview(SqlConnection conn, string param)
    {
        string sql = "select TOP(5) * from VWProductReview where ProductID='" + param.ToString() + "' and  deleted=0 and Approve=1";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader getcalalogid(SqlConnection conn, string param)
    {
        SqlCommand cmd = new SqlCommand("[sp_selectCatalogMaster]", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@catalogid", param);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    //----------------------MISC------------------------------------------------------------------

    public static void SendMail(string strSubject, string strBody, string strToAddress, string strApprovarMail, string strAttachmentFilename)
    {
        //SmtpClient smtpClient = new SmtpClient();
        //MailMessage message = new MailMessage();
        //if (!(strAttachmentFilename.ToString().Trim() == "NoAttach"))
        //{
        //    Attachment attachment = new Attachment(strAttachmentFilename.ToString().Trim());
        //    message.Attachments.Add(attachment);
        //}
        //MailAddress fromAddress = new MailAddress(ConfigurationManager.AppSettings["FromAddress"].ToString(), "LSB Asset Tracking System");
        //smtpClient.Host = ConfigurationManager.AppSettings["ExchangeServer"].ToString();
        //smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());

        //message.Priority = MailPriority.High;
        //message.From = fromAddress;
        //message.Subject = strSubject.ToString();
        //message.To.Add(strToAddress.ToString());
        //message.CC.Add(strApprovarMail.ToString());
        ////message.CC.Add("bala@e-serbadk.com");
        ////message.CC.Add("karthi@e-serbadk.com");
        ////message.CC.Add("fadzli_mzain@yahoo.com");
        ////message.CC.Add("zuhaifi.mghani@iperintis.com");
        ////message.CC.Add("nurlisa_ahmad@petronas.com.my");
        //message.Body = strBody;
        ////smtpClient.EnableSsl = true;
        ////smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        ////smtpClient.UseDefaultCredentials = false;
        //smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["FromAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString().Trim());
        ////smtpClient.Send(message);
        //message.Dispose();
        //smtpClient.Dispose();
        //File.Delete(strAttachmentFilename.ToString().Trim());
    }
    public static void SendMail(string MailTo, string Subject, string msg)
    {
        MailMessage message1 = new MailMessage();
        message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
        message1.To.Add(new MailAddress(MailTo.ToString().Trim()));
        message1.CC.Add(new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString()));
        message1.Bcc.Add(new MailAddress(ConfigurationManager.AppSettings["MailAddress3"].ToString()));
        message1.Bcc.Add(new MailAddress(ConfigurationManager.AppSettings["MailAddress4"].ToString()));
        message1.Subject = Subject.ToString().Trim();
        message1.IsBodyHtml = true;
        message1.Body = msg;
        SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
        //client1.UseDefaultCredentials = false;
        client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
        //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client1.EnableSsl = true;
        client1.Send(message1);
        message1.Dispose();
        client1.Dispose();
    }


    public static SqlDataReader getProductsDistinctList(SqlConnection connMenu)
    {
        throw new NotImplementedException();
    }

    public static int OrderConfirmation(SqlConnection connMenu, string tranID, string p, string p_2)
    {
        throw new NotImplementedException();
    }
}