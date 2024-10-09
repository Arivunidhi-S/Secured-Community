<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <%-- <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />--%>
    <style type="text/css">
        .enjoy-css
        {
            display: inline-block;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            cursor: pointer;
            padding: 7px 10px;
            border: 1px solid #03d164;
            font: normal 16px/normal Arial, Helvetica, sans-serif;
            color: rgba(255,255,255,0.9);
            -o-text-overflow: clip;
            text-overflow: clip;
            background: #03d164;
            -webkit-box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2);
            box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2);
            text-shadow: -1px -1px 0 rgba(15,73,168,0.66);
            -webkit-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            -moz-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            -o-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
        }
        
        .enjoy-css:hover
        {
            border: 1px solid #0c0a0a;
            background: #0c0b0b;
            -webkit-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            -moz-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            -o-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
        }
        
        .textbx
        {
            padding: 8px;
            display: block;
            width: 50%;
            border: 1px solid #03d164;
            background: none;
            outline: none;
            color: #222;
            font-size: 1em;
            font-family: Arial, Helvetica, sans-serif;
            -webkit-appearance: none;
        }
        label
        {
            font-size: 0.85em;
            padding: 10px 0;
            color: #666;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div>
    <br />
        <label>
            Enter your email id</label><br />
                <br /><span>
                    <asp:TextBox ID="txtEmail" runat="server" class="textbox" Width="250px" CssClass="textbx"></asp:TextBox>
                </span><br />
        <asp:Button ID="Button1" runat="server" Text="Change Password" CssClass="enjoy-css" OnClick="btnChangePassword_OnClick"/>
        <br /> <br />
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
