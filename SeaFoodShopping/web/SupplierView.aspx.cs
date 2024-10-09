using System;
using System.IO;
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
using System.Web.Configuration;

using System.Net;
using System.Net.Mail;


public partial class SupplierView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        sql = "select * FROM SupplierDetails WHERE Deleted='" + delval + "' order by SupplierID";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "RowClick" && e.Item is GridDataItem)
        {
            e.Item.Selected = true;
            GridEditFormItem editedItem = e.Item as GridEditFormItem;
            Label Label2 = (Label)e.Item.FindControl("Label2");
            Label lblSysRegno = (Label)editedItem.FindControl("lblSysRegno");
            //LinkButton hyperlinkMyKad = (LinkButton)e.Item.FindControl("hyperlinkMyKad").Controls[0];

            try
            {
                lblStatus.Text = lblSysRegno.Text.ToString();
                //if (!(string.IsNullOrEmpty(Label2.Text.ToString().Trim())))
                //{
                //    String path = string.Empty;
                //    path = Server.MapPath("");
                //    path += "\\Documents\\";
                //    string strLink = path + Label2.Text.Trim();
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=10,height=10');", true);
                //}
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message;
                //InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderForm", "ItemClick", ex.ToString(), "Audit");
            }
        }
    }

    protected void RadGrid1_ItemCreated(object source, Telerik.Web.UI.GridItemEventArgs e)
    {

        if (e.Item is GridDataItem)
        {
            GridDataItem dataitem = (GridDataItem)e.Item;
            LinkButton hyperlinkMyKad = (LinkButton)dataitem["hyperlinkMyKad"].Controls[0];
            hyperlinkMyKad.Click += new EventHandler(hyperlinkMyKad_OnClick);
        }


    }

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {

        if (e.Item is GridDataItem)
        {
            GridDataItem dataitem = (GridDataItem)e.Item;
            LinkButton hyperlinkMyKad = (LinkButton)dataitem["hyperlinkMyKad"].Controls[0];
            hyperlinkMyKad.CommandArgument = string.Format("return Click('{0}';", (e.Item as GridDataItem)["hyperlinkMyKad"].Text);
        }


    }

    protected void hyperlinkMyKad_OnClick(object sender, EventArgs e)
    {
        var btnView = (LinkButton)sender;
        var customID = btnView.CommandArgument;

        if (!(string.IsNullOrEmpty(customID.ToString().Trim())))
        {
            String path = string.Empty;
            path = Server.MapPath("");
            path += "\\Documents\\";
            string strLink = path + customID.Trim();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=10,height=10');", true);
        }
    }

    protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;

            TextBox txtSupplierName = (TextBox)editedItem.FindControl("txtSupplierName");

            TextBox txtPersonIncharge = (TextBox)editedItem.FindControl("txtPersonIncharge");
            TextBox txtContactNo = (TextBox)editedItem.FindControl("txtContactNo");
            TextBox txtFax = (TextBox)editedItem.FindControl("txtFax");
            TextBox txtEmail = (TextBox)editedItem.FindControl("txtEmail");
            TextBox txtAddress1 = (TextBox)editedItem.FindControl("txtAddress1");
            TextBox txtAddress2 = (TextBox)editedItem.FindControl("txtAddress2");
            TextBox txtPostCode = (TextBox)editedItem.FindControl("txtPostCode");
            TextBox txtCity = (TextBox)editedItem.FindControl("txtCity");
            RadComboBox cboState = (RadComboBox)editedItem.FindControl("cboState");
            RadComboBox cboCountry = (RadComboBox)editedItem.FindControl("cboCountry");


            if (string.IsNullOrEmpty(txtSupplierName.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter SupplierName";
                return;
            }
            if (string.IsNullOrEmpty(txtPersonIncharge.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter PersonIncharge";
                return;
            }
            if (string.IsNullOrEmpty(txtContactNo.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter Mobile";
                return;
            }
          
            int flg = 0;
            flg = BusinessTier.SupplierDetails(conn, 1, txtSupplierName.Text.ToString(),
                txtPersonIncharge.Text.ToString(), txtContactNo.Text.ToString(), txtFax.Text.ToString(),
                txtEmail.Text.ToString(), txtAddress1.Text.ToString(), txtAddress2.Text.ToString(),
                txtPostCode.Text.ToString(), txtCity.Text.ToString(), cboState.Text.ToString(),
                cboCountry.Text.ToString(),  "1", "N");

            BusinessTier.DisposeConnection(conn);

           
            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Added!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "SupplierView", "RadGrid1_InsertCommand", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

        RadGrid1.Rebind();
    }

    protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["SupplierID"].ToString();

            TextBox txtSupplierName = (TextBox)editedItem.FindControl("txtSupplierName");

            TextBox txtPersonIncharge = (TextBox)editedItem.FindControl("txtPersonIncharge");
            TextBox txtContactNo = (TextBox)editedItem.FindControl("txtContactNo");
            TextBox txtFax = (TextBox)editedItem.FindControl("txtFax");
            TextBox txtEmail = (TextBox)editedItem.FindControl("txtEmail");
            TextBox txtAddress1 = (TextBox)editedItem.FindControl("txtAddress1");
            TextBox txtAddress2 = (TextBox)editedItem.FindControl("txtAddress2");
            TextBox txtPostCode = (TextBox)editedItem.FindControl("txtPostCode");
            TextBox txtCity = (TextBox)editedItem.FindControl("txtCity");
            RadComboBox cboState = (RadComboBox)editedItem.FindControl("cboState");
            RadComboBox cboCountry = (RadComboBox)editedItem.FindControl("cboCountry");

            if (string.IsNullOrEmpty(txtSupplierName.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter SupplierName";
                return;
            }
            if (string.IsNullOrEmpty(txtPersonIncharge.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter PersonIncharge";
                return;
            }
            if (string.IsNullOrEmpty(txtContactNo.Text.ToString().Trim()))
            {
                lblStatus.Text = "Enter Mobile";
                return;
            }

            int flg = 0;
            flg = BusinessTier.SupplierDetails(conn, Convert.ToInt32(ID.ToString().Trim()), txtSupplierName.Text.ToString(),
                txtPersonIncharge.Text.ToString(), txtContactNo.Text.ToString(), txtFax.Text.ToString(),
                txtEmail.Text.ToString(), txtAddress1.Text.ToString(), txtAddress2.Text.ToString(),
                txtPostCode.Text.ToString(), txtCity.Text.ToString(), cboState.Text.ToString(),
                cboCountry.Text.ToString(), "1", "U");

            BusinessTier.DisposeConnection(conn);


            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Updated!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "SupplierView", "RadGrid1_UpdateCommand", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

        RadGrid1.Rebind();
    }

    protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["SupplierID"].ToString();

            //TextBox txtSupplierName = (TextBox)editedItem.FindControl("txtSupplierName");

            //TextBox txtPersonIncharge = (TextBox)editedItem.FindControl("txtPersonIncharge");
            //TextBox txtContactNo = (TextBox)editedItem.FindControl("txtContactNo");
            //TextBox txtFax = (TextBox)editedItem.FindControl("txtFax");
            //TextBox txtEmail = (TextBox)editedItem.FindControl("txtEmail");
            //TextBox txtAddress1 = (TextBox)editedItem.FindControl("txtAddress1");
            //TextBox txtAddress2 = (TextBox)editedItem.FindControl("txtAddress2");
            //TextBox txtPostCode = (TextBox)editedItem.FindControl("txtPostCode");
            //TextBox txtCity = (TextBox)editedItem.FindControl("txtCity");
            //RadComboBox cboState = (RadComboBox)editedItem.FindControl("cboState");
            //RadComboBox cboCountry = (RadComboBox)editedItem.FindControl("cboCountry");

            //if (string.IsNullOrEmpty(txtSupplierName.Text.ToString().Trim()))
            //{
            //    lblStatus.Text = "Enter SupplierName";
            //    return;
            //}
            //if (string.IsNullOrEmpty(txtPersonIncharge.Text.ToString().Trim()))
            //{
            //    lblStatus.Text = "Enter PersonIncharge";
            //    return;
            //}
            //if (string.IsNullOrEmpty(txtContactNo.Text.ToString().Trim()))
            //{
            //    lblStatus.Text = "Enter Mobile";
            //    return;
            //}

            int flg = 0;
            flg = BusinessTier.SupplierDetails(conn, Convert.ToInt32(ID.ToString().Trim()), "",
                "", "", "",
                "", "", "",
               "","", "",
                "", "1", "D");

            BusinessTier.DisposeConnection(conn);


            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Deleted!";
                lblStatus.ForeColor = Color.Green;
            }
            RadGrid1.Rebind();
        }
        catch (Exception ex)
        {

            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "SupplierView", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
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