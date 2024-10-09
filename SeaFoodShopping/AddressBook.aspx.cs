using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Adapters;
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
using System.IO;
using System.Reflection;

using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public partial class AddressBook : System.Web.UI.Page
{
    public DataTable dtMenuItems = new DataTable();

    public DataTable dtSubMenuItems = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();

        try
        {
            if (!(string.IsNullOrEmpty(Session["sesUserID"].ToString())))
            {
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblcart.Text = Session["Cart"].ToString();
            }
            else { Response.Redirect("login.aspx"); }

            SqlDataReader readerMenulist = BusinessTier.getMenuList(connMenu);
            dtMenuItems.Load(readerMenulist);
            BusinessTier.DisposeReader(readerMenulist);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            BusinessTier.DisposeConnection(connMenu);
            //InsertLogAuditTrail(Session["sesUserID"].ToString(), "AddressBook", "Page_Init", ex.ToString(), "Audit");
            Response.Redirect("login.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }

    public DataTable DataSourceHelper2()
    {
        int delval = 0;
        string sql = "";
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        sql = "select * FROM MasterAddress WHERE Deleted='" + delval + "' and CREATED_BY='" + Session["CustomerID"].ToString().Trim() + "' ";
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, conn);
        DataTable g_datatable = new DataTable();
        sqlDataAdapter.Fill(g_datatable);
        BusinessTier.DisposeAdapter(sqlDataAdapter);
        BusinessTier.DisposeConnection(conn);
        return g_datatable;
    }

    protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGrid2.DataSource = DataSourceHelper2();
            RadGrid2.Rebind();
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddressBook", "RadGrid2_NeedDataSource", ex.ToString(), "Audit");
        }
    }

    protected void RadGrid2_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddressId"].ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            int flg = 0;
            flg = BusinessTier.AddAdress(conn, Convert.ToInt32(ID.ToString().Trim()),"","","","","", "", "", "", "", "", "", "D");
                  
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblGridStatus.Text = "Sucessfully Address Delete";
                lblGridStatus.ForeColor = Color.Red;
            }
            RadGrid2.DataSource = DataSourceHelper2();
            RadGrid2.Rebind();
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddressBook", "RadGrid2_DeleteCommand", "Success", "Log");
        }
        catch (Exception ex)
        {
            e.Canceled = true;
            InsertLogAuditTrail(Session["CustomerID"].ToString(), "AddressBook", "RadGrid2_DeleteCommand", ex.ToString(), "Audit");
        }
    }

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        lblGridStatus.Text = string.Empty;
        if (e.CommandName == "RowClick" && e.Item is GridDataItem)
        {
            e.Item.Selected = true;
            string strAddressId = (e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AddressId"]).ToString();
            SqlConnection conn = BusinessTier.getConnection();
            conn.Open();
            try
            {
                string sql = "Select * from MasterAddress where AddressId='" + strAddressId.ToString() + "' and deleted=0";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    txtName.Text = (rd["Name"].ToString());

                    txtContactNo.Text = (rd["Mobile"].ToString());
                    txtEmail.Text = (rd["Email"].ToString());

                    txtAddress1.Text = (rd["Address1"].ToString());
                    txtAddress2.Text = (rd["Address2"].ToString());
                    txtAddress3.Text = (rd["Address3"].ToString());
                    txtPostCode.Text = (rd["Postcode"].ToString());
                    txtCity.Text = (rd["City"].ToString());
                    txtState.Text = (rd["State"].ToString());
                    txtCountry.Text = (rd["Country"].ToString());
                    txtCountry.ToolTip = (rd["AddressId"].ToString());
                }
                BusinessTier.DisposeReader(rd);
                BusinessTier.DisposeConnection(conn);
            }
            catch (Exception ex)
            {
                //lblStatus.Text = ex.Message;
                BusinessTier.DisposeConnection(conn);
                InsertLogAuditTrail(Session["sesUserID"].ToString(), "OrderForm", "ItemClick", ex.ToString(), "Audit");
            }
        }
    }

    protected void Clear()
        {
            txtName.Text = string.Empty;

            txtContactNo.Text = string.Empty;
            txtEmail.Text = string.Empty;

            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtAddress3.Text = string.Empty;
            txtPostCode.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtState.Text = string.Empty;
            //txtState.AutoPostBack = true;
            //txtState.SelectedItem.Text = "";
            //txtState.Items.Clear();
            //txtCountry.Items.Clear();
            txtCountry.Text = string.Empty;
            txtCountry.ToolTip = string.Empty;
    }

    protected void btnAddAddressOnClick(object sender, EventArgs e)
    {
        lblGridStatus.ForeColor = Color.Red;
        SqlConnection conn = BusinessTier.getConnection();
        conn.Open();
        try
        {
            if (string.IsNullOrEmpty(txtName.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Name";
                return;
            }
            Regex charregex = new Regex(@"[^a-zA-Z0-9\s.]");
            if ((charregex.IsMatch(txtName.Text.ToString().Trim())))
            {
                lblGridStatus.Text = "No special characters on the Name are allowed";
                return;
            }
            if (string.IsNullOrEmpty(txtContactNo.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Contact No";
                return;
            }
            if (string.IsNullOrEmpty(txtEmail.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Email";
                return;
            }
            Regex emailRegex = new Regex(@"^[a-zA-Z][\w\.-]{2,28}[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");
            if (!(emailRegex.IsMatch(txtEmail.Text.ToString().Trim())))
            {
                lblGridStatus.Text = "Enter Valid Email";
                return;
            }
            if (string.IsNullOrEmpty(txtAddress1.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Address Line 1";
                return;
            }

            //if (string.IsNullOrEmpty(txtAddress1.Text.ToString().Trim()))
            //{
            //    lblGridStatus.Text = "Enter Address Line 1";
            //    return;
            //}
            //if (string.IsNullOrEmpty(txtAddress2.Text.ToString().Trim()))
            //{
            //    lblGridStatus.Text = "Enter Address Line 2";
            //    return;
            //}

            //if (string.IsNullOrEmpty(txtAddress3.Text.ToString().Trim()))
            //{
            //    lblGridStatus.Text = "Enter Address Line 3";
            //    return;
            //}

            if (string.IsNullOrEmpty(txtPostCode.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter PostCode";
                return;
            }
            if (string.IsNullOrEmpty(txtCity.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter City";
                return;
            }
            if (string.IsNullOrEmpty(txtState.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter State";
                return;
            }
            if (string.IsNullOrEmpty(txtCountry.Text.ToString().Trim()))
            {
                lblGridStatus.Text = "Enter Country";
                return;
            }

            int flg = 0;
            string sql = "select count(*)as counting from MasterAddress where CREATED_BY='" + Session["CustomerID"].ToString().Trim() + "' and deleted=0";
            int counting = 0;
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                counting = Convert.ToInt32(reader["counting"].ToString());
            }
           
            reader.Close();
     
            if (string.IsNullOrEmpty(txtCountry.ToolTip.ToString()))
            {
                 if (counting < 10)
                {

                    flg = BusinessTier.AddAdress(conn, 1, txtName.Text.ToString().Trim(), txtContactNo.Text.ToString(),txtEmail.Text.ToString(), txtAddress1.Text.ToString().Trim(), txtAddress2.Text.ToString().Trim(), txtAddress3.Text.ToString().Trim(), txtPostCode.Text.ToString().Trim(), txtCity.Text.ToString().Trim(), txtState.Text.ToString().Trim(), txtCountry.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "N");
                lblGridStatus.Text = "Sucessfully Address Added";
                Clear();
                }
                 else
                 {
                     lblGridStatus.Text = "** You have already reached the maximum limit of 10 addresses. Cannot add a new address. ** ";
                 }
            }
            else
            {
                flg = BusinessTier.AddAdress(conn, Convert.ToInt32(txtCountry.ToolTip.ToString().Trim()), txtName.Text.ToString().Trim(),txtContactNo.Text.ToString(), txtEmail.Text.ToString(), txtAddress1.Text.ToString().Trim(), txtAddress2.Text.ToString().Trim(), txtAddress3.Text.ToString().Trim(), txtPostCode.Text.ToString().Trim(), txtCity.Text.ToString().Trim(), txtState.Text.ToString().Trim(), txtCountry.Text.ToString().Trim(), Session["CustomerID"].ToString().Trim(), "U");
                    lblGridStatus.Text = "Sucessfully Address Updated";
                    Clear();
               
            }
            BusinessTier.DisposeConnection(conn);
            if (flg >= 1)
            {
                lblGridStatus.ForeColor = Color.Green;
            }
            else
            {
                lblGridStatus.ForeColor = Color.Red;
            }

        }
        catch (Exception ex)
        {
            //lblGridStatus.Text = ex.Message.ToString();
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "AddressBook", "btnAddProduct_OnClick", ex.ToString(), "Audit");
            lblGridStatus.ForeColor = Color.Red;
        }
        finally
        {
            BusinessTier.DisposeConnection(conn);
        }
        RadGrid2.DataSource = DataSourceHelper2();
        RadGrid2.Rebind();
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["CustomerID"] = "";
        Response.Redirect("index.aspx");
    }

    private void InsertLogAuditTrail(string userid, string module, string activity, string result, string flag)
    {
        SqlConnection connLog = BusinessTier.getConnection();
        connLog.Open();
        BusinessTier.InsertLogAuditTrial(connLog, userid, module, activity, result, flag);
        BusinessTier.DisposeConnection(connLog);
    }
}