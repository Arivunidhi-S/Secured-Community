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
using System.Xml;
using System.IO;

public partial class web_ManualSalesEntry : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                Response.Redirect("AdminLogin.aspx", false);
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
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "web_ManualSalesEntry", "RadGrid1_NeedDataSource", ex.ToString(), "Audit");
        }
    }

    protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            // string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ManualSalesID"].ToString();

            TextBox txtOrderno = (TextBox)editedItem.FindControl("txtOrderno");
            TextBox txtInvoiceno = (TextBox)editedItem.FindControl("txtInvoiceno");
            TextBox txtproductid = (TextBox)editedItem.FindControl("txtproductid");
            TextBox txtQnty = (TextBox)editedItem.FindControl("txtQnty");
            TextBox txtUnitPrice = (TextBox)editedItem.FindControl("txtUnitPrice");
            TextBox txtAmount = (TextBox)editedItem.FindControl("txtAmount");
            TextBox txtTotalAmount = (TextBox)editedItem.FindControl("txtTotalAmount");

            TextBox txtGST = (TextBox)editedItem.FindControl("txtGST");
            TextBox txtCustomer = (TextBox)editedItem.FindControl("txtCustomer");
            TextBox txtDistributor = (TextBox)editedItem.FindControl("txtDistributor");

            TextBox txtDescription = (TextBox)editedItem.FindControl("txtDescription");
            TextBox txtRemarks = (TextBox)editedItem.FindControl("txtRemarks");
            TextBox txtDeliveryNo = (TextBox)editedItem.FindControl("txtDeliveryNo");
            RadDatePicker dtBanking = (RadDatePicker)editedItem.FindControl("dtBanking");
            RadDatePicker DtPayment = (RadDatePicker)editedItem.FindControl("DtPayment");
            CheckBox ChkPaidAmount = (CheckBox)editedItem.FindControl("ChkPaidAmount");

            if (string.IsNullOrEmpty(txtOrderno.Text.ToString()))
            {
                lblStatus.Text = "Enter Orderno";
                return;
            }
            if (string.IsNullOrEmpty(txtInvoiceno.Text.ToString()))
            {
                lblStatus.Text = "Enter Invoiceno";
                return;
            }
            if (string.IsNullOrEmpty(DtPayment.SelectedDate.ToString()))
            {
                lblStatus.Text = "Select Payment Date";
                return;
            }

            if (string.IsNullOrEmpty(txtproductid.Text.ToString()))
            {
                lblStatus.Text = "Enter Productid";
                return;
            }
            if (string.IsNullOrEmpty(txtQnty.Text.ToString()))
            {
                lblStatus.Text = "Enter Qnty";
                return;
            }
            if (string.IsNullOrEmpty(txtUnitPrice.Text.ToString()))
            {
                lblStatus.Text = "Enter UnitPrice";
                return;
            }
            if (string.IsNullOrEmpty(txtAmount.Text.ToString()))
            {
                lblStatus.Text = "Enter Amount";
                return;
            }
            if (string.IsNullOrEmpty(txtTotalAmount.Text.ToString()))
            {
                lblStatus.Text = "Enter TotalAmount";
                return;
            }
            if (string.IsNullOrEmpty(txtGST.Text.ToString()))
            {
                lblStatus.Text = "Enter GST";
                return;
            }



            if (string.IsNullOrEmpty(txtCustomer.Text.ToString()))
            {
                txtCustomer.Text = "0";
            }
            if (string.IsNullOrEmpty(txtDistributor.Text.ToString()))
            {
                txtDistributor.Text = "0";
            }
            if (string.IsNullOrEmpty(dtBanking.SelectedDate.ToString()))
            {
                lblStatus.Text = "Select Banking Date";
                return;
            }
            int paid = 0;
            if (ChkPaidAmount.Checked)
            {
                paid = 1;
            }

            string paymentdate = DtPayment.SelectedDate.ToString();
            DateTime dtinsDate = DateTime.Parse(paymentdate);
            paymentdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

            string BankingDate = dtBanking.SelectedDate.ToString();
            DateTime dtBankingDate = DateTime.Parse(BankingDate);
            BankingDate = dtBankingDate.Month + "/" + dtBankingDate.Day + "/" + dtBankingDate.Year + " 00:00:00";

            int flg = 0;
            flg = BusinessTier.ManualSalesEntry(conn, 1
           , Convert.ToInt32(txtOrderno.Text.ToString().Trim())
           , txtInvoiceno.Text.ToString().Trim()
           , paymentdate.ToString()
           , Convert.ToInt32(txtproductid.Text.ToString().Trim())
           , txtDescription.Text.ToString().Trim()
           , Convert.ToInt32(txtQnty.Text.ToString().Trim())
           , Convert.ToDecimal(txtUnitPrice.Text.ToString().Trim())
           , Convert.ToDecimal(txtAmount.Text.ToString().Trim())
           , Convert.ToDecimal(txtTotalAmount.Text.ToString().Trim())
           , Convert.ToDecimal(txtGST.Text.ToString().Trim())
           , txtRemarks.Text.ToString().Trim()
           , BankingDate.ToString().Trim()
           , Convert.ToInt32(txtCustomer.Text.ToString().Trim())
           , Convert.ToInt32(txtDistributor.Text.ToString().Trim())
           , txtDeliveryNo.Text.ToString().Trim()
           , paid
           , Session["AdminID"].ToString().Trim(), "N");
            BusinessTier.DisposeConnection(conn);

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Updated!";
                lblStatus.ForeColor = Color.Green;
            }

        }
        catch (Exception ex)
        {
            // lblStatus.Text = ex.Message.ToString();
            //lblStatus.ForeColor = Color.Red;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "web_ManualSalesEntry", "RadGrid1_InsertCommand", ex.ToString(), "Audit");
            e.Canceled = true;

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
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ManualSalesID"].ToString();

            TextBox txtOrderno = (TextBox)editedItem.FindControl("txtOrderno");
            TextBox txtInvoiceno = (TextBox)editedItem.FindControl("txtInvoiceno");
            TextBox txtproductid = (TextBox)editedItem.FindControl("txtproductid");
            TextBox txtQnty = (TextBox)editedItem.FindControl("txtQnty");
            TextBox txtUnitPrice = (TextBox)editedItem.FindControl("txtUnitPrice");
            TextBox txtAmount = (TextBox)editedItem.FindControl("txtAmount");
            TextBox txtTotalAmount = (TextBox)editedItem.FindControl("txtTotalAmount");

            TextBox txtGST = (TextBox)editedItem.FindControl("txtGST");
            TextBox txtCustomer = (TextBox)editedItem.FindControl("txtCustomer");
            TextBox txtDistributor = (TextBox)editedItem.FindControl("txtDistributor");

            TextBox txtDescription = (TextBox)editedItem.FindControl("txtDescription");
            TextBox txtRemarks = (TextBox)editedItem.FindControl("txtRemarks");
            TextBox txtDeliveryNo = (TextBox)editedItem.FindControl("txtDeliveryNo");
            RadDatePicker dtBanking = (RadDatePicker)editedItem.FindControl("dtBanking");
            RadDatePicker DtPayment = (RadDatePicker)editedItem.FindControl("DtPayment");
            CheckBox ChkPaidAmount = (CheckBox)editedItem.FindControl("ChkPaidAmount");
            if (string.IsNullOrEmpty(txtOrderno.Text.ToString()))
            {
                lblStatus.Text = "Enter Orderno";
                return;
            }
            if (string.IsNullOrEmpty(txtInvoiceno.Text.ToString()))
            {
                lblStatus.Text = "Enter Invoiceno";
                return;
            }
            if (string.IsNullOrEmpty(DtPayment.SelectedDate.ToString()))
            {
                lblStatus.Text = "Select Payment Date";
                return;
            }

            if (string.IsNullOrEmpty(txtproductid.Text.ToString()))
            {
                lblStatus.Text = "Enter Productid";
                return;
            }
            if (string.IsNullOrEmpty(txtQnty.Text.ToString()))
            {
                lblStatus.Text = "Enter Qnty";
                return;
            }
            if (string.IsNullOrEmpty(txtUnitPrice.Text.ToString()))
            {
                lblStatus.Text = "Enter UnitPrice";
                return;
            }
            if (string.IsNullOrEmpty(txtAmount.Text.ToString()))
            {
                lblStatus.Text = "Enter Amount";
                return;
            }
            if (string.IsNullOrEmpty(txtTotalAmount.Text.ToString()))
            {
                lblStatus.Text = "Enter TotalAmount";
                return;
            }
            if (string.IsNullOrEmpty(txtGST.Text.ToString()))
            {
                lblStatus.Text = "Enter GST";
                return;
            }



            if (string.IsNullOrEmpty(txtCustomer.Text.ToString()))
            {
                txtCustomer.Text = "0";
            }
            if (string.IsNullOrEmpty(txtDistributor.Text.ToString()))
            {
                txtDistributor.Text = "0";
            }
            if (string.IsNullOrEmpty(dtBanking.SelectedDate.ToString()))
            {
                lblStatus.Text = "Select Banking Date";
                return;
            }

            int paid = 0;
            if (ChkPaidAmount.Checked)
            {
                paid = 1;
            }

            string paymentdate = DtPayment.SelectedDate.ToString();
            DateTime dtinsDate = DateTime.Parse(paymentdate);
            paymentdate = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

            string BankingDate = dtBanking.SelectedDate.ToString();
            DateTime dtBankingDate = DateTime.Parse(BankingDate);
            BankingDate = dtBankingDate.Month + "/" + dtBankingDate.Day + "/" + dtBankingDate.Year + " 00:00:00";


            int flg = 0;
            flg = BusinessTier.ManualSalesEntry(conn, Convert.ToInt32(ID.ToString().Trim())
           , Convert.ToInt32(txtOrderno.Text.ToString().Trim())
           , txtInvoiceno.Text.ToString().Trim()
           , paymentdate.ToString()
           , Convert.ToInt32(txtproductid.Text.ToString().Trim())
           , txtDescription.Text.ToString().Trim()
           , Convert.ToInt32(txtQnty.Text.ToString().Trim())
           , Convert.ToDecimal(txtUnitPrice.Text.ToString().Trim())
           , Convert.ToDecimal(txtAmount.Text.ToString().Trim())
           , Convert.ToDecimal(txtTotalAmount.Text.ToString().Trim())
           , Convert.ToDecimal(txtGST.Text.ToString().Trim())
           , txtRemarks.Text.ToString().Trim()
           , BankingDate.ToString().Trim()
           , Convert.ToInt32(txtCustomer.Text.ToString().Trim())
           , Convert.ToInt32(txtDistributor.Text.ToString().Trim())
            , txtDeliveryNo.Text.ToString().Trim()
             , paid
           , Session["AdminID"].ToString().Trim(), "U");
            BusinessTier.DisposeConnection(conn);

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Updated!";
                lblStatus.ForeColor = Color.Blue;
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message.ToString();
            lblStatus.ForeColor = Color.Red;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "web_ManualSalesEntry", "RadGrid1_UpdateCommand", ex.ToString(), "Audit");
            e.Canceled = true;

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
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ManualSalesID"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = 0;
            flg = BusinessTier.ManualSalesEntry(conn, Convert.ToInt32(ID.ToString().Trim()), 1, "", "", 1, "", 1, 1, 1, 1, 1, "", "", 1, 1, "",1, Session["AdminID"].ToString().Trim(), "D");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Deleted!";
                lblStatus.ForeColor = Color.Red;
            }
            RadGrid1.Rebind();
            InsertLogAuditTrail(Session["AdminID"].ToString(), "web_ManualSalesEntry", "RadGrid1_DeleteCommand", "Success", "Log");
        }
        catch (Exception ex)
        {
            e.Canceled = true;
            InsertLogAuditTrail(Session["AdminID"].ToString(), "web_ManualSalesEntry", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    public DataTable DataSourceHelper()
    {
        int delval = 0;
        string sql = "";
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        sql = "select * FROM [EShopping].[dbo].[ManualSalesEntry] WHERE Deleted='" + delval + "' order by invoiceno desc,ManualSalesID asc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void txtTotalAmount_TextChanged(object sender, EventArgs e)
    {
        try
        {

            TextBox unit = ((TextBox)(sender));
            GridEditFormItem editedItem = ((GridEditFormItem)(unit.NamingContainer));

            TextBox txtTotalAmount = (TextBox)editedItem.FindControl("txtTotalAmount");
            TextBox txtAmount = (TextBox)editedItem.FindControl("txtAmount");
            TextBox txtGST = (TextBox)editedItem.FindControl("txtGST");
            if (string.IsNullOrEmpty(txtTotalAmount.Text.ToString()))
            {
                lblStatus.Text = "Please Enter TotalAmount";
                lblStatus.ForeColor = Color.Red;
                return;
            }

            decimal i = 0, b = 0, a = 0;
            i = Convert.ToDecimal(txtTotalAmount.Text.ToString());
            a = (i / 106) * 100;
            b = i - a;

            txtAmount.Text = a.ToString("#.##");
            txtGST.Text = b.ToString("#.##");

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.ToString();
        }

    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    public string IPRequestHelper(string url)
    {

        string checkURL = url;
        HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
        HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        StreamReader responseStream = new StreamReader(objResponse.GetResponseStream());
        string responseRead = responseStream.ReadToEnd();
        responseRead = responseRead.Replace("\n", String.Empty);
        responseStream.Close();
        responseStream.Dispose();
        return responseRead;
    }

    public static string GetIpAddress()  // Get IP Address
    {
        string ip = "";
        IPHostEntry ipEntry = Dns.GetHostEntry(GetCompCode());
        IPAddress[] addr = ipEntry.AddressList;
        ip = addr[2].ToString();
        return ip;
    }

    public static string GetCompCode()  // Get Computer Name
    {
        string strHostName = "";
        strHostName = Dns.GetHostName();
        return strHostName;
    }

    private DataTable GetLocation(string ipaddress) // Get location
    {
        WebRequest rssReq = WebRequest.Create("http://freegeoip.appspot.com/xml/" + ipaddress);
        WebProxy px = new WebProxy("http://freegeoip.appspot.com/xml/" + ipaddress, true);
        rssReq.Proxy = px;
        rssReq.Timeout = 2000;
        try
        {
            WebResponse rep = rssReq.GetResponse();
            XmlTextReader xtr = new XmlTextReader(rep.GetResponseStream());
            DataSet ds = new DataSet();
            ds.ReadXml(xtr);
            return ds.Tables[0];
        }
        catch
        {
            return null;
        }
    }
}