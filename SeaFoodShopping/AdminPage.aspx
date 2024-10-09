<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AdminPage </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <style type="text/css">
        div.background
        {
            text-align: center;
            float: inherit;
            background-size: 100% 100%;
            position: static;
            width: 200px;
            height: 125px;
            border: 2px solid #00af31;
        }
        
        div.transbox
        {
            margin: 125px 0px 0px -2px;
            background-color: #ffffff;
            border: 2px solid #00af31;
            width: 200px;
            opacity: 0.9;
            filter: alpha(opacity=60); /* For IE8 and earlier */
        }
        
        div.transbox p, .link
        {
            z-index: 0;
            margin: 5%;
            font-weight: bold;
            color: #000000;
        }
    </style>
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script type="text/javascript" src="web/js/jquery.accordion.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#posts").accordion({
                header: "div.tab",
                alwaysOpen: false,
                autoheight: false
            });
        });
</script>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="headertop_desc">
                <div class="call">
                    <p>
                        <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
                </div>
                <div class="account_desc">
                    <ul>
                        <li><a id="A1" runat="server" cssclass="lblfont">Welcome :</a>
                            <asp:Label ID="lblName" runat="server" Style="font-size: small" CssClass="lblfont"></asp:Label></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">Logout</a></li>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <div class="menu">
                    <!-- #Include file="IncludeMenu.html" -->
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <table width="100%">
                        <tr align="center">
                            <td>
                                <div class="background" style="background-image: url(web/images/Category.png);">
                                    <div class="transbox">
                                        <p>
                                            <a href="web/CategoriesMaster.aspx?param=1" class="link">Category List</a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="background" style="background-image: url(web/images/add.jpg);">
                                    <div class="transbox">
                                        <p>
                                            <a href="MasterProduct.aspx" class="link">Add SeaFoods </a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="background" style="background-image: url(web/images/edit.jpg);">
                                    <div class="transbox">
                                        <p>
                                            <a href="MasterProductEdit.aspx" class="link">Edit SeaFoods </a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="background" style="background-image: url(web/images/AddEdit.jpg);">
                                    <div class="transbox">
                                        <p>
                                            <a href="ProductItemMaster.aspx" class="link">&#10010;/&#10003;Stock & Image</a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="background" style="background-image: url(web/images/Productlist.jpg);">
                                    <div class="transbox">
                                        <p>
                                            <a href="web/ProductView.aspx?param=1" class="link">Product List</a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <div class="background" style="background-image: url(web/images/OrderDetails.jpg);">
                                    <div class="transbox">
                                        <p>
                                            <a href="web/OrderView.aspx?param=1" class="link">Order List</a>
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
