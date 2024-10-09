<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delivery.aspx.cs" Inherits="Delivery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
                        <li><a href="AboutUs.aspx">About</a></li>
                        <li class="active"><a href="Delivery.aspx">Delivery</a></li>
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
                <div class="section group">
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img1.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img2.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/delivery-img3.jpg" alt="" />
                    </div>
                </div>
                <div class="news_desc1">
                    <h3>
                        Delivery</h3>
                    <p>
                        TThe shipping and delivery process in Fish Market is done by our delivery team in
                        time. After the customer has successfully placed the order, our Customer Service
                        team will conduct a verification process upon the order and update as soon as possible
                        by email to the customer. After the verification of the order, the item will be
                        shipped to customer’s address.
                    </p>
                    <p>
                        We provide free delivery with in Qatar. The deliveries will be made on all days
                        (including weekdays & weekends). Fish Market will deliver the shipment all over
                        Qatar and we are unable to do international delivery at the moment. The delivery
                        will take 30 mins to 2 hours based on the area to be delivered.
                    </p>
                    <p>
                        Due to the perishable nature of the goods, physical returns are not allowed and
                        cannot be accepted. But fish market makes sure that we deliver the product under
                        customer satisfaction. And also the order cannot be cancelled once it is shipped
                        to the customer.
                    </p>
                    <p>
                        For any questions or feedback, please contact our Customer Service and we will try
                        our level best to respond to your inquiry within 12 hours.</p>
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
