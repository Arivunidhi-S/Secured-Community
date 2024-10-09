using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Response : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("MerchantCode : " + Request.Form["MerchantCode"] + "<br>");
        Response.Write("PaymentId : " + Request.Form["PaymentId"] + "<br>");
        Response.Write("RefNo : " + Request.Form["RefNo"] + "<br>");
        Response.Write("Amount : " + Request.Form["Amount"] + "<br>");
        Response.Write("eCurrency : " + Request.Form["Currency"] + "<br>");
        Response.Write("Remark : " + Request.Form["Remark"] + "<br>");
        Response.Write("TransId : " + Request.Form["TransId"] + "<br>");
        Response.Write("AuthCode : " + Request.Form["AuthCode"] + "<br>");
        Response.Write("eStatus : " + Request.Form["Status"] + "<br>");
        Response.Write("ErrDesc : " + Request.Form["ErrDesc"] + "<br>");
        Response.Write("Signature : " + Request.Form["Signature"]);

    }
}