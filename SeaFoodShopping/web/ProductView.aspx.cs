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
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;



public partial class ProductView : System.Web.UI.Page
{
    public string param = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        param = Request.QueryString["param"].ToString();
        try
        {
            if (string.IsNullOrEmpty(Session["AdminID"].ToString()))
            {
                SqlConnection connSave = BusinessTier.getConnection();
                connSave.Open();
                connSave.Close();
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
        sql = "select * FROM Vw_Products order by ProductID desc";
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
            String path = string.Empty;
            path = WebConfigurationManager.AppSettings["ImagePath"].ToString();
            //path = Server.MapPath("");
            //path += "\\Documents\\";
            if (e.CommandName == "imagePath" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblMyKad = (Label)e.Item.FindControl("lblMyKad");

                if (!(string.IsNullOrEmpty(lblMyKad.Text.ToString().Trim())))
                {
                    string line = lblMyKad.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
            }
            if (e.CommandName == "Image1" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblbankstatement = (Label)e.Item.FindControl("lblbankstatement");

                if (!(string.IsNullOrEmpty(lblbankstatement.Text.ToString().Trim())))
                {
                    string line = lblbankstatement.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
            }

            if (e.CommandName == "Image2" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblutilitiesbill = (Label)e.Item.FindControl("lblutilitiesbill");

                if (!(string.IsNullOrEmpty(lblutilitiesbill.Text.ToString().Trim())))
                {
                    string line = lblutilitiesbill.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
            }

            if (e.CommandName == "Image3" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblform9 = (Label)e.Item.FindControl("lblform9");

                if (!(string.IsNullOrEmpty(lblform9.Text.ToString().Trim())))
                {
                    string line = lblform9.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
            }

            if (e.CommandName == "Image4" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblform49 = (Label)e.Item.FindControl("lblform49");

                if (!(string.IsNullOrEmpty(lblform49.Text.ToString().Trim())))
                {
                    string line = lblform49.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
            }

            if (e.CommandName == "Image5" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                GridEditFormItem editedItem = e.Item as GridEditFormItem;
                Label lblGSTApproval = (Label)e.Item.FindControl("lblGSTApproval");

                if (!(string.IsNullOrEmpty(lblGSTApproval.Text.ToString().Trim())))
                {
                    string line = lblGSTApproval.Text.ToString().Trim();
                    string[] tokens = line.Split(new char[] { '\\' }, 3, 0);
                    string strLink = path + tokens[0] + "/" + tokens[1] + "/" + tokens[2];
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "OpenNewTab", "window.open('" + strLink + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=500,height=500');", true);
                }
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
            //GridDataItem dataitem = (GridDataItem)e.Item;
            //LinkButton hyperlinkMyKad = (LinkButton)dataitem["hyperlinkMyKad"].Controls[0];
            //hyperlinkMyKad.Click += new EventHandler(hyperlinkMyKad_OnClick);
            //Image imgMain = (Image)e.Item.FindControl("imgMain");
            System.Web.UI.WebControls.Image imgMain = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgMain");
            //System.Drawing.Image image = (Image)item["TempCol"].FindControl("Image1"); 
            string stringimg = "Products\\Hair Gel12Amm Pomade.jpeg";
            //imgMain.ImageUrl = stringimg.ToString();

        }


    }

    protected void RadGrid1_ItemDataBound(object source, Telerik.Web.UI.GridItemEventArgs e)
    {

        if (e.Item is GridDataItem)
        {
            //GridDataItem dataitem = (GridDataItem)e.Item;
            //LinkButton hyperlinkMyKad = (LinkButton)dataitem["hyperlinkMyKad"].Controls[0];
            //hyperlinkMyKad.CommandArgument = string.Format("return Click('{0}';", (e.Item as GridDataItem)["hyperlinkMyKad"].Text);
            System.Web.UI.WebControls.Image imgMain = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgMain");
            //System.Drawing.Image image = (Image)item["TempCol"].FindControl("Image1"); 
            string stringimg = "Products\\Hair Gel12Amm Pomade.jpeg";
            //imgMain.ImageUrl = stringimg.ToString();

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
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ProductItemID"].ToString();

            CheckBox chkApprove = (CheckBox)editedItem.FindControl("chkApprove");
            CheckBox chkdelete = (CheckBox)editedItem.FindControl("chkdelete");
            Label lblApprove = (Label)editedItem.FindControl("lblApprove");
            Label lblProductID = (Label)editedItem.FindControl("lblProductID");

            int Approve = 0, delete = 0;


            if (chkApprove.Checked)
            {
                Approve = 1;
            }

            if (chkdelete.Checked)
            {
                delete = 1;// this parameter going via totalstock
            }

            int flg = 0;
            flg = BusinessTier.ProductItem(conn, Convert.ToInt32(ID.ToString().Trim()), Convert.ToInt32(lblProductID.Text.ToString().Trim()), delete, "", "", "", "", "", Approve, Session["CustomerID"].ToString().Trim(), "A");
            //flg = BusinessTier.BusinessRegister(conn, Convert.ToInt32(ID.ToString().Trim()), "", "", "", 1, "", "", "", "", "", "", "", "", Approve, "", "", "", "", "", "", "1", "U");

            BusinessTier.DisposeConnection(conn);

            if (chkApprove.Checked)
            {
                //MailMessage message1 = new MailMessage();
                //message1.From = new MailAddress(ConfigurationManager.AppSettings["MailAddress"].ToString());
                ////message1.From = new MailAddress(Session["Email"].ToString().Trim());
                //message1.To.Add(new MailAddress(chkApprove.ToolTip.ToString().Trim()));

                //message1.Subject = "Approval to Products";
                //string msg = string.Empty;
                //msg = "Dear " + lblApprove.ToolTip.ToString() + ",\n\n" + "Your product is approved to list out on updown.my website your product id : " + ID.ToString().Trim() + "\n\nby, \nAdmin";
                //message1.Body = msg;
                //SmtpClient client1 = new SmtpClient(ConfigurationManager.AppSettings["Webserver"].ToString(), Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString()));
                //client1.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["MailAddress"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                //client1.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client1.EnableSsl = true;
                //client1.Send(message1);
            }

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
            InsertLogAuditTrail(Session["AdminID"].ToString(), "ProductView", "RadGrid1_UpdateCommand", ex.ToString(), "Audit");
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
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ProductID"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = BusinessTier.DeleteTables(conn, Convert.ToInt32(ID), Session["AdminID"].ToString(), "PD");
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblStatus.Text = "Successfully Deleted! Please Checkout Edit Mode Delete CheckBox";
            }

            RadGrid1.Rebind();
            //InsertLogAuditTrial is used to insert the action into MasterLog table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "ProductView", "RadGrid1_DeleteCommand", "Success", "Log");
        }
        catch (Exception ex)
        {

            e.Canceled = true;
            //InsertLogAuditTrial is used to insert the action into MasterAuditTrail table
            InsertLogAuditTrail(Session["AdminID"].ToString(), "ProductView", "RadGrid1_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }

    protected void btnUpdate_OnClick(object sender, EventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            foreach (GridDataItem grdItem in RadGrid1.Items)
            {
                TextBox txtActualPrice = (TextBox)grdItem.FindControl("txtActualPrice");
                TextBox txtSellingPrice = (TextBox)grdItem.FindControl("txtSellingPrice");
                TextBox txtDiscountPrice = (TextBox)grdItem.FindControl("txtDiscountPrice");

                int ProductId = Convert.ToInt32(txtActualPrice.ToolTip.ToString().Trim());

                lblStatus.Text = string.Empty;
                if (string.IsNullOrEmpty(txtActualPrice.Text.ToString()))
                {
                    txtActualPrice.Text = "0";
                }
                if (string.IsNullOrEmpty(txtSellingPrice.Text.ToString()))
                {
                    txtSellingPrice.Text = "0";
                }
                if (string.IsNullOrEmpty(txtDiscountPrice.Text.ToString()))
                {
                    txtDiscountPrice.Text = "0";
                }
                decimal p = 0, r = 0, per = 0;
                int discount = 0;
                p = Convert.ToDecimal(txtSellingPrice.Text.ToString().Trim());
                r = Convert.ToDecimal(txtDiscountPrice.Text.ToString().Trim());
                per = (1 - (r / p)) * 100;//p - ((r / 100) * p);
                discount = Convert.ToInt32(per);

                string sql = "update MasterProducts set ActualPrice='" + txtActualPrice.Text.ToString() + "',SellingPrice='" + txtSellingPrice.Text.ToString() + "',DiscountPrice='" + txtDiscountPrice.Text.ToString() + "',Discount='" + discount.ToString() + "'   WHERE ProductId='" + ProductId.ToString() + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                lblStatus.Text = "Successfully Updated";
                lblStatus.ForeColor = Color.Green;


            }


            //btnReport.Enabled = true;
            //string refno = cbojobno.Text.ToString();
            RadGrid1.DataSource = DataSourceHelper();
            RadGrid1.Rebind();
            BusinessTier.DisposeConnection(conn);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "ProductView", "btnUpdate_OnClick", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

    }
}