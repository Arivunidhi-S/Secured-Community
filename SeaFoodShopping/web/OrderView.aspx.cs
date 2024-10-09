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

public partial class OrderView : System.Web.UI.Page
{
    public string param = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        param = Request.QueryString["param"].ToString();
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
               Response.Redirect("AdminLogin.aspx", false);
            }
            else
            {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                //lblName.Text = textInfo.ToTitleCase(Session["sesUserID"].ToString());
            }
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["AdminID"].ToString(), "web/OrderView", "Page_Load", ex.ToString(), "Audit");
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
        sql = "select *,  cast(round(Qnty*DiscountPrice,2) as numeric(36,2)) as TotalPrice FROM VW_OrderDetails WHERE Deleted='" + delval + "' order by AddcartID desc";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Invoice" && e.Item is GridDataItem)
            {
                String path = string.Empty;
                path = WebConfigurationManager.AppSettings["ImagePath"].ToString();
                path += "\\web\\";
                                e.Item.Selected = true;
                                string strTakenId = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["OrderNo"]).ToString();
                              GridEditFormItem editedItem = e.Item as GridEditFormItem;
                             string strLink = "";
                             strLink = path + "\\InvoiceReport.aspx?param1=" + strTakenId.ToString() + "&param2=Invoice";
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1000,height=900');", true);
            }

            if (e.CommandName == "Delivery" && e.Item is GridDataItem)
            {
                String path = string.Empty;
                path = WebConfigurationManager.AppSettings["ImagePath"].ToString();
                path += "\\web\\";
                e.Item.Selected = true;
                string strTakenId = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["RefNo"]).ToString();
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                string strLink = "";
                strLink = path + "\\InvoiceReport.aspx?param1=" + strTakenId.ToString() + "&param2=Delivery";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1000,height=900');", true);
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;

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
                client1.Send(message1);
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

    protected void btnUpdate_OnClick(object sender, EventArgs e)
    {
    SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            String today = DateTime.Now.ToString();
            DateTime dtinsDate = DateTime.Parse(today);
            today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";

            foreach (GridDataItem grdItem in RadGrid1.Items)
            {
                CheckBox ChkShipped = (CheckBox)grdItem.FindControl("ChkShipped");
                CheckBox ChkDeliverd = (CheckBox)grdItem.FindControl("ChkDeliverd");

                int intTrackId = Convert.ToInt32(ChkShipped.ToolTip.ToString().Trim());


                if (ChkShipped.Checked)
                {
                    string sql = "update AddCartMaster set Shipped=1,ShippedDate='" + today.ToString() + "' WHERE AddcartID='" + intTrackId.ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Successfully Updated";
                    lblStatus.ForeColor = Color.Green;
                }
                else
                {
                    string sql = "update AddCartMaster set Shipped=0,ShippedDate='" + today.ToString() + "' WHERE AddcartID='" + intTrackId.ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Successfully Updated";
                    lblStatus.ForeColor = Color.Green;
                }

                if (ChkDeliverd.Checked)
                {
                    string sql = "update AddCartMaster set Deliver=1,DeliverDate='" + today.ToString() + "' WHERE AddcartID='" + intTrackId.ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Successfully Updated";
                    lblStatus.ForeColor = Color.Green;
                }
                else
                {
                    string sql = "update AddCartMaster set Deliver=0,DeliverDate='" + today.ToString() + "' WHERE AddcartID='" + intTrackId.ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Successfully Updated";
                    lblStatus.ForeColor = Color.Green;
                }
            }


            //btnReport.Enabled = true;
            //string refno = cbojobno.Text.ToString();
            RadGrid1.DataSource = DataSourceHelper();
            RadGrid1.Rebind();
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderView", "btnUpdate_OnClick", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
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
