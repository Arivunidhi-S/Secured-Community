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

public partial class MasterProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["sesUserID"].ToString()))
            {
                Response.Redirect("FMQAdmin.aspx");
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                lblName.Text = textInfo.ToTitleCase(Session["sesUserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("FMQAdmin.aspx");
        }
    }

    protected void cboBasicCategories_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getBasicCategoryItems(connMenu, "");
            dtCategoryItems.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtCategoryItems.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["BasicCategory"].ToString();
                item.Value = row["BasicCategoryID"].ToString();

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

    protected void cboCategory_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getCategoryItems(connMenu, cboBasicCategories.SelectedValue.ToString());
            dtCategoryItems.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtCategoryItems.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Category"].ToString();
                item.Value = row["CategoryID"].ToString();

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

    protected void cboSupplier_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            string sql = "";
            sql = "select SupplierName,SupplierID from SupplierDetails where deleted=0 group by SupplierName,SupplierID order by SupplierID desc";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, connMenu);
            DataTable g_datatable = new DataTable();
            sqlDataAdapter.Fill(g_datatable);
            BusinessTier.DisposeAdapter(sqlDataAdapter);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in g_datatable.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["SupplierName"].ToString();
                item.Value = row["SupplierID"].ToString();

                comboBox.Items.Add(item);
                item.DataBind();
            }
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }
    }

    protected void txtCatalogName1_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            //DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();

            string sql = "select Catalogid FROM CatalogMaster WHERE Deleted=0";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, connMenu);
            DataTable g_datatable = new DataTable();
            sqlDataAdapter.Fill(g_datatable);
            BusinessTier.DisposeAdapter(sqlDataAdapter);


            SqlDataReader readerMenu;
            int i = 0;
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in g_datatable.Rows)
            {

                RadComboBoxItem item = new RadComboBoxItem();
                readerMenu = BusinessTier.getcalalogid(connMenu, g_datatable.Rows[0][i].ToString());
                if (readerMenu.Read())
                {
                    item.Text = readerMenu["CatalogName"].ToString();
                    item.Value = readerMenu["Catalogid"].ToString();

                    comboBox.Items.Add(item);
                    item.DataBind();
                }
                BusinessTier.DisposeReader(readerMenu);
                i = i + 1;
            }

            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void txtCatalogName_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            string sql = "";
            sql = "select Catalogid,CatalogName FROM CatalogMaster WHERE Deleted=0 order by Catalogid desc";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, connMenu);
            DataTable g_datatable = new DataTable();
            sqlDataAdapter.Fill(g_datatable);
            BusinessTier.DisposeAdapter(sqlDataAdapter);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in g_datatable.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["CatalogName"].ToString();
                item.Value = row["Catalogid"].ToString();

                comboBox.Items.Add(item);
                item.DataBind();
            }
            BusinessTier.DisposeConnection(connMenu);

        }
        catch (Exception ex)
        {

            //ShowMessage("Please Select the Installation Name", "Red");
        }

    }

    protected void btnAddProduct_OnClick(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (string.IsNullOrEmpty(cboCategories.Text.ToString().Trim()))
            {
                lblStatus.Text = "Please Choose Categories";
                return;
            }
            if (string.IsNullOrEmpty(txtBrand.Text.ToString()))
            {
                lblStatus.Text = "Enter Brand";
                return;
            }

            //if (string.IsNullOrEmpty(txtModel.Text.ToString()))
            //{
            //    lblStatus.Text = "Enter Model";
            //    return;
            //}
            if (string.IsNullOrEmpty(flProductPhoto.FileName.ToString()))
            {
                lblStatus.Text = "Select ProductPhoto";
                return;
            }
            int disc = 0; decimal discprice = 0;
            if (!(string.IsNullOrEmpty(txtDiscount.Text.ToString())))
            {
                disc = Convert.ToInt32(txtDiscount.Text.ToString());
            }

            if (!(string.IsNullOrEmpty(txtDiscountPrice.Text.ToString())))
            {
                discprice = Convert.ToDecimal(txtDiscountPrice.Text.ToString());
            }
            else
            {
                discprice = Convert.ToDecimal(txtActualPrice.Text.ToString());
            }
            if (string.IsNullOrEmpty(txtShippingCost.Text.ToString().Trim()))
            {
                txtShippingCost.Text = "0";
            }
            if (string.IsNullOrEmpty(txtWeight.Text.ToString().Trim()))
            {
                txtWeight.Text = "0";
            }
            if (string.IsNullOrEmpty(cboSupplier.Text.ToString().Trim()))
            {
                cboSupplier.SelectedValue = "0";
            }
            if (string.IsNullOrEmpty(txtCatalogName.Text.ToString().Trim()))
            {
                txtCatalogName.SelectedValue = "0";
            }
            String path = string.Empty, imagePath = string.Empty, imagePath1 = string.Empty;

            //path = Server.MapPath("");
            //path += "\\web\\Products\\";
            //flProductPhoto.SaveAs(path + flProductPhoto.FileName);string[] ret = FileUpload1.FileName.Split('.');
            string[] ret = flProductPhoto.FileName.Split('.');
            string downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + txtBrand.Text.ToString() + "." + ret[1].ToString();
            Image(flProductPhoto, downfile.ToString());
            imagePath1 = WebConfigurationManager.AppSettings["WC_ImagePath1"].ToString() + downfile.ToString();
            int flg = BusinessTier.Product(conn, 1, Convert.ToInt32(cboCategories.SelectedValue.ToString().Trim()), txtBrand.Text.ToString().Trim(), txtModel.Text.ToString().Trim(), Convert.ToDecimal(txtActualPrice.Text.ToString().Trim()), disc, discprice, Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim()), Convert.ToDecimal(txtShippingCost.Text.ToString().Trim()), imagePath1.ToString(), txtProductDetails.Text.ToString().Trim(), Convert.ToInt32(txtWeight.Text.ToString().Trim()), txtURL.Text.ToString().Trim(), txtCatalogName.SelectedValue.ToString().Trim(), Convert.ToInt32(cboSupplier.SelectedValue.ToString().Trim()), Session["CustomerID"].ToString().Trim(), "N");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Added Products!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message.ToString();
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "MasterProduct", "btnAddProduct_OnClick", ex.ToString(), "Audit");
            lblStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }


    }

    protected void txtDiscount_OnTextChanged(object sender, EventArgs e)
    {
         try
        {
        lblStatus.Text = string.Empty;
        if (string.IsNullOrEmpty(txtSellingPrice.Text.ToString()))
        {
            txtSellingPrice.Text = "0";
        }
        if (string.IsNullOrEmpty(txtDiscountPrice.Text.ToString()))
        {
            txtDiscountPrice.Text = "0";
        }
        decimal p = 0, r = 0, per = 0;
        p = Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim());
        r = Convert.ToDecimal(txtDiscountPrice.Text.ToString().Trim());
        per = (1 - (r / p))*100 ;//p - ((r / 100) * p);
        txtDiscount.Text = per.ToString("#,0");
        }
         catch (Exception ex)
         {
             InsertLogAuditTrail(Session["sesUserID"].ToString(), "MasterProductEdit", "txtDiscount_OnTextChanged", ex.ToString(), "Audit");
         }
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void btntest_OnClick(object sender, EventArgs e)
    {
        try
        {

            String imgpath = FileUpload1.FileName;
            if (imgpath != null)
            {
                Guid uid = Guid.NewGuid(); //get a unique identifier variable

                string FilePathStr = Server.MapPath("~/") + "web/Products";

                if (!(Directory.Exists(FilePathStr)))
                {
                    Directory.CreateDirectory(FilePathStr);
                }

                string SaveLocation = "web/Products/" + imgpath;
                string fileExtention = FileUpload1.PostedFile.ContentType;
                int fileLenght = FileUpload1.PostedFile.ContentLength;
                if (fileExtention == "image/png" || fileExtention == "image/jpeg" || fileExtention == "image/x-png")
                {
                    if (fileLenght <= 1048576)
                    {
                        System.Drawing.Bitmap bmpUploadedImage = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);

                        System.Drawing.Image objImage = ScaleImage(bmpUploadedImage, 200);
                        objImage.Save(Server.MapPath(SaveLocation), ImageFormat.Png);
                        lblStatus.ForeColor = Color.Green;
                        lblStatus.Text = "The file has been uploaded.";
                        Img.ImageUrl = "~/" + SaveLocation;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
        }
    }

    protected void btntest_OnClick1(object sender, EventArgs e)
    {
        try
        {
            txtProductDetails.Text = "";
            lblStatus.Text = "";

            //Image(FileUpload1);
            String Insdate = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(Insdate);
            Insdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";
            string[] orderid = new string[5];
            int i = 0;
            //orderid[0] = "hello";
            //orderid[1] = "hi";
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            string sql = "SELECT Brand from Vw_AddCart where DELETED=0 and buy=0 and Customerid='" + Session["CustomerID"].ToString().Trim() + "' and CREATED_DATE='" + Insdate.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            //reader.Read();
            //    for(int i = 0; i<reader.FieldCount; i++)
            {

                orderid[i] = reader["Brand"].ToString();

                //txtProductDetails.Text = reader["Brand"].ToString();
                txtProductDetails.Text = txtProductDetails.Text.Trim() + " " + orderid[i].ToString();

                i = i + 1;
            }
            BusinessTier.DisposeReader(reader);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
        }
    }

    protected void Image(FileUpload FileUpload1, string ImageName)
    {
        String imgpath = FileUpload1.FileName;
        if (imgpath != null)
        {
            Guid uid = Guid.NewGuid(); //get a unique identifier variable

            string FilePathStr = Server.MapPath("~/") + "web/Products";

            if (!(Directory.Exists(FilePathStr)))
            {
                Directory.CreateDirectory(FilePathStr);
            }

            //string[] ret = FileUpload1.FileName.Split('.');
            //string downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + txtBrand.Text.ToString() + "." + ret[1].ToString();

            string SaveLocation = "web/Products/" + ImageName.ToString();
            string fileExtention = FileUpload1.PostedFile.ContentType;
            int fileLenght = FileUpload1.PostedFile.ContentLength;
            if (fileExtention == "image/png" || fileExtention == "image/jpeg" || fileExtention == "image/x-png")
            {
                if (fileLenght <= 1048576)
                {
                    System.Drawing.Bitmap bmpUploadedImage = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);

                    System.Drawing.Image objImage = ScaleImage(bmpUploadedImage, 212);
                    objImage.Save(Server.MapPath(SaveLocation), ImageFormat.Png);
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "The file has been uploaded.";
                    Img.ImageUrl = "~/" + SaveLocation;
                }
            }
        }
    }

    public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxImageHeight)
    {

        /* we will resize image based on the height/width ratio by passing expected height as parameter. Based on Expected height and current image height, new ratio will be arrived and using the same we will do the resizing of image width. */

        //var ratio = (double)maxImageHeight / image.Height;
        //var newWidth = (int)(image.Width * ratio);
        //var newHeight = (int)(image.Height * ratio);
        //var newImage = new Bitmap(newWidth, newHeight);
        //using (var g = Graphics.FromImage(newImage))
        //{
        //    g.DrawImage(image, 0, 0, newWidth, newHeight);
        //}
        //return newImage;

        var newImage = new Bitmap(212, 212);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, 212, 212);
        }
        return newImage;
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx", false);


    }

    protected void btnNext_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("ProductItemMaster.aspx", false);
    }
}