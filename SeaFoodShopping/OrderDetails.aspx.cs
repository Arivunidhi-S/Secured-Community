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

public partial class OrderDetails : System.Web.UI.Page
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
            if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblcart.Text = Session["Cart"].ToString();
                cboOrderNo.Text = String.Format("{0:yyyy}", DateTime.Now);
            }
            else { Response.Redirect("login.aspx", false); }
        }
        catch (Exception ex)
        {
            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("index.aspx", false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        try
        {
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                CreateControl();
            }

            connMenu.Open();

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            Response.Redirect("login.aspx", false);
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "Page_Load", ex.ToString(), "Audit");
        }
    }

    // ---------------- %% ** !! RadGrid Functions !! ** %% ---------------- //

    protected void RadGridDisplay_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridDisplay.DataSource = DataSourceHelper("0");
        }
        catch (Exception ex)
        {
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "RadGridDisplay_NeedDataSource", ex.ToString(), "Audit");
            Response.Redirect("index.aspx");

        }
    }

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
            Label lblPrice = (Label)e.Item.FindControl("lblPrice");
            Label lbltotal = (Label)e.Item.FindControl("lbltotal");
            Label cboQnty = (Label)e.Item.FindControl("cboQnty");

            Label lblShipped = (Label)e.Item.FindControl("lblShipped");
            Label lblShip = (Label)e.Item.FindControl("lblShip");

            Label lblDelivered = (Label)e.Item.FindControl("lblDelivered");
            Label lblDeliver = (Label)e.Item.FindControl("lblDeliver");

            Label lblcancel = (Label)e.Item.FindControl("lblcancel");
            Label lblReturn = (Label)e.Item.FindControl("lblReturn");
            Label lblReturnCancel = (Label)e.Item.FindControl("lblReturnCancel");

            Button lnkReturnCancel = (Button)e.Item.FindControl("lnkReturnCancel");

            RadComboBox cboQnty1 = (RadComboBox)e.Item.FindControl("cboQnty1");

            if (!(e.Item is GridEditableItem && e.Item.IsInEditMode))
            {
                lbltotal.Text = (Convert.ToDecimal(lblPrice.Text.ToString()) * Convert.ToDecimal(cboQnty.Text.ToString())).ToString("#0.00");

                if (lblcancel.Text == "Yes")
                {

                    lblReturnCancel.Text = "Canceled";
                    lnkReturnCancel.Visible = false;
                }
                if (lblReturn.Text == "Yes")
                {

                    lblReturnCancel.Text = "Return";
                    lnkReturnCancel.Visible = false;
                }


                if (lblShipped.Text == "Yes")
                {
                    lblShipped.ForeColor = Color.Green;
                    lblShip.ForeColor = Color.Green;
                    lnkReturnCancel.Text = "Return";
                }
                else
                {
                    lblShipped.ForeColor = Color.Orange;
                    lblShip.ForeColor = Color.Orange;
                    lnkReturnCancel.Text = "Cancel";
                }

                if (lblDelivered.Text == "Yes")
                {

                    lblDelivered.ForeColor = Color.Green;
                    lblDeliver.ForeColor = Color.Green;
                }
                else
                {
                    lblDelivered.ForeColor = Color.Orange;
                    lblDeliver.ForeColor = Color.Orange;
                }
            }
        }
        catch (Exception ex)
        {
           // InsertLogAuditTrail(Session["CustomerID"].ToString(), "OrderDetails", "RadGrid1_ItemDataBound", ex.ToString(), "Audit");
        }

        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
    }

    protected void RadGridDisplay_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (e.CommandName == "Delivery" && e.Item is GridDataItem)
            {

                Label lblRunningNo = (Label)e.Item.FindControl("lblRunningNo");

                string sql = "select * FROM ProductReview WHERE ProductID='" + lblRunningNo.ToolTip.ToString().Trim() + "' and created_by='" + Session["CustomerID"].ToString() + "' and deleted=0";
                SqlCommand cmd1 = new SqlCommand(sql, conn);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                if (reader1.Read())
                {
                    if (reader1["Approve"].ToString() == "False")
                    {
                        txtReviewtitle.ToolTip = "U";
                        HiddenField1.Value = reader1["Rate"].ToString();
                        txtReviewtitle.Text = reader1["ReviewTitle"].ToString();
                        txtReviewdescription.Text = reader1["ProductReview"].ToString();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'", true);
                    }
                    else
                    {
                        lblStatus.Text = "Your are already write your review thank you....";
                        lblStatus.ForeColor = Color.Green;
                        return;
                    }
                }
                else
                {
                    txtReviewtitle.Text = "";
                    txtReviewdescription.Text = "";
                    HiddenField1.Value = "0";
                    txtReviewtitle.ToolTip = "N";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'", true);
                }
                BusinessTier.DisposeReader(reader1);


                BusinessTier.DisposeConnection(conn);
            }

            if (e.CommandName == "Click" && e.Item is GridDataItem)
            {

                if (e.Item is GridDataItem)
                {
                    GridDataItem item = (GridDataItem)e.Item;

                    Button lnkReturnCancel = (Button)e.Item.FindControl("lnkReturnCancel");
                    Label lblRunningNo = (Label)e.Item.FindControl("lblRunningNo");
                    if (lnkReturnCancel.Text == "Cancel")
                    {
                        String today = DateTime.Now.ToString();
                        DateTime dtinsDate = DateTime.Parse(today);
                        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";


                        String nextday = DateTime.Now.AddDays(-1).ToString();
                        DateTime dtnextDate = DateTime.Parse(nextday);
                        nextday = dtnextDate.Month + "/" + dtnextDate.Day + "/" + dtnextDate.Year + " 00:00:00";
                        string ID = lblRunningNo.Text.ToString();

                        string sql = "select * FROM VW_OrderDetails WHERE Deleted=0 and buy=1 and status=1 and Deliver=0 and Shipped=0 and Customerid='" + Session["CustomerID"].ToString() + "' and RefNo='" + lblOrderNo.Text.ToString().Trim() + "' and RunningNo='" + ID.ToString() + "' and created_date between '" + nextday.ToString() + "' and '" + today.ToString() + "'";
                        SqlCommand cmd1 = new SqlCommand(sql, conn);
                        SqlDataReader reader1 = cmd1.ExecuteReader();
                        if (reader1.Read())
                        {
                            Response.Redirect("CancelOrder.aspx?Param=" + lblOrderNo.Text.ToString().Trim() + "&Param2=" + ID.ToString(), false);
                        }
                        else
                        {
                            lblStatus.Text = "** You have to Cancel within 1 Hour **";
                        }
                        BusinessTier.DisposeReader(reader1);
                    }
                    else if (lnkReturnCancel.Text == "Return")
                    {
                        String today = DateTime.Now.ToString();
                        DateTime dtinsDate = DateTime.Parse(today);
                        today = dtinsDate.Month + "/" + dtinsDate.Day + "/" + dtinsDate.Year + " 00:00:00";


                        String nextday = DateTime.Now.AddDays(-3).ToString();
                        DateTime dtnextDate = DateTime.Parse(nextday);
                        nextday = dtnextDate.Month + "/" + dtnextDate.Day + "/" + dtnextDate.Year + " 00:00:00";

                        string ID = lblRunningNo.Text.ToString();
                        string sql = "select * FROM VW_OrderDetails WHERE Deleted=0 and buy=1 and status=1 and Shipped=1 and Customerid='" + Session["CustomerID"].ToString() + "' and RefNo='" + lblOrderNo.Text.ToString().Trim() + "' and RunningNo='" + ID.ToString() + "' and DeliverDate between '" + nextday.ToString() + "' and '" + today.ToString() + "'";
                        SqlCommand cmd1 = new SqlCommand(sql, conn);
                        SqlDataReader reader1 = cmd1.ExecuteReader();
                        if (reader1.Read())
                        {
                            Response.Redirect("ReturnOrder.aspx?Param=" + lblOrderNo.Text.ToString().Trim() + "&Param2=" + ID.ToString(), false);
                        }
                        else
                        {
                            lblStatus.Text = "** You have to return within 3 days of delivery **";
                        }
                        BusinessTier.DisposeReader(reader1);

                    }
                    BusinessTier.DisposeConnection(conn);
                    lblStatus.ForeColor = Color.Red;
                }
                //e.Item.Selected = true;
                //string AddcartID = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddcartID"]).ToString();

            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
            // InsertLogAuditTrail(Session["sesUserID"].ToString(), "RadGridDisplay_ItemCommand", "OrderDetails", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }

    }

    public DataTable DataSourceHelper(string orderno)
    {
        SqlConnection conn = BusinessTier.getConnection();
        conn.Close();
        string shippingid = string.Empty;
        if (string.IsNullOrEmpty(cboOrderNo.Text.ToString()))
        {
            shippingid = "0";
        }
        else
        {
            shippingid = cboOrderNo.Text.ToString();
        }
        DataTable g_datatable = new DataTable();
        string sql = "select *,CASE WHEN Shipped = 0  THEN 'No'  ELSE  'Yes'  END AS Shipping,CASE WHEN Deliver = 0  THEN 'No'  ELSE  'Yes'  END AS Delivered,CASE WHEN Cancel = 0  THEN 'No'  ELSE  'Yes'  END AS Cancelorder,CASE WHEN Returnproduct = 0  THEN 'No'  ELSE  'Yes'  END AS Returnpro FROM VW_OrderDetails WHERE Deleted=0 and buy=1 and status='success' and Customerid='" + Session["CustomerID"].ToString() + "' and OrderNo='" + orderno.ToString().Trim() + "'";
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

    protected void cboOrderNo_OnItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        try
        {
            //string @Param = string.Empty;
            //@Param = Request.QueryString.Get("Param").ToString();
            DataTable dtCategoryItems = new DataTable();
            SqlConnection connMenu = BusinessTier.getConnection();
            connMenu.Open();
            string sql = " select distinct(DATEPART(yyyy,created_date)) as date from VW_OrderDetails where Customerid='" + Session["CustomerID"].ToString() + "' order by date desc";
            //string sql = "select distinct(orderid)as orderid from VW_OrderDetails where DELETED=0 and buy=1 and status=00 and Customerid='" + Session["CustomerID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader readerMenu = cmd.ExecuteReader();
            dtCategoryItems.Load(readerMenu);
            RadComboBox comboBox = (RadComboBox)sender;
            comboBox.Items.Clear();
            foreach (DataRow row in dtCategoryItems.Rows)
            {
                RadComboBoxItem item = new RadComboBoxItem();
                item.Text = row["date"].ToString();
                //item.Value = row["CategoryID"].ToString();
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

    protected void cboOrderNo_OnSelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        try
        {
            //CreateControl();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderDetails", "cboOrderNo_OnSelectedIndexChanged", ex.ToString(), "Audit");
        }

    }

    protected void lb_Command(object sender, CommandEventArgs e)
    {
        lblStatus.Text = string.Empty;
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        LinkButton lnk = sender as LinkButton;
        string shippingid = string.Empty;
        if (string.IsNullOrEmpty(cboOrderNo.Text.ToString()))
        {
            shippingid = "0";
        }
        else
        {
            shippingid = lnk.Text.ToString();
            lblOrderNo.Text = lnk.Text.ToString();
        }
        RadGridDisplay.DataSource = DataSourceHelper(lnk.Text.ToString());
        RadGridDisplay.Rebind();
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    protected void BtnOrderDetails_Click(object sender, EventArgs e) { }

    private void CreateControl()
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();

        SqlDataReader readerMenulist1 = BusinessTier.getOrderDetails(connMenu, Session["CustomerID"].ToString(), cboOrderNo.Text.ToString());
        dtOrderDetails.Load(readerMenulist1);
        TableRow rowNew1 = new TableRow();
        tbl.Controls.Add(rowNew1);
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();
        Label lbl1 = new Label();
        Label lbl2 = new Label();
        Label lbl3 = new Label();
        Label lbl4 = new Label();
        lbl1.Text = "Order No";
        lbl2.Text = "Total Amount";
        lbl3.Text = "Placed on";
        lbl4.Text = "Payment Method";
        cell1.Style.Add("background-color", "#00af31");
        cell1.Style.Add("color", "White");
        cell2.Style.Add("background-color", "#00af31");
        cell2.Style.Add("color", "White");
        cell3.Style.Add("background-color", "#00af31");
        cell3.Style.Add("color", "White");
        cell4.Style.Add("background-color", "#00af31");
        cell4.Style.Add("color", "White");
        cell1.Controls.Add(lbl1);
        cell2.Controls.Add(lbl2);
        cell3.Controls.Add(lbl3);
        cell4.Controls.Add(lbl4);
        rowNew1.Controls.Add(cell1);
        rowNew1.Controls.Add(cell2);
        rowNew1.Controls.Add(cell3);
        rowNew1.Controls.Add(cell4);
        for (int i = 0; i < dtOrderDetails.Rows.Count; i++)
        {
            lb = new LinkButton();
            lb.Text = dtOrderDetails.Rows[i][0].ToString() + "     "; //LinkButton Text
            lb.ID = Convert.ToString(i); // LinkButton ID’s
            lb.CommandArgument = Convert.ToString(i); //LinkButton CommandArgument
            lb.CommandName = Convert.ToString(i); //LinkButton CommanName
            lb.Command += new CommandEventHandler(lb_Command);//Create Handler for it.
            //PlaceHolder1.Controls.Add(lb); // Adding the LinkButton in PlaceHolder
            Label lblamount = new Label();
            Label lbldate = new Label();
            Label lblPayMethod = new Label();
            lblamount.Text = Convert.ToDecimal(dtOrderDetails.Rows[i][1]).ToString("#0.00");
            lbldate.Text = dtOrderDetails.Rows[i][2].ToString();
            lblPayMethod.Text = dtOrderDetails.Rows[i][3].ToString();
            TableRow rowNew = new TableRow();
            //rowNew.Width = new Unit("25%");
            tbl.Controls.Add(rowNew);
            TableCell cellNew = new TableCell();
            TableCell cellNew1 = new TableCell();
            TableCell cellNew2 = new TableCell();
            TableCell cellNew3 = new TableCell();
            //cellNew.Style.Add("width", "25% !important");
            //cellNew.Style.Add("border-style", "solid");
            //cellNew.Style.Add("border-width", "1px");
            //cellNew.Style.Add("text-align", "center");
            cellNew.Controls.Add(lb);
            cellNew1.Controls.Add(lblamount);
            cellNew2.Controls.Add(lbldate);
            cellNew3.Controls.Add(lblPayMethod);
            rowNew.Controls.Add(cellNew);
            rowNew.Controls.Add(cellNew1);
            rowNew.Controls.Add(cellNew2);
            rowNew.Controls.Add(cellNew3);

            //}
        }
        BusinessTier.DisposeReader(readerMenulist1);
    }

    private void GridLoad()
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();

        string lnk = string.Empty;
        string sql1 = "select max (orderid) as orid from VW_OrderDetails where deleted=0 and buy=1 and Customerid='" + Session["CustomerID"].ToString() + "'and  DATEPART(yyyy,created_date)='" + cboOrderNo.Text.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(sql1, connMenu);
        SqlDataReader reader1 = cmd1.ExecuteReader();
        if (reader1.Read())
        {
            lnk = reader1["orid"].ToString();
            lblOrderNo.Text = lnk.ToString();
        }

        BusinessTier.DisposeReader(reader1);

        string sql = "select max(orderid)as orderid,count(*) as Cart, sum(DiscountPrice*Qnty) as Total, sum(ShippingCost*Qnty) as ShipCost from VW_OrderDetails where DELETED=0 and buy=1 and Cancel=0 and Returnproduct=0 and Customerid='" + Session["CustomerID"].ToString() + "'and orderid='" + lnk.ToString() + "'";
        SqlCommand cmd = new SqlCommand(sql, connMenu);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            //lblorderid.Text = reader["orderid"].ToString();
            // lblcart.Text = reader["Cart"].ToString();

            //lblTotal.Text = reader["Total"].ToString();

            //lblShippingCost.Text = reader["ShipCost"].ToString();
            //lblGrandTotal.Text = (Convert.ToDecimal(lblTotal.Text) + Convert.ToDecimal(lblShippingCost.Text)).ToString();
        }

        BusinessTier.DisposeReader(reader);

        RadGridDisplay.DataSource = DataSourceHelper(lnk.ToString());
        RadGridDisplay.Rebind();
    }

    protected void btnCancelOrder_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(lblOrderNo.Text.ToString()))
        {
            lblStatus.Text = "Please select any Order No";
            return;
        }
        Response.Redirect("CancelOrder.aspx?Param=" + lblOrderNo.Text.ToString(), false);
    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        lblStatus.Text = string.Empty;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        int ProductID = 0;
        foreach (GridDataItem grdItem in RadGridDisplay.Items)
        {
            Label lblRunningNo = (Label)grdItem.FindControl("lblRunningNo");
            ProductID = Convert.ToInt32(lblRunningNo.ToolTip.ToString().Trim());
        }
        if (string.IsNullOrEmpty(txtReviewtitle.Text.ToString()))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Msg", "alert('Please Fill Review title')", true);
            return;
        }
        if (string.IsNullOrEmpty(txtReviewdescription.Text.ToString()))
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Msg", "alert('Please Fill Review description')", true);
            return;

        }
        int flg = BusinessTier.ProductReview(conn, 1, Convert.ToInt32(HiddenField1.Value), txtReviewtitle.Text.ToString().Trim(), txtReviewdescription.Text.ToString().Trim(), ProductID, 1, Session["CustomerID"].ToString(), txtReviewtitle.ToolTip.ToString());
        BusinessTier.DisposeConnection(conn);
        if (txtReviewtitle.ToolTip == "N")
        {
            lblStatus.Text = "Thank you! Successfully Submitted Your Review.";
        }
        else
        {
            lblStatus.Text = "Thank you! Successfully Modify Your Review.";
        }
        lblStatus.ForeColor = Color.Green;
        lblOrderNo.ToolTip = HiddenField1.Value;
    }

}