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

public partial class ProductItemMaster : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["sesUserID"].ToString()))
            {
                SqlConnection connSave = BusinessTier.getConnection();
                connSave.Open();
                connSave.Close();
                Response.Redirect("SupplierLogin.aspx",false);

            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                lblName.Text = textInfo.ToTitleCase(Session["sesUserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("SupplierLogin.aspx",false);
        }
        btnclikrjt1.Visible = false;
        btnclikrjt2.Visible = false;
        btnclikrjt3.Visible = false;
        btnclikrjt4.Visible = false;
        btnclikrjt5.Visible = false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

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
                item.Value = row["ProductID"].ToString();
                //item.Attributes.Add("CategoryID", row["CategoryID"].ToString());
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
                item.Value = row["ProductID"].ToString();
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

    protected void cboModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            string sql = "select * from MasterItemProduct where DELETED=0 and [ProductID] ='" + cboModel.SelectedValue.ToString() + "' and CREATED_BY='" + Session["CustomerID"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtTotalStock.Text = reader["TotalStock"].ToString();
                lnkDownload1.Text = reader["Image1"].ToString();
                lnkDownload2.Text = reader["Image2"].ToString();
                lnkDownload3.Text = reader["Image3"].ToString();
                lnkDownload4.Text = reader["Image4"].ToString();
                lnkDownload5.Text = reader["Image5"].ToString();

                if (string.IsNullOrEmpty(lnkDownload1.Text.ToString().Trim()))
                {
                    FileImage1.Visible = true;
                    btnclikrjt1.Visible = false;
                }
                else
                {
                    FileImage1.Visible = false;
                    btnclikrjt1.Visible = true;
                    lnkDownload1.Visible = true;
                }

                if (string.IsNullOrEmpty(lnkDownload2.Text.ToString().Trim()))
                {
                    FileImage2.Visible = true;
                    btnclikrjt2.Visible = false;
                }
                else
                {
                    FileImage2.Visible = false;
                    btnclikrjt2.Visible = true;
                    lnkDownload2.Visible = true;
                }

                if (string.IsNullOrEmpty(lnkDownload3.Text.ToString().Trim()))
                {
                    FileImage3.Visible = true;
                    btnclikrjt3.Visible = false;
                }
                else
                {
                    FileImage3.Visible = false;
                    btnclikrjt3.Visible = true;
                    lnkDownload3.Visible = true;
                }

                if (string.IsNullOrEmpty(lnkDownload4.Text.ToString().Trim()))
                {
                    FileImage4.Visible = true;
                    btnclikrjt4.Visible = false;
                }
                else
                {
                    FileImage4.Visible = false;
                    btnclikrjt4.Visible = true;
                    lnkDownload4.Visible = true;
                }

                if (string.IsNullOrEmpty(lnkDownload5.Text.ToString().Trim()))
                {
                    FileImage5.Visible = true;
                    btnclikrjt5.Visible = false;
                }
                else
                {
                    FileImage5.Visible = false;
                    btnclikrjt5.Visible = true;
                    lnkDownload5.Visible = true;
                }
                //RadGrid2.DataSource = DataSourceHelper2(cboModel.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
                //RadGrid2.Rebind();
            }
            BusinessTier.DisposeReader(reader);
            BusinessTier.DisposeConnection(conn);

        }


        catch (Exception ex)
        {

            InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "cboModel_SelectedIndexChanged", "Success", "Log");
        }

    }

    //protected void cboBrand_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        SqlConnection conn = BusinessTier.getConnection();
    //        conn.Open();
    //        string sql = "select * from MasterItemProduct where DELETED=0 and [ProductID] ='" + cboBrand.SelectedValue.ToString() + "' and CREATED_BY='" + Session["CustomerID"].ToString() + "' ";
    //        SqlCommand cmd = new SqlCommand(sql, conn);
    //        SqlDataReader reader = cmd.ExecuteReader();
    //        if (reader.Read())
    //        {
    //            txtTotalStock.Text = reader["TotalStock"].ToString();
    //            lnkDownload1.Text = reader["Image1"].ToString();
    //            lnkDownload2.Text = reader["Image2"].ToString();
    //            lnkDownload3.Text = reader["Image3"].ToString();
    //            lnkDownload4.Text = reader["Image4"].ToString();
    //            lnkDownload5.Text = reader["Image5"].ToString();

    //            if (string.IsNullOrEmpty(lnkDownload1.Text.ToString().Trim()))
    //            {
    //                FileImage1.Visible = true;
    //                btnclikrjt1.Visible = false;
    //            }
    //            else
    //            {
    //                FileImage1.Visible = false;
    //                btnclikrjt1.Visible = true;
    //                lnkDownload1.Visible = true;
    //            }

    //            if (string.IsNullOrEmpty(lnkDownload2.Text.ToString().Trim()))
    //            {
    //                FileImage2.Visible = true;
    //                btnclikrjt2.Visible = false;
    //            }
    //            else
    //            {
    //                FileImage2.Visible = false;
    //                btnclikrjt2.Visible = true;
    //                lnkDownload2.Visible = true;
    //            }

    //            if (string.IsNullOrEmpty(lnkDownload3.Text.ToString().Trim()))
    //            {
    //                FileImage3.Visible = true;
    //                btnclikrjt3.Visible = false;
    //            }
    //            else
    //            {
    //                FileImage3.Visible = false;
    //                btnclikrjt3.Visible = true;
    //                lnkDownload3.Visible = true;
    //            }

    //            if (string.IsNullOrEmpty(lnkDownload4.Text.ToString().Trim()))
    //            {
    //                FileImage4.Visible = true;
    //                btnclikrjt4.Visible = false;
    //            }
    //            else
    //            {
    //                FileImage4.Visible = false;
    //                btnclikrjt4.Visible = true;
    //                lnkDownload4.Visible = true;
    //            }

    //            if (string.IsNullOrEmpty(lnkDownload5.Text.ToString().Trim()))
    //            {
    //                FileImage5.Visible = true;
    //                btnclikrjt5.Visible = false;
    //            }
    //            else
    //            {
    //                FileImage5.Visible = false;
    //                btnclikrjt5.Visible = true;
    //                lnkDownload5.Visible = true;
    //            }
    //            //RadGrid2.DataSource = DataSourceHelper2(cboModel.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
    //            //RadGrid2.Rebind();
    //        }
    //        BusinessTier.DisposeReader(reader);
    //        BusinessTier.DisposeConnection(conn);

    //    }


    //    catch (Exception ex)
    //    {

    //        InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "cboModel_SelectedIndexChanged", "Success", "Log");
    //    }

    //}

    //protected void cboCategory_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        SqlConnection conn = BusinessTier.getConnection();
    //        conn.Open();
    //        string sql1 = "select distinct(Brand) from MasterProducts where DELETED=0 and [Categoryid] ='" + cboCategories.SelectedValue.ToString() + "'";
    //        SqlDataAdapter adapter1 = new SqlDataAdapter(sql1, conn);
    //        DataTable dataTable1 = new DataTable();
    //        adapter1.Fill(dataTable1);
    //        cboBrand.Items.Clear();
    //        cboBrand.Text = string.Empty;
    //        foreach (DataRow row in dataTable1.Rows)
    //        {
    //            RadComboBoxItem item = new RadComboBoxItem();
    //            item.Text = row["Brand"].ToString();

    //            cboBrand.Items.Add(item);
    //            item.DataBind();
    //        }
    //        adapter1.Dispose();
    //        BusinessTier.DisposeConnection(conn);

    //    }


    //    catch (Exception ex)
    //    {

    //        //ShowMessage("Please Select the Installation Name", "Red");
    //    }

    //}

    //protected void cboBrand_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        //SqlConnection conn = BusinessTier.getConnection();
    //        //conn.Open();
    //        //string sql1 = "select model,productid from MasterProducts where DELETED=0 and [Brand] ='" + cboBrand.Text.ToString().Trim() + "' and [Categoryid] ='" + cboCategories.SelectedValue.ToString() + "'";
    //        //SqlDataAdapter adapter1 = new SqlDataAdapter(sql1, conn);
    //        //DataTable dataTable1 = new DataTable();
    //        //adapter1.Fill(dataTable1);
    //        //cboModel.Items.Clear();
    //        //cboModel.Text = string.Empty;
    //        //foreach (DataRow row in dataTable1.Rows)
    //        //{
    //        //    RadComboBoxItem item = new RadComboBoxItem();
    //        //    item.Text = row["model"].ToString();
    //        //    item.Value = row["productid"].ToString();

    //        //    cboModel.Items.Add(item);
    //        //    item.DataBind();
    //        //}
    //        //adapter1.Dispose();
    //        //BusinessTier.DisposeConnection(conn);

    //        SqlConnection connMenu = BusinessTier.getConnection();
    //        connMenu.Open();
    //        DataTable dtBrand = new DataTable();
    //        SqlDataReader readerMenu = BusinessTier.getBrandItems(connMenu, cboCategories.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
    //        dtBrand.Load(readerMenu);
    //        RadComboBox comboBox = (RadComboBox)sender;
    //        comboBox.Items.Clear();
    //        foreach (DataRow row in dtBrand.Rows)
    //        {
    //            RadComboBoxItem item = new RadComboBoxItem();
    //            item.Text = row["Brand"].ToString();
    //            comboBox.Items.Add(item);
    //            item.DataBind();
    //        }
    //        BusinessTier.DisposeConnection(connMenu);

    //    }


    //    catch (Exception ex)
    //    {

    //        //ShowMessage("Please Select the Installation Name", "Red");
    //    }

    //}

  

    protected void btnAddProduct_OnClick(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        lblStatus.ForeColor = Color.Red;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (string.IsNullOrEmpty(cboCategories.Text.ToString().Trim()))
            {
                lblStatus.Text = "Select Categories";
                return;
            }
            if (string.IsNullOrEmpty(cboBrand.Text.ToString()))
            {
                lblStatus.Text = "Select Brand";
                return;
            }

            //if (string.IsNullOrEmpty(cboModel.Text.ToString()))
            //{
            //    lblStatus.Text = "Select Model";
            //    return;
            //}

            String path = string.Empty, path1 = string.Empty, imagePath1 = string.Empty, imagePath2 = string.Empty, imagePath3 = string.Empty, imagePath4 = string.Empty, imagePath5 = string.Empty;

            //path = Server.MapPath("");
            //path += "\\web\\Products\\";
            path1 = WebConfigurationManager.AppSettings["WC_ImagePath1"].ToString();

            if (!(string.IsNullOrEmpty(FileImage1.FileName.ToString())))
            {

                string downfile = string.Empty;
                string[] ret = FileImage1.FileName.Split('.');
                downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboBrand.SelectedValue.ToString() + "1." + ret[1].ToString();

                //FileImage1.SaveAs(path + downfile.ToString());

                Image(FileImage1, downfile);
                imagePath1 = path1 + downfile.ToString();
            }
            if (!(string.IsNullOrEmpty(FileImage2.FileName.ToString())))
            {
                string downfile = string.Empty;
                string[] ret = FileImage2.FileName.Split('.');
                downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboBrand.SelectedValue.ToString() + "2." + ret[1].ToString();
                // FileImage2.SaveAs(path + downfile.ToString());
                Image(FileImage2, downfile);
                imagePath2 = path1 + downfile.ToString();
            }
            if (!(string.IsNullOrEmpty(FileImage3.FileName.ToString())))
            {
                string downfile = string.Empty;
                string[] ret = FileImage3.FileName.Split('.');
                downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboBrand.SelectedValue.ToString() + "3." + ret[1].ToString();
                //FileImage3.SaveAs(path + downfile.ToString());
                Image(FileImage3, downfile);
                imagePath3 = path1 + downfile.ToString();
            }
            if (!(string.IsNullOrEmpty(FileImage4.FileName.ToString())))
            {
                string downfile = string.Empty;
                string[] ret = FileImage4.FileName.Split('.');
                downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboBrand.SelectedValue.ToString() + "4." + ret[1].ToString();
                //FileImage4.SaveAs(path + downfile.ToString());
                Image(FileImage4, downfile);
                imagePath4 = path1 + downfile.ToString();
            }
            if (!(string.IsNullOrEmpty(FileImage5.FileName.ToString())))
            {
                string downfile = string.Empty;
                string[] ret = FileImage2.FileName.Split('.');
                downfile = cboCategories.Text.ToString() + Session["CustomerID"].ToString().Trim() + cboBrand.SelectedValue.ToString() + "5." + ret[1].ToString();
                Image(FileImage5, downfile);
                //FileImage5.SaveAs(path + downfile.ToString());
                imagePath5 = path1 + downfile.ToString();
            }

            string sql = "select * from MasterItemProduct where DELETED=0 and [ProductID] ='" + cboBrand.SelectedValue.ToString() + "' and CREATED_BY='" + Session["CustomerID"].ToString() + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            int flg = 0;
            if (reader.Read())
            {
                string piid = reader["ProductItemID"].ToString();

                if (!(string.IsNullOrEmpty(lnkDownload1.Text.ToString())))
                {
                    imagePath1 = lnkDownload1.Text.ToString();
                }
                if (!(string.IsNullOrEmpty(lnkDownload2.Text.ToString())))
                {
                    imagePath2 = lnkDownload2.Text.ToString();
                }
                if (!(string.IsNullOrEmpty(lnkDownload3.Text.ToString())))
                {
                    imagePath3 = lnkDownload3.Text.ToString();
                }
                if (!(string.IsNullOrEmpty(lnkDownload4.Text.ToString())))
                {
                    imagePath4 = lnkDownload4.Text.ToString();
                }
                if (!(string.IsNullOrEmpty(lnkDownload5.Text.ToString())))
                {
                    imagePath5 = lnkDownload5.Text.ToString();
                }
                BusinessTier.DisposeReader(reader);
                flg = BusinessTier.ProductItem(conn, Convert.ToInt32(piid.ToString()), Convert.ToInt32(cboBrand.SelectedValue.ToString().Trim()), Convert.ToInt32(txtTotalStock.Text.ToString()), imagePath1.ToString().Trim(), imagePath2.ToString().Trim(), imagePath3.ToString(), imagePath4.ToString(), imagePath5.ToString(), 0, Session["CustomerID"].ToString().Trim(), "U");
            }
            else
            {
                BusinessTier.DisposeReader(reader);
                flg = BusinessTier.ProductItem(conn, 1, Convert.ToInt32(cboBrand.SelectedValue.ToString().Trim()), Convert.ToInt32(txtTotalStock.Text.ToString()), imagePath1.ToString().Trim(), imagePath2.ToString().Trim(), imagePath3.ToString(), imagePath4.ToString(), imagePath5.ToString(), 0, Session["CustomerID"].ToString().Trim(), "N");
            }

            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Added Product Images";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message.ToString();
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "btnAddProduct_OnClick", ex.ToString(), "Audit");
            lblStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
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

            string SaveLocation = "web/Products/" + ImageName.ToString();
            string fileExtention = FileUpload1.PostedFile.ContentType;
            int fileLenght = FileUpload1.PostedFile.ContentLength;
            if (fileExtention == "image/png" || fileExtention == "image/jpeg" || fileExtention == "image/x-png")
            {
                if (fileLenght <= 1048576)
                {
                    System.Drawing.Bitmap bmpUploadedImage = new System.Drawing.Bitmap(FileUpload1.PostedFile.InputStream);

                    System.Drawing.Image objImage = ScaleImage(bmpUploadedImage, 995);
                    objImage.Save(Server.MapPath(SaveLocation), ImageFormat.Png);
                    lblStatus.ForeColor = Color.Green;
                    lblStatus.Text = "The file has been uploaded.";
                    //Img.ImageUrl = "~/" + SaveLocation;
                }
            }
        }
    }

    public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxImageHeight)
    {

        /* we will resize image based on the height/width ratio by passing expected height as parameter. Based on Expected height and current image height, new ratio will be arrived and using the same we will do the resizing of image width. */

        var ratio = (double)maxImageHeight / image.Height;
        var newWidth = (int)(image.Width * ratio);
        var newHeight = (int)(image.Height * ratio);
        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    public DataTable DataSourceHelper2(string ProductID, string userid)
    {
        int delval = 0;
        string sql = "";
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        sql = "select * FROM MasterPricing WHERE Deleted='" + delval + "' and ProductID='" + ProductID.ToString() + "' and CREATED_BY='" + userid.ToString() + "' ";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    //protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    //{
    //    try
    //    {
    //        if (string.IsNullOrEmpty(cboModel.SelectedValue.ToString().Trim()))
    //        {
    //            cboModel.SelectedValue = "0";
    //        }
    //        RadGrid2.DataSource = DataSourceHelper2(cboModel.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
    //        RadGrid2.Rebind();
    //    }
    //    catch (Exception ex)
    //    {
    //        //ShowMessage(9);
    //        //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
    //        InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "RadGrid2_NeedDataSource", ex.ToString(), "Audit");
    //    }
    //}

    //protected void RadGrid2_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    //{
    //    try
    //    {
    //        string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PricingID"].ToString();
    //        SqlConnection conn = BusinessTier.getConnection();
    //        conn.Open();
    //        int flg = 0;
    //        flg = BusinessTier.AddStock(conn, Convert.ToInt32(ID.ToString().Trim()), Convert.ToInt32(cboModel.SelectedValue.ToString().Trim()), "", "", "", Session["CustomerID"].ToString().Trim(), "D");
    //        BusinessTier.DisposeConnection(conn);
    //        if (flg >= 1)
    //        {
    //            lblGridStatus.Text = "Sucessfully Delete";
    //            lblGridStatus.ForeColor = Color.Red;
    //        }
    //        //InsertLogAuditTrial is used to insert the action into MasterLog table
    //        InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "RadGrid2_DeleteCommand", "Success", "Log");
    //    }
    //    catch (Exception ex)
    //    {
    //        //ShowMessage(7);
    //        e.Canceled = true;
    //        //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
    //        InsertLogAuditTrail(Session["CustomerID"].ToString(), "ProductItemMaster", "RadGrid2_DeleteCommand", ex.ToString(), "Audit");
    //    }
    //}

    //protected void btnAddStock_OnClick(object sender, EventArgs e)
    //{
    //    lblStatus.Text = string.Empty;
    //    lblStatus.ForeColor = Color.Red;
    //    SqlConnection conn = BusinessTier.getConnection();
    //    conn.Open();
    //    try
    //    {
    //        if (string.IsNullOrEmpty(txtSize.Text.ToString().Trim()))
    //        {
    //            lblStatus.Text = "Enter Size";
    //            return;
    //        }
    //        if (string.IsNullOrEmpty(txtStock.Text.ToString().Trim()))
    //        {
    //            lblStatus.Text = "Enter Stock";
    //            return;
    //        }
    //        int flg = 0;
    //        if (string.IsNullOrEmpty(txtSize.ToolTip.ToString().Trim()))
    //        {

    //            flg = BusinessTier.AddStock(conn, 1, Convert.ToInt32(cboModel.SelectedValue.ToString().Trim()), txtcolor.Text.ToString().Trim(), txtSize.Text.ToString().Trim(), txtStock.Text.ToString(), Session["CustomerID"].ToString().Trim(), "N");
    //            lblGridStatus.Text = "Sucessfully Added";
    //            lblGridStatus.ForeColor = Color.Green;
    //        }
    //        else
    //        {
    //            flg = BusinessTier.AddStock(conn, Convert.ToInt32(txtSize.ToolTip.ToString().Trim()), Convert.ToInt32(cboModel.SelectedValue.ToString().Trim()), txtcolor.Text.ToString().Trim(), txtSize.Text.ToString().Trim(), txtStock.Text.ToString(), Session["CustomerID"].ToString().Trim(), "U");
    //            lblGridStatus.Text = "Sucessfully Updated";
    //            lblGridStatus.ForeColor = Color.Green;
    //        }
    //            BusinessTier.DisposeConnection(conn);
    //            //if (flg >= 1)
    //            //{
                   
    //            //}
          
    //    }
    //    catch (Exception ex)
    //    {
    //        lblGridStatus.Text = ex.Message.ToString();
    //        InsertLogAuditTrail(Session["sesUserID"].ToString(), "btnAddProduct_OnClick", "ProductItemMaster", ex.ToString(), "Audit");
    //        lblGridStatus.ForeColor = Color.Red;
    //    }
    //    finally
    //    {
    //        BusinessTier.DisposeConnection(conn);
    //    }

    //    RadGrid2.DataSource = DataSourceHelper2(cboModel.SelectedValue.ToString().Trim(), Session["CustomerID"].ToString());
    //    RadGrid2.Rebind();
    //}

    protected void lnkDownload1_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload1.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=558,height=768');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lnkDownload2_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload2.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=558,height=768');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lnkDownload3_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload3.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=558,height=768');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lnkDownload4_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload4.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=558,height=768');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lnkDownload5_OnClick(object sender, EventArgs e)
    {
        try
        {
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();

            string line = lnkDownload5.Text.ToString().Trim();
            string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
            string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=558,height=768');", true);
        }
        catch (Exception Ex)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnclikrjt1_Onclick(object sender, EventArgs e)
    {
        lnkDownload1.Visible = false;
        lnkDownload1.Text = string.Empty;
        btnclikrjt1.Visible = false;
        FileImage1.Visible = true;
    }

    protected void btnclikrjt2_Onclick(object sender, EventArgs e)
    {
        lnkDownload2.Visible = false;
        lnkDownload2.Text = string.Empty;
        btnclikrjt2.Visible = false;
        FileImage2.Visible = true;
    }

    protected void btnclikrjt3_Onclick(object sender, EventArgs e)
    {
        lnkDownload3.Visible = false;
        lnkDownload3.Text = string.Empty;
        btnclikrjt3.Visible = false;
        FileImage3.Visible = true;
    }

    protected void btnclikrjt4_Onclick(object sender, EventArgs e)
    {
        lnkDownload4.Visible = false;
        lnkDownload4.Text = string.Empty;
        btnclikrjt4.Visible = false;
        FileImage4.Visible = true;
    }

    protected void btnclikrjt5_Onclick(object sender, EventArgs e)
    {
        lnkDownload5.Visible = false;
        lnkDownload5.Text = string.Empty;
        btnclikrjt5.Visible = false;
        FileImage5.Visible = true;
    }

  

    protected void cboBasicCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        cboCategories.Items.Clear();
        cboBrand.Items.Clear();
        cboModel.Items.Clear();
        cboCategories.Text = string.Empty;
        cboBrand.Text = string.Empty;
        txtTotalStock.Text = string.Empty;
        cboModel.Text = string.Empty;
        //lblGridStatus.Text = string.Empty;

        lnkDownload1.Visible = false;
        lnkDownload1.Text = string.Empty;
        btnclikrjt1.Visible = false;
        FileImage1.Visible = true;

        lnkDownload2.Visible = false;
        lnkDownload2.Text = string.Empty;
        btnclikrjt2.Visible = false;
        FileImage2.Visible = true;

        lnkDownload3.Visible = false;
        lnkDownload3.Text = string.Empty;
        btnclikrjt3.Visible = false;
        FileImage3.Visible = true;

        lnkDownload4.Visible = false;
        lnkDownload4.Text = string.Empty;
        btnclikrjt4.Visible = false;
        FileImage4.Visible = true;

        lnkDownload5.Visible = false;
        lnkDownload5.Text = string.Empty;
        btnclikrjt5.Visible = false;
        FileImage5.Visible = true;
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    //protected void RadGrid2_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    //{
    //    lblGridStatus.Text = string.Empty;
    //    if (e.CommandName == "RowClick" && e.Item is GridDataItem)
    //    {
    //        e.Item.Selected = true;
    //        string strPricingID = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PricingID"]).ToString();
    //        SqlConnection conn = BusinessTier.getConnection();
    //        conn.Open();
    //        try
    //        {
    //            string sql = "Select * from MasterPricing where PricingID='" + strPricingID.ToString() + "' and deleted=0";
    //            SqlCommand cmd = new SqlCommand(sql, conn);
    //            SqlDataReader rd = cmd.ExecuteReader();

    //            if (rd.Read())
    //            {
    //                txtSize.ToolTip = (rd["PricingID"].ToString());
    //                txtSize.Text = (rd["ProSize"].ToString());
    //                txtStock.Text = (rd["Stock"].ToString());
    //            }
    //            BusinessTier.DisposeReader(rd);
    //            BusinessTier.DisposeConnection(conn);
    //        }
    //        catch (Exception ex)
    //        {
    //            //lblStatus.Text = ex.Message;
    //            BusinessTier.DisposeConnection(conn);
    //            InsertLogAuditTrail(Session["sesUserID"].ToString(), "ProductItemMaster", "RadGrid2_ItemCommand", ex.ToString(), "Audit");
    //        }
    //    }
    //}

    public void Clear()
    {
        txtTotalStock.Text = "";
       
        lnkDownload1.Visible = false;
        lnkDownload1.Text = string.Empty;
        btnclikrjt1.Visible = false;
        FileImage1.Visible = true;

        lnkDownload2.Visible = false;
        lnkDownload2.Text = string.Empty;
        btnclikrjt2.Visible = false;
        FileImage2.Visible = true;

        lnkDownload3.Visible = false;
        lnkDownload3.Text = string.Empty;
        btnclikrjt3.Visible = false;
        FileImage3.Visible = true;

        lnkDownload4.Visible = false;
        lnkDownload4.Text = string.Empty;
        btnclikrjt4.Visible = false;
        FileImage4.Visible = true;

        lnkDownload5.Visible = false;
        lnkDownload5.Text = string.Empty;
        btnclikrjt5.Visible = false;
        FileImage5.Visible = true;
       
    }

}