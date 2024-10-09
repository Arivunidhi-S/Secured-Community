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
//using System.Web.HttpUtility;
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

public partial class MasterProductEdit : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        btnclikrjt1.Visible = false;


    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["sesUserID"].ToString()))
            {
                SqlConnection connSave = BusinessTier.getConnection();
                connSave.Open();
                connSave.Close();
                Response.Redirect("fmqadmin.aspx", false);
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                lblName.Text = textInfo.ToTitleCase(Session["sesUserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("fmqadmin.aspx", false);
        }
    }

    protected void cboBasicCategories_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            SqlDataReader readerMenu = BusinessTier.getBasicCategoryItems(connMenu,"");
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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "MasterProductEdit", "cboBasicCategories_OnItemsRequested", ex.ToString(), "Audit");
        }

    }

    protected void cboBasicCategories_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        cboCategories.Text = "";
        cboBrand.Text = "";
        cboModel.Text = "";
        Clear();
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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "MasterProductEdit", "cboCategory_OnItemsRequested", ex.ToString(), "Audit");
        }

    }

    protected void cboCategory_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        cboBrand.Text = "";
        cboModel.Text = "";
        Clear();

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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "MasterProductEdit", "cboSupplier_OnItemsRequested", ex.ToString(), "Audit");
        }
    }

    protected void cboBrand_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            DataTable dtBrand = new DataTable();
            SqlDataReader readerMenu = BusinessTier.getBrandItems(connMenu, cboCategories.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
            dtBrand.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtBrand.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Brand"].ToString();
                comboBox.Items.Add(item);
                item.DataBind();
            }
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderForm", "cboBrand_OnItemsRequested", ex.ToString(), "Audit");
        }
    }

    protected void cboBrand_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        cboModel.Text = "";
        Clear();
    }

    protected void cboModel_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            DataTable dtModel = new DataTable();
            SqlDataReader readerMenu = BusinessTier.getModelItems(connMenu, cboCategories.SelectedValue.ToString().Trim(), cboBrand.Text.ToString(), Session["CustomerID"].ToString());
            dtModel.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtModel.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["Model"].ToString();
                comboBox.Items.Add(item);
                item.DataBind();
            }
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderForm", "cboModel_OnItemsRequested", ex.ToString(), "Audit");
        }
    }

    protected void cboModel_SelectedIndexChange(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            string sql = "select * from Vw_Products where deleted=0 and Brand='" + cboBrand.Text.ToString() + "' and Model='" + cboModel.Text.ToString() + "'  and CategoryID='" + cboCategories.SelectedValue.ToString() + "' and CREATED_BY='" + Session["CustomerID"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                cboBasicCategories.ToolTip = reader["ProductID"].ToString();
                txtActualPrice.Text = reader["ActualPrice"].ToString();
                txtSellingPrice.Text = reader["SellingPrice"].ToString();
                txtDiscount.Text = reader["Discount"].ToString();
                txtDiscountPrice.Text = reader["DiscountPrice"].ToString();
                txtShippingCost.Text = reader["ShippingCost"].ToString();
                txtProductDetails.Text = reader["Details"].ToString();
                lnkDownload1.Text = reader["imagePath"].ToString();

                txtWeight.Text = reader["Weight"].ToString();
                txtURL.Text = reader["URL"].ToString();
                cboSupplier.Text = reader["SupplierName"].ToString();
                cboSupplier.SelectedValue = reader["SupplierID"].ToString();

                Img.ImageUrl = lnkDownload1.Text;
                if (string.IsNullOrEmpty(lnkDownload1.Text.ToString().Trim()))
                {
                    flProductPhoto.Visible = true;
                    btnclikrjt1.Visible = false;
                }
                else
                {
                    flProductPhoto.Visible = false;
                    btnclikrjt1.Visible = true;
                    lnkDownload1.Visible = true;
                }
            }
            BusinessTier.DisposeReader(reader);
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "MasterProduct", "cboModel_SelectedIndexChanged", ex.ToString(), "Audit");
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

            if ((string.IsNullOrEmpty(lnkDownload1.Text.ToString())))
            {
                if (string.IsNullOrEmpty(flProductPhoto.FileName.ToString()))
                {
                    lblStatus.Text = "Select ProductPhoto";
                    return;
                }
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
            String path = string.Empty, imagePath = string.Empty, imagePath1 = string.Empty;

            //path = Server.MapPath("");
            //path += "\\web\\Products\\";
            //flProductPhoto.SaveAs(path + flProductPhoto.FileName);string[] ret = FileUpload1.FileName.Split('.');
            if ((string.IsNullOrEmpty(lnkDownload1.Text.ToString())))
            {
                string[] ret = flProductPhoto.FileName.Split('.');
                string downfile = cboBrand.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboModel.Text.ToString() + "." + ret[1].ToString();
                Image(flProductPhoto, downfile.ToString());
                imagePath1 = WebConfigurationManager.AppSettings["WC_ImagePath1"].ToString() + downfile.ToString();
            }
            else
            {
                imagePath1 = lnkDownload1.Text.ToString();
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

            //if (string.IsNullOrEmpty(cboBrand.Text.ToString()) && string.IsNullOrEmpty(cboModel.Text.ToString()))
            //{
            //    //if (string.IsNullOrEmpty(cboBrand.Text.ToString()))
            //    //{
            //    //    lblStatus.Text = "Enter Brand";
            //    //    return;
            //    //}

            //    //if (string.IsNullOrEmpty(txtModel.Text.ToString()))
            //    //{
            //    //    lblStatus.Text = "Enter Model";
            //    //    return;
            //    //}
            //    flg = BusinessTier.Product(conn, 1, Convert.ToInt32(cboCategories.SelectedValue.ToString().Trim()), txtBrand.Text.ToString().Trim(), txtModel.Text.ToString().Trim(), Convert.ToDecimal(txtActualPrice.Text.ToString().Trim()), disc, discprice, Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim()), Convert.ToDecimal(txtShippingCost.Text.ToString().Trim()), imagePath1.ToString(), txtProductDetails.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "N");
            //    lblStatus.Text = "Successfully Added Products!";
            //}
            //else
            //{
            int flg = 0;
            //string ProductDetails = WebUtility.HtmlEncode(txtProductDetails.Text.ToString().Trim());
            //flg = BusinessTier.Product(conn, 1, Convert.ToInt32(cboCategories.SelectedValue.ToString().Trim()), cboBrand.Text.ToString().Trim(), cboModel.Text.ToString().Trim(), Convert.ToDecimal(txtActualPrice.Text.ToString().Trim()), disc, discprice, Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim()), Convert.ToDecimal(txtShippingCost.Text.ToString().Trim()), imagePath1.ToString(), txtProductDetails.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "U");
           // flg = BusinessTier.Product(conn, Convert.ToInt32(cboBasicCategories.ToolTip.ToString()), Convert.ToInt32(cboCategories.SelectedValue.ToString().Trim()), cboBrand.Text.ToString().Trim(), cboModel.Text.ToString().Trim(), Convert.ToDecimal(txtActualPrice.Text.ToString().Trim()), disc, discprice, Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim()), Convert.ToDecimal(txtShippingCost.Text.ToString().Trim()), imagePath1.ToString(), txtProductDetails.Text.ToString().Trim(), Convert.ToInt32(txtWeight.Text.ToString().Trim()), txtURL.Text.ToString().Trim(),Convert.ToInt32(cboSupplier.SelectedValue.ToString().Trim()), Session["CustomerID"].ToString().Trim(), "U");

            flg = BusinessTier.Product(conn, Convert.ToInt32(txtProductID.Text.ToString().Trim()), 1, txtBrand.Text.ToString().Trim(), txtModel.Text.ToString().Trim(), Convert.ToDecimal(txtActualPrice.Text.ToString().Trim()), disc, discprice, Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim()), Convert.ToDecimal(txtShippingCost.Text.ToString().Trim()), imagePath1.ToString(), txtProductDetails.Text.ToString().Trim(), Convert.ToInt32(txtWeight.Text.ToString().Trim()), txtURL.Text.ToString().Trim(), txtCatalogName.SelectedValue.ToString().Trim(), Convert.ToInt32(cboSupplier.SelectedValue.ToString().Trim()), Session["CustomerID"].ToString().Trim(), "U");
            
            
            lblStatus.Text = "Successfully Updated Products!";
            //}
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
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
            per = (1 - (r / p)) * 100;//p - ((r / 100) * p);
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
        String imgpath = FileUpload1.FileName;
        if (imgpath != null)
        {
            Guid uid = Guid.NewGuid(); //get a unique identifier variable

            string FilePathStr = Server.MapPath("~/") + "LogoImages";

            if (!(Directory.Exists(FilePathStr)))
            {
                Directory.CreateDirectory(FilePathStr);
            }

            string SaveLocation = "LogoImages/" + imgpath;
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

    protected void btntest_OnClick1(object sender, EventArgs e)
    {
        //Image(FileUpload1);
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
        Response.Redirect("index.aspx");
    }

    protected void btnEdit_Onclick(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            string sql = "select * from Vw_Products where deleted=0 and ProductID='" + txtProductID.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                cboBasicCategories.Text = reader["BasicCategory"].ToString();
                lblBasicCategories.Text = reader["BasicCategory"].ToString();
                cboCategories.Text = reader["Category"].ToString();
                lblCategories.Text = reader["Category"].ToString();
                cboBrand.Text = reader["Brand"].ToString();
                txtBrand.Text = reader["Brand"].ToString();
                cboModel.Text = reader["Model"].ToString();
                txtModel.Text = reader["Model"].ToString();
                cboBasicCategories.ToolTip = reader["ProductID"].ToString();
                txtActualPrice.Text = reader["ActualPrice"].ToString();
                txtSellingPrice.Text = reader["SellingPrice"].ToString();
                txtDiscount.Text = reader["Discount"].ToString();
                txtDiscountPrice.Text = reader["DiscountPrice"].ToString();
                txtShippingCost.Text = reader["ShippingCost"].ToString();
                txtProductDetails.Text = reader["Details"].ToString();
                lnkDownload1.Text = reader["imagePath"].ToString();

                txtWeight.Text = reader["Weight"].ToString();
                txtURL.Text = reader["URL"].ToString();
                //lnkURL.NavigateUrl = reader["URL"].ToString();
                txtCatalogName.Text = reader["CatalogName"].ToString();
                txtCatalogName.SelectedValue = reader["CatalogID"].ToString();
                cboSupplier.Text = reader["SupplierName"].ToString();
                cboSupplier.SelectedValue = reader["SupplierID"].ToString();

                Img.ImageUrl = lnkDownload1.Text;
                if (string.IsNullOrEmpty(lnkDownload1.Text.ToString().Trim()))
                {
                    flProductPhoto.Visible = true;
                    btnclikrjt1.Visible = false;
                }
                else
                {
                    flProductPhoto.Visible = false;
                    btnclikrjt1.Visible = true;
                    lnkDownload1.Visible = true;
                }
            }
            BusinessTier.DisposeReader(reader);
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "MasterProductEdit", "btnEdit_Onclick", ex.ToString(), "Audit");
        }
    }

    protected void lnkDownload1_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload1.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=400,height=200');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx", false);
        }
    }

    protected void btnclikrjt1_Onclick(object sender, EventArgs e)
    {
        lnkDownload1.Visible = false;
        lnkDownload1.Text = string.Empty;
        btnclikrjt1.Visible = false;
        flProductPhoto.Visible = true;
        Img.ImageUrl = "";
    }

    public void Clear()
    {

        cboBasicCategories.ToolTip = "";
        txtActualPrice.Text = "";
        txtSellingPrice.Text = "";
        txtDiscount.Text = "";
        txtDiscountPrice.Text = "";
        txtShippingCost.Text = "";
        txtProductDetails.Text = "";
        lnkDownload1.Text = "";
        txtWeight.Text = "";
        txtURL.Text = "";
        cboSupplier.Text = "";
        cboSupplier.SelectedValue = "";
        Img.ImageUrl = "";
        lnkDownload1.Visible = false;
        lnkDownload1.Text = string.Empty;
        btnclikrjt1.Visible = false;
        flProductPhoto.Visible = true;
    }
}