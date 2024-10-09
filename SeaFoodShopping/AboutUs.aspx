<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AboutUs </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
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
                <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <li><a href="index.aspx">Home</a> </li>
                        <li class="active"><a href="AboutUs.aspx">About</a></li>
                        <li><a href="Delivery.aspx">Delivery</a></li>
                        <li><a href="News.aspx">News</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="image group">
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg1.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg2.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg3.jpg" alt="" />
                    </div>
                    <div class="news_desc1">
                        <h3>
                            About Us
                        </h3>
                        <!--<h4>Posted on Aug 13th, 2013 by <span><a href="#">Finibus Bonorum</a></span></h4>-->
                        <p>
                            Fish Market online shopping cart is operating from Doha, Qatar. Pioneering E-Commerce
                            in Qatar, Fish Market provides an easy and effortless fish & seafood buying experience
                            on their fingertips to the Qatar customers and in future planning to step-up as
                            the largest customer base in Middle East and other countries. The main objective
                            of Fish Market is to offer the best selection of quality seafood to our customers
                            to value for their money. Online Fish Market is a place for seafood lovers with
                            innumerable number of products across various categories seafood.
                        </p>
                         <p>
                            We will be constantly
                            expanding our product category range from time to time as our business grows. The
                            local and imported seafood products are available exclusively in Fish Market For
                            shopping in Fish Market, if you have computer and internet then you can shop from
                            anywhere and anytime. No more long queues to pay bill, no traffic jam, crowds or
                            parking charges in the markets or malls. Once ordered the product will reach your
                            door step within 2 hours as mentioned in our website. Understanding the importance
                            of customer’s safety and secured online shopping we provide secure payment options
                            with Credit Cards and Online banking transactions.
                        </p>
                        <p>
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
