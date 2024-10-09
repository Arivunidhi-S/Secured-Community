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
using System.Text;
using System.Net.Mail;

public partial class ChangePassword : System.Web.UI.Page
{
    string @Param = string.Empty;

    string @Param1 = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            @Param = Request.QueryString.Get("Param").ToString();
            @Param1 = Request.QueryString.Get("Param1").ToString();
            string sql = "select * from BusinessRegister where Email ='" + @Param.ToString().Trim() + "' and deleted=0";
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string Name = reader["name"].ToString();
                string SysReg = reader["SysRegno"].ToString();
                string oldpassword = reader["Password"].ToString();
                lblname.Text = Name.ToString();
                if (@Param1 == "s")
                {
                    lblsysregno.Text = SysReg.ToString();
                   
                }
                else if (@Param1 == "f")
                {
                    lblOldPassword.Visible = false;
                    txtOldPassword.Visible = false;
                    lblsysregno.Visible = false;
                    lblsysno.Visible = false;
                }
                else
                {
                    lblsysregno.Visible = false;
                    lblsysno.Visible = false;
                }
            }
            BusinessTier.DisposeReader(reader);
            BusinessTier.DisposeConnection(connMenu);
        }
        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "ChangePassword", "btnChangePassword_OnClick", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
        }
    }

    protected void btnChangePassword_OnClick(object sender, EventArgs e)
    {
        SqlConnection connMenu = BusinessTier.getConnection();
        connMenu.Open();
        try
        {
            if (txtPassword.Text.ToString().Trim() == string.Empty)
            {
                lblStatus.Text = "Password cannot be Empty. Please enter Valid First Name";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            else if (txtRetypePassword.Text.ToString().Trim() == string.Empty)
            {
                lblStatus.Text = "Please re-enter same Password";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            else if (txtPassword.Text.ToString().Trim() != txtRetypePassword.Text.ToString().Trim())
            {
                lblStatus.Text = "Password doesn't match. Please re-enter the Password";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            string sql ="";
            if (@Param1 == "f")
            {
                sql = "update BusinessRegister set Password='" + txtPassword.Text.ToString() + "' where Email='" + @Param.ToString() + "' and  deleted=0";
            }
            else
            {
                sql = "update BusinessRegister set Password='" + txtPassword.Text.ToString() + "' where Email='" + @Param.ToString() + "' and Password='" + txtOldPassword.Text.ToString() + "' and  deleted=0";
            }
            SqlCommand cmd = new SqlCommand(sql, connMenu);
            cmd.ExecuteNonQuery();
            if (@Param1 == "s")
            {
                Response.Redirect("SupplierLogin.aspx", false);
            }
            else
            {
                Response.Redirect("login.aspx", false);
            }

            BusinessTier.DisposeConnection(connMenu);
        }

        catch (Exception ex)
        {
            InsertLogAuditTrail(Session["sesUserID"].ToString(), "ChangePassword", "btnChangePassword_OnClick", ex.ToString(), "Audit");
        }
        finally
        {
            BusinessTier.DisposeConnection(connMenu);
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