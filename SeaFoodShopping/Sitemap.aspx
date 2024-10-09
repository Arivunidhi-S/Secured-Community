﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="Sitemap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Site Map </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <style type="text/css">
        a:link, a:visited
        {
            color: #B81D22;
        }
        a:hover
        {
            color: #666;
        }
        h1
        {
            background-color: #fff;
            padding: 20px;
            color: #00AEEF;
            text-align: left;
            font-size: 32px;
            margin: 0px;
        }
        h3
        {
            font-size: 12px;
            background-color: #B8DCE9;
            margin: 0px;
            padding: 10px;
        }
        th
        {
            text-align: center;
            background-color: #00AEEF;
            color: #fff;
            padding: 4px;
            font-weight: normal;
            font-size: 12px;
        }
        td
        {
            font-size: 12px;
            padding: 3px;
            text-align: left;
        }
        tr
        {
            background: #fff;
        }
        tr:nth-child(odd)
        {
            background: #f0f0f0;
        }
        
        .lpart
        {
            background-color: #f0f0f0;
            padding: 0px;
        }
        .lpage
        {
            font: normal 12px verdana;
        }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="headertop_desc">
                <div class="call">
                    <p>
                        <span>Need help?</span> call us <span class="number">1-300-888-225 </span>
                    </p>
                </div>
                <div class="account_desc">
                    <ul>
                        <li><a href="AccontInfo.aspx">
                            <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small"></asp:Label>
                            <asp:Label ID="lblWelcome" runat="server" Text="" Style="font-size: small"> </asp:Label></a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                         <li><a id="btnShopCart" onserverclick="btnShopCart_Click" runat="server">
                             <img src="images/cart.png" alt="" style="top: 5px; position: relative; width: 18px;
                                height: 18px;" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
               <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server" href="Login.aspx">
                            <asp:Label ID="lblLog" runat="server" Text="" Style="font-size: small"></asp:Label></a></li>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <div class="logo">
                    <a href="index.aspx">
                        <img src="web/images/logo.png" alt="" /></a>
                    <img src="web/images/malaysia.jpg" width="400px" height="70px" style="left:110px;position:relative"
                        alt="" />
                         <div class="social">
						  <a href="https://www.facebook.com/Easybuybye-151955558610155/" target="_blank" class="icon fb"><img class="imgalign" src="images/f.png" alt=""/></a>
						  <a href="https://twitter.com/easybuybye" target="_blank" class="icon tw"><img class="imgalign" src="images/t.png" alt=""/></a>
						  <a href="https://plus.google.com/115499738327775097465" target="_blank" class="icon gp"><img class="imgalign" src="images/g.png" alt=""/></a>&nbsp;&nbsp;&nbsp;
                          <a href="https://www.linkedin.com/in/easybuybye-online-shopping-427335132" target="_blank" class="icon in"><img class="imgalign" src="images/in.png" alt=""/></a>
						</div>
                </div>
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
                <div class="image group">
                    <div class="news_desc1">
                        <h3>
                            Site Map
                        </h3>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr valign="top">
                                <td class="lpart" colspan="100">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/index.aspx" title="Home">Home </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Login.aspx" title="Login">Login</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/SellatEBB.aspx" title="Sell SeaFood">Sell At
                                                    EasyBuyBye </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/CustomerMaster.aspx" title="Register">Register
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/AboutUs.aspx" title="AboutUs">AboutUs </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Delivery.aspx" title="Delivery">Delivery </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/News.aspx" title="News">News </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Contact.aspx" title="Contact">Contact </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=18&Param1=0" title="Laptops">
                                                    Laptops </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=28&Param1=0" title="Mobiles">
                                                    Mobile Phones </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=25&Param1=0" title="Chocolates">
                                                    Chocolates </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=23&Param1=0" title="MenT-shirt">
                                                    Men's T-shirt </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=26&Param1=0" title="MenAccessories">
                                                    Men Accessories </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=29&Param1=0" title="TravelAccessories">
                                                    Travel Accessories </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=21&Param1=0" title="WomenWestern">
                                                    Women Western </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=24&Param1=0" title="WomenT-shirts">
                                                    Women's T-shirts </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Products.aspx?Param=27&Param1=0" title="WomenAccessories">
                                                    Women Accessories </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/ReturnsPolicy.aspx" title="Return &amp; Refund Policy ">
                                                    Return & Refund Policy </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/Privacy.aspx" title="Privacy Policy">Privacy Policy
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lpage">
                                                <a href="http://www.easybuybye.com/FAQ.aspx" title="FAQ">FAQ </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
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
