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

public partial class web_Promotion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        sql = "select * FROM PromotionMaster WHERE Deleted='" + delval + "' order by PromotionID";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PromotionID"].ToString();

            TextBox txtPromotionCode = (TextBox)editedItem.FindControl("txtPromotionCode");
            TextBox txtDescription = (TextBox)editedItem.FindControl("txtDescription");
            RadComboBox cboType = (RadComboBox)editedItem.FindControl("cboType");
            TextBox txtDiscount = (TextBox)editedItem.FindControl("txtDiscount");
            TextBox txtTotal = (TextBox)editedItem.FindControl("txtTotal");
            RadDatePicker DtFrom = (RadDatePicker)editedItem.FindControl("DtFrom");
            RadDatePicker DtTo = (RadDatePicker)editedItem.FindControl("DtTo");
            String DFR = string.Empty, DTO = string.Empty;

            lblStatus.Text = string.Empty;
            lblStatus.ForeColor = Color.Red;
            if (string.IsNullOrEmpty(Convert.ToString(cboType.Text.ToString())))
            {
                lblStatus.Text = "Please Select Type";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(txtDiscount.Text.ToString())))
            {
                lblStatus.Text = "Enter Discount";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(txtTotal.Text.ToString())))
            {
                lblStatus.Text = "Enter Total";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(DtFrom.SelectedDate)))
            {
                lblStatus.Text = "Please Select From Date";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(DtTo.SelectedDate)))
            {
                lblStatus.Text = "Please Select To Date";
                return;
            }

            DFR = DtFrom.SelectedDate.ToString();
            DateTime idt = DateTime.Parse(DFR);
            DFR = idt.Month + "/" + idt.Day + "/" + idt.Year + " 00:00:00";

            DTO = DtTo.SelectedDate.ToString();
            DateTime idt2 = DateTime.Parse(DTO);
            DTO = idt2.Month + "/" + idt2.Day + "/" + idt2.Year + " 00:00:00";

            int flg = 0;
            flg = BusinessTier.Promotion(conn, Convert.ToInt32(ID.ToString()), txtPromotionCode.Text.ToString().Trim(), txtDescription.Text.ToString().Trim(), cboType.Text.ToString().Trim(), Convert.ToDecimal(txtDiscount.Text.ToString().Trim()), Convert.ToDecimal(txtTotal.Text.ToString().Trim()), DFR.ToString().Trim(), DTO.ToString().Trim(), "1", "U");

            BusinessTier.DisposeConnection(conn);

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Updated!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            // ShowMessage(5);
            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "web_Promotion", "RadGrid1_UpdateCommand", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

        RadGrid1.Rebind();
    }

    protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            //string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PromotionID"].ToString();

            TextBox txtPromotionCode = (TextBox)editedItem.FindControl("txtPromotionCode");
            TextBox txtDescription = (TextBox)editedItem.FindControl("txtDescription");
            RadComboBox cboType = (RadComboBox)editedItem.FindControl("cboType");
            TextBox txtDiscount = (TextBox)editedItem.FindControl("txtDiscount");
            TextBox txtTotal = (TextBox)editedItem.FindControl("txtTotal");
            RadDatePicker DtFrom = (RadDatePicker)editedItem.FindControl("DtFrom");
            RadDatePicker DtTo = (RadDatePicker)editedItem.FindControl("DtTo");
            String DFR = string.Empty, DTO = string.Empty;

            lblStatus.Text = string.Empty;
            lblStatus.ForeColor = Color.Red;
            if (string.IsNullOrEmpty(Convert.ToString(cboType.Text.ToString())))
            {
                lblStatus.Text = "Please Select Type";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(txtDiscount.Text.ToString())))
            {
                lblStatus.Text = "Enter Discount";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(txtTotal.Text.ToString())))
            {
                lblStatus.Text = "Enter Total";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(DtFrom.SelectedDate)))
            {
                lblStatus.Text = "Please Select From Date";
                return;
            }
            if (string.IsNullOrEmpty(Convert.ToString(DtTo.SelectedDate)))
            {
                lblStatus.Text = "Please Select To Date";
                return;
            }

            DFR = DtFrom.SelectedDate.ToString();
            DateTime idt = DateTime.Parse(DFR);
            DFR = idt.Month + "/" + idt.Day + "/" + idt.Year + " 00:00:00";

            DTO = DtTo.SelectedDate.ToString();
            DateTime idt2 = DateTime.Parse(DTO);
            DTO = idt2.Month + "/" + idt2.Day + "/" + idt2.Year + " 00:00:00";

            int flg = 0;
            flg = BusinessTier.Promotion(conn, 1, txtPromotionCode.Text.ToString().Trim(), txtDescription.Text.ToString().Trim(), cboType.Text.ToString().Trim(), Convert.ToDecimal(txtDiscount.Text.ToString().Trim()), Convert.ToDecimal(txtTotal.Text.ToString().Trim()), DFR.ToString().Trim(), DTO.ToString().Trim(), "1", "N");

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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "web_Promotion", "RadGrid1_InsertCommand", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

        RadGrid1.Rebind();
    }

    protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        //try
        //{
        //    string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PromotionID"].ToString();
        //    SqlConnection conn = BusinessTier.getConnection();
        //    conn.Open();
        //    int flg = BusinessTier.DeleteTables(conn, Convert.ToInt32(ID), Session["AdminID"].ToString(), "PROMOD");
        //    BusinessTier.DisposeConnection(conn);
        //    if (flg >= 1)
        //    {
        //        lblStatus.Text = "Successfully Deleted!";
        //    }

        //    RadGrid1.Rebind();
        //    //InsertLogAuditTrial is used to insert the action into MasterLog table
        //    InsertLogAuditTrail(Session["AdminID"].ToString(), "BusinessRegisterView", "RadGrid1_DeleteCommand", "Success", "Log");
        //}
        //catch (Exception ex)
        //{

        //    e.Canceled = true;
        //    //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
        //    InsertLogAuditTrail(Session["AdminID"].ToString(), "BusinessRegisterView", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
        //}
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