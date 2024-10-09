using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(string.IsNullOrEmpty(Session["CustomerID"].ToString())))
        {
            if (!(Session["sesUserID"].ToString().ToString() == ""))
            {
                lblLog.Text = "Logout";
                lblWelcome.Visible = true;
                lblName.Text = Session["sesUserID"].ToString() + "'s";
                lblWelcome.Text = "Account";
                lblWelcome.Font.Bold = true;
                lblName.Font.Bold = true;
                lblcart.Text = Session["Cart"].ToString();
            }
            else
            {
                lblLog.Text = "Login";
            }
        }
        else
        {
            lblWelcome.Text = "My Account";
            lblLog.Text = "Login";
        }
    }
    protected void btnShopCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addcart.aspx?Param=" + Session["CustomerID"].ToString(), false);
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        if (lblLog.Text == "Logout")
        {
            Session["CustomerID"] = "";
            Session["sesUserID"] = "";
            Response.Redirect("index.aspx", false);
        }
        else
        {
            Response.Redirect("Login.aspx", false);
        }
    }
}