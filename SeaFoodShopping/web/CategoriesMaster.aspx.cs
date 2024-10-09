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

public partial class CategoriesMaster : System.Web.UI.Page
{
    public string param = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        param = Request.QueryString["param"].ToString();
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                //SqlConnection connSave = BusinessTier.getConnection();
                //connSave.Open();
                //connSave.Close();
                Response.Redirect("AdminLogin.aspx", false);

            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                //lblName.Text = textInfo.ToTitleCase(Session["AdminID"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("AdminLogin.aspx", false);
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
        sql = "select * FROM VW_BasicCategory WHERE Deleted='" + delval + "' order by CategoryID desc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_OnItemDataBound(object sender, GridItemEventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
           

            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblCategoryID = (Label)editedItem.FindControl("lblCategoryID");
                RadComboBox cboBasicCategories = (RadComboBox)editedItem.FindControl("cboBasicCategories");
               
                if (lblCategoryID.Text == "")
                {
                    cboBasicCategories.Enabled = true;
                }
                else
                {
                    cboBasicCategories.Enabled = false;
                    SqlDataReader readerMenu = BusinessTier.getBasicCategoryItems(connMenu, lblCategoryID.Text.ToString().Trim());
                    if(readerMenu.Read())
                    cboBasicCategories.SelectedValue = readerMenu["BasicCategoryID"].ToString();
                    BusinessTier.DisposeReader(readerMenu);
                }
                BusinessTier.DisposeConnection(connMenu);
            }
        }
        catch (Exception ex)
        {
            // ShowMessage(5);
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "Master_Department", "Update", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CategoryID"].ToString();

            TextBox txtCategory = (TextBox)editedItem.FindControl("txtCategory");
            RadComboBox cboBasicCategories = (RadComboBox)editedItem.FindControl("cboBasicCategories");

            int flg = 0;
            flg = BusinessTier.Category(conn, Convert.ToInt32(ID.ToString()), txtCategory.Text.ToString().Trim(), cboBasicCategories.SelectedValue.ToString().Trim(), "1", "U");

            BusinessTier.DisposeConnection(conn);

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Updated!";
                lblStatus.ForeColor = Color.Green;
            }
            RadGrid1.Rebind();
        }
        catch (Exception ex)
        {
            // ShowMessage(5);
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "Master_Department", "Update", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

    
    }

    protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            //string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["BusinessID"].ToString();

            TextBox txtCategory = (TextBox)editedItem.FindControl("txtCategory");
            RadComboBox cboBasicCategories = (RadComboBox)editedItem.FindControl("cboBasicCategories");

            if (string.IsNullOrEmpty(cboBasicCategories.Text.ToString()))
            {
                lblStatus.Text = "Please Select BasicCategory";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtCategory.Text.ToString()))
            {
                lblStatus.Text = "Please Enter Category";
                lblStatus.ForeColor = Color.Red;
                return;
            }

            int flg = 0;
            flg = BusinessTier.Category(conn, 1, txtCategory.Text.ToString().Trim(), cboBasicCategories.SelectedValue.ToString().Trim(), "1", "N");

            BusinessTier.DisposeConnection(conn);

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Added!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            // ShowMessage(5);
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "Master_Department", "Update", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

        RadGrid1.Rebind();
    }

    protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CategoryID"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = BusinessTier.DeleteTables(conn, Convert.ToInt32(ID), Session["AdminID"].ToString(), "CD");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Deleted!";
            }

            RadGrid1.Rebind();
            //InsertLogAuditTrial is used to insert the action into MasterLog table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "BusinessRegisterView", "RadGrid1_DeleteCommand", "Success", "Log");
        }
        catch (Exception ex)
        {

            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "BusinessRegisterView", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    //protected void btnAddCategory_OnClick(object sender, EventArgs e)
    //{
    //    lblStatus.Text = string.Empty;
    //    lblStatus.ForeColor = Color.Red;
    //    SqlConnection conn = BusinessTier.getConnection();
    //    conn.Open();
    //    try
    //    {
    //        if (string.IsNullOrEmpty(txtCategory.Text.ToString().Trim()))
    //        {
    //            lblStatus.Text = "Enter Categories";
    //            return;
    //        }
    //        int flg = BusinessTier.Category(conn, 1, txtCategory.Text.ToString().Trim(), cboBasicCategories.Text.ToString().Trim(), "1", "N");
    //        BusinessTier.DisposeConnection(conn);
    //        if (flg >= 1)
    //        {
    //            lblStatus.Text = "Sucessfully Added Category";
    //            lblStatus.ForeColor = Color.Green;
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        lblStatus.Text = ex.Message.ToString();
    //        lblStatus.ForeColor = Color.Red;
    //    }
    //    finally
    //    {
    //        BusinessTier.DisposeConnection(conn);
    //    }


    //}
}