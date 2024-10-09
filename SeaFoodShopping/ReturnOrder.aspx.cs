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
using System.IO;
using System.Text;
using System.Xml;
using System.Security.Cryptography;

public partial class ReturnOrder : System.Web.UI.Page
{
   
    public DataTable dtPreview = new DataTable();

    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    public DataTable dtOrderDetails = new DataTable();

    LinkButton lb = new LinkButton();

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            cboBankers.Visible = false;
            txtAccname.Visible = false;
            txtAccno.Visible = false;
            txtBankname.Visible = false;
            txtBranch.Visible = false;
            string @Param = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            lblOrderNo.Text = @Param;
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;
                //lblOrno.Visible = false;
                //lblOrderNo.Visible = false;

                //String.Format("{0:yyyy}", DateTime.Now);
                //cboOrderNo.Text = String.Format("{0:yyyy}", DateTime.Now);
                //GridLoad();
            }
            else { lblWelcome.Text = "My Account"; Response.Redirect("login.aspx"); }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("login.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        try
        {
            connMenu.Open();

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {

            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "Page_Load", ex.ToString(), "Audit");
        }
    }

    protected void RadGridDisplay_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            string @Param = string.Empty, @Param2 = string.Empty;
            @Param = Request.QueryString.Get("Param").ToString();
            @Param2 = Request.QueryString.Get("Param2").ToString();
            RadGridDisplay.DataSource = DataSourceHelper(@Param, @Param2);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "RadGridDisplay_NeedDataSource", ex.ToString(), "Audit");
            Response.Redirect("index.aspx");

        }
    }

    public DataTable DataSourceHelper(string orderno,string Runningno)
    {

        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();

        //string @Param = string.Empty;
        //@Param = Request.QueryString.Get("Param").ToString();

        String today = DateTime.Now.ToString();
        DateTime dtinsDate = DateTime.Parse(today);
        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";


        String nextday = DateTime.Now.AddDays(-3).ToString();
        DateTime dtnextDate = DateTime.Parse(nextday);
        nextday = dtnextDate.Month + "/" + dtnextDate.Day + "/" + dtnextDate.Year + " 00:00:00";

        DataTable g_datatable = new DataTable();
        string sql = "select * FROM VW_OrderDetails WHERE Deleted=0 and buy=1 and status=1 and Shipped=1 and Customerid='" + Session["CustomerID"].ToString() + "' and RefNo='" + orderno.ToString() + "' and RunningNo='" + Runningno.ToString() + "' and DeliverDate between '" + nextday.ToString() + "' and '" + today.ToString() + "'";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    protected void btnReturnOrder_Click(object sender, EventArgs e) 
        {
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            try
            {
                String today = DateTime.Now.ToString();
                DateTime dtinsDate = DateTime.Parse(today);
                today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";


                String nextday = DateTime.Now.AddDays(-2).ToString();
                DateTime dtnextDate = DateTime.Parse(nextday);
                nextday = dtnextDate.Month + "/" + dtnextDate.Day + "/" + dtnextDate.Year + " 00:00:00";

                string @Param = string.Empty, @Param2 = string.Empty;
                @Param = Request.QueryString.Get("Param").ToString();
                @Param2 = Request.QueryString.Get("Param2").ToString();

                string sql = "select * FROM VW_OrderDetails WHERE Deleted=0 and buy=1 and status=00 and Shipped=1 and Customerid='" + Session["CustomerID"].ToString() + "' and orderid='" + @Param.ToString() + "' and RunningNo='" + @Param2.ToString() + "' and created_date between '" + nextday.ToString() + "' and '" + today.ToString() + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader1 = cmd.ExecuteReader();

                if (reader1.Read())
                {
                    if (!(string.IsNullOrEmpty(reader1["CancelReason"].ToString())))
                    {
                        lblStatus.Text = "This Product is already Register to Return";
                        return;
                    }
                }
                reader1.Close();

                if (string.IsNullOrEmpty(cboReason.Text.ToString()))
                {
                    lblStatus.Text = "Select Reason";
                    return;
                }
                if (string.IsNullOrEmpty(cboreimburse.Text.ToString()))
                {
                    lblStatus.Text = "Select Reimburse";
                    return;
                }
                if (cboreimburse.Text == "Full refund")
                {
                    if (string.IsNullOrEmpty(cboBankers.Text.ToString()))
                    {
                        lblStatus.Text = "Select Banking Type";
                        return;
                    }

                   }


                if (cboBankers.Text == "Bank Transfer")
                {
                    if (string.IsNullOrEmpty(txtAccname.Text.ToString()))
                    {
                        lblStatus.Text = "Enter Account Name";
                        return;
                    }
                    if (string.IsNullOrEmpty(txtAccno.Text.ToString()))
                    {
                        lblStatus.Text = "Enter Account number";
                        return;
                    }
                    if (string.IsNullOrEmpty(txtBankname.Text.ToString()))
                    {
                        lblStatus.Text = "Enter Bank Name";
                        return;
                    }
                    if (string.IsNullOrEmpty(txtBranch.Text.ToString()))
                    {
                        lblStatus.Text = "Enter Branch/Location";
                        return;
                    }
                }

                //AddCartReturnCancel(SqlConnection conn, string OrderNo,string RunningNo, string CancelReturnReason, string Reimburse, string BankingType, string AccountName, string AccountNumber, string BankName, string Branch, string userid, string Flagp)
                int flg = BusinessTier.AddCartReturnCancel(conn, @Param.ToString(), @Param2.ToString().Trim(), cboReason.Text.ToString(), cboreimburse.Text.ToString(), cboBankers.Text.ToString(), txtAccname.Text.ToString(), txtAccno.Text.ToString(), txtBankname.Text.ToString(), txtBranch.Text.ToString(), Session["CustomerID"].ToString().Trim(), "R");
                    BusinessTier.DisposeConnection(conn);
                    lblStatus.Text = "Successfully Register to Return your Product";
                    lblStatus.ForeColor = Color.Green;
                    RadGridDisplay.DataSource = DataSourceHelper(@Param, @Param2);
                    RadGridDisplay.Rebind();
            }
            catch (Exception ex)
            {
                InsertLogAuditTrail(Session["CustomerID"].ToString(), "ReturnOrder", "RadGridDisplay_UpdateCommand", ex.ToString(), "Audit");
            }
    }

    //protected void RadGridDisplay_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    //{
    //    SqlConnection conn = BusinessTier.getConnection();
    //    conn.Open();
    //    try
    //    {
    //        RadComboBox cboReason = (RadComboBox)e.Item.FindControl("cboReason");
    //        string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"].ToString();
    //        int flg = BusinessTier.AddCartReturnCancel(conn, Convert.ToInt32(ID.ToString()), cboReason.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "C");
    //        BusinessTier.DisposeConnection(conn);
    //        lblStatus.Text = "Successfully Cancel your Product";
    //        lblStatus.ForeColor = Color.Green;
    //                }
    //    catch (Exception ex)
    //    {
    //        InsertLogAuditTrail(Session["CustomerID"].ToString(), "CancelOrder", "RadGridDisplay_UpdateCommand", ex.ToString(), "Audit");
    //    }
    //}

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            //if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            //{
            GridEditFormItem editedItem = e.Item as GridEditFormItem;
            //RadComboBox cboQnty = (RadComboBox)e.Item.FindControl("cboQnty");
            Label cboQnty = (Label)e.Item.FindControl("cboQnty");
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            //cboQnty.SelectedIndexChanged += new RadComboBoxSelectedIndexChangedEventHandler(cboQnty_OnSelectedIndexChanged);
            lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString();
            //}

        }
        catch (Exception ex)
        {

        }

        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    protected void cboreimburse_OnSelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (cboreimburse.Text == "Full refund")
        {
            cboBankers.Visible = true;
        }
        else
        {
            cboBankers.Visible = false;
            txtAccname.Visible = false;
            txtAccno.Visible = false;
            txtBankname.Visible = false;
            txtBranch.Visible = false;
        }
    }

    protected void cboBankers_OnSelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (cboBankers.Text == "Bank Transfer")
        {
            txtAccname.Visible = true;
            txtAccno.Visible = true;
            txtBankname.Visible = true;
            txtBranch.Visible = true;
        }
        else
        {
            txtAccname.Visible = false;
            txtAccno.Visible = false;
            txtBankname.Visible = false;
            txtBranch.Visible = false;
        }
    }
}