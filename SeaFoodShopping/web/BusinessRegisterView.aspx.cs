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

public partial class BusinessRegisterView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("AdminLogin.aspx");
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
        sql = "select * FROM BusinessRegister WHERE Deleted='" + delval + "' order by BusinessID desc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["BusinessID"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = BusinessTier.DeleteTables(conn, Convert.ToInt32(ID), Session["AdminID"].ToString(), "BD");
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

    protected void RadGrid1_UpdateCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        try
        {
            conn.Open();
            GridEditableItem editedItem = e.Item as GridEditableItem;
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["BusinessID"].ToString();
            CheckBox chkApprove = (CheckBox)editedItem.FindControl("chkApprove");
            TextBox txtemail = (TextBox)editedItem.FindControl("txtemail");
            Label lblSysRegno = (Label)editedItem.FindControl("lblSysRegno");
            int Approve = 0;
            if (chkApprove.Checked)
            {
                Approve = 1;
            }
            int flg = 0;
            flg = BusinessTier.BusinessRegister(conn, Convert.ToInt32(ID.ToString().Trim()), "", "", "", "", "", txtemail.Text.ToString(), "", "", "", "", "", "", "", Approve, "", "", "", "", "", "", "", "", 1, 1, "", "", "", "", "1", "U");
            // flg = BusinessTier.BusinessRegister(conn, Convert.ToInt32(ID.ToString().Trim()), "", "", "", 1, "", "", "", "", "", "", "", "", Approve, "", "", "", "", "", "", "1", "U");
            BusinessTier.DisposeConnection(conn);
            if (chkApprove.Checked)
            {
                MailMessage message1 = new MailMessage();
                message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                //message1.From = new MailAddress(Session["Email"].ToString().Trim());
                message1.To.Add(new MailAddress(chkApprove.ToolTip.ToString().Trim()));

                message1.Subject = "Approval to Products";
                string msg = string.Empty;
                msg = "Dear " + lblSysRegno.ToolTip.ToString() + ",\n\n" + "You have approved to add product on EasyBuyBye.com your System Registration No : " + lblSysRegno.Text.ToString() + "\n\nby, \nAdmin";
                message1.Body = msg;
                SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client1.EnableSsl = true;
                //client1.Send(message1);
            }

            if (flg >= 1)
            {
                lblStatus.Text = "You have Sucessfully Approved!";
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

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }
}