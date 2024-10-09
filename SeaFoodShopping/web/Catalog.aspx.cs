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
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Web.Configuration;
using System.Net;


public partial class Catalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                Response.Redirect("AdminLogin.aspx", false);
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("AdminLogin.aspx", false);
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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Catalog", "RadGrid1_NeedDataSource", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {
        int delval = 0;
        string sql = "";
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        sql = "select * FROM CatalogMaster WHERE Deleted='" + delval + "' order by Catalogid desc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        try
        {

            RadTextBox unit = ((RadTextBox)(sender));
            GridEditFormItem editedItem = ((GridEditFormItem)(unit.NamingContainer));

            RadTextBox txtQtyIn = (RadTextBox)editedItem.FindControl("txtQtyIn");
            RadTextBox txtUnitPrice = (RadTextBox)editedItem.FindControl("txtUnitPrice");
            RadTextBox txtTotalPrice = (RadTextBox)editedItem.FindControl("txtTotalPrice");
            if (string.IsNullOrEmpty(txtQtyIn.Text.ToString()))
            {
                lblStatus.Text = "Please Enter Quantity";
                lblStatus.ForeColor = Color.Red;
                return;
            }

            decimal i = 0, j = 0, k = 0;
            i = Convert.ToDecimal(txtQtyIn.Text.ToString());
            j = Convert.ToDecimal(txtUnitPrice.Text.ToString());
            k = i * j;
            txtTotalPrice.Text = k.ToString();

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
        }

    }

    protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["Catalogid"].ToString();

            RadTextBox txtCatalogName = (RadTextBox)editedItem.FindControl("txtCatalogName");
            RadTextBox txtQtyIn = (RadTextBox)editedItem.FindControl("txtQtyIn");
            RadTextBox txtUnitPrice = (RadTextBox)editedItem.FindControl("txtUnitPrice");
            RadTextBox txtTotalPrice = (RadTextBox)editedItem.FindControl("txtTotalPrice");
            RadTextBox txtDamage = (RadTextBox)editedItem.FindControl("txtDamage");
            RadTextBox txtRemarks = (RadTextBox)editedItem.FindControl("txtRemarks");
            RadDatePicker Dtindate = (RadDatePicker)editedItem.FindControl("Dtindate");
            if (string.IsNullOrEmpty(Dtindate.SelectedDate.ToString()))
            {
                lblStatus.Text = "Please Select Date";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtCatalogName.Text.ToString()))
            {
                lblStatus.Text = "Please Enter Catalog Name";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtTotalPrice.Text.ToString()))
            {
                lblStatus.Text = "Please Enter UnitPrice";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtDamage.Text.ToString()))
            {
                txtDamage.Text = "0";
            }
            string indate = Dtindate.SelectedDate.ToString();
            DateTime idt = DateTime.Parse(indate);
            indate = idt.Month + "/" + idt.Day + "/" + idt.Year + " 00:00:00";
            int flg = 0;
            flg = BusinessTier.Catalog(conn, Convert.ToInt32(ID.ToString()), indate.ToString(), txtCatalogName.Text.ToString().Trim(), Convert.ToInt32(txtQtyIn.Text.ToString().Trim()), Convert.ToDecimal(txtUnitPrice.Text.ToString().Trim()), Convert.ToDecimal(txtTotalPrice.Text.ToString().Trim()), Convert.ToInt32(txtDamage.Text.ToString().Trim()), txtRemarks.Text.ToString().Trim(), "1", "U");
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
            e.Canceled = true;
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Catalog", "RadGrid1_UpdateCommand", ex.ToString(), "Audit");
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
            RadTextBox txtCatalogName = (RadTextBox)editedItem.FindControl("txtCatalogName");
            RadTextBox txtQtyIn = (RadTextBox)editedItem.FindControl("txtQtyIn");
            RadTextBox txtUnitPrice = (RadTextBox)editedItem.FindControl("txtUnitPrice");
            RadTextBox txtTotalPrice = (RadTextBox)editedItem.FindControl("txtTotalPrice");
            RadTextBox txtDamage = (RadTextBox)editedItem.FindControl("txtDamage");
            RadTextBox txtRemarks = (RadTextBox)editedItem.FindControl("txtRemarks");
            RadDatePicker Dtindate = (RadDatePicker)editedItem.FindControl("Dtindate");

            if (string.IsNullOrEmpty(Dtindate.SelectedDate.ToString()))
            {
                lblStatus.Text = "Please Select Date";
                lblStatus.ForeColor = Color.Red;
                return;
            }

            if (string.IsNullOrEmpty(txtCatalogName.Text.ToString()))
            {
                lblStatus.Text = "Please Enter Catalog Name";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtTotalPrice.Text.ToString()))
            {
                lblStatus.Text = "Please Enter UnitPrice";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(txtDamage.Text.ToString()))
            {
                txtDamage.Text = "0";
            }
            string indate = Dtindate.SelectedDate.ToString();
            DateTime idt = DateTime.Parse(indate);
            indate = idt.Month + "/" + idt.Day + "/" + idt.Year + " 00:00:00";

            int flg = 0;
            flg = BusinessTier.Catalog(conn, 1,indate.ToString(), txtCatalogName.Text.ToString().Trim(), Convert.ToInt32(txtQtyIn.Text.ToString().Trim()), Convert.ToDecimal(txtUnitPrice.Text.ToString().Trim()), Convert.ToDecimal(txtTotalPrice.Text.ToString().Trim()), Convert.ToInt32(txtDamage.Text.ToString().Trim()), txtRemarks.Text.ToString().Trim(), "1", "N");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Added!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            e.Canceled = true;
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "Catalog", "RadGrid1_InsertCommand", ex.ToString(), "Audit");
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
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["Catalogid"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = BusinessTier.Catalog(conn, Convert.ToInt32(ID.ToString()), "","", 1, 1, 1,1,"", "1", "D");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Deleted!";
            }
            RadGrid1.Rebind();
            InsertLogAuditTrail(Session["AdminID"].ToString(), "Catalog", "RadGrid1_DeleteCommand", "Success", "Log");
        }
        catch (Exception ex)
        {
            e.Canceled = true;
            InsertLogAuditTrail(Session["AdminID"].ToString(), "Catalog", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
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