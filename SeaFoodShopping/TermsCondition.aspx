<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TermsCondition.aspx.cs" Inherits="TermsCondition" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Terms & Condition </title>
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
                <div class="image group">
                    <div class="news_desc1">
                        <h3>
                            Terms and Conditions for <span><a href="Index.aspx">www.fishmarket.com.qa</a></span>
                        </h3>
                        <!--<h4>Posted on Aug 13th, 2013 by <span><a href="#">Finibus Bonorum</a></span></h4>-->
                        <p>
                            <span><a href="Index.aspx">www.fishmarket.com.qa</a></span> is operated from Doha
                            and owned by Fish Market, Qatar based fish supplier company, hereby identified as
                            “The Seller” To customers and entities residing in Qatar, hereby identified as “The
                            Client”.
                        </p>
                        <p>
                            By clicking the button “Add To Cart” and the "Buy Now", the Client makes a binding
                            order for the goods and or services listed in the order page. Due to the nature
                            of the goods, business model, logistics and extremely tight transit times, cancellations
                            are not possible after the Client has submitted his binding order.</p>
                        <p>
                            Immediately after receiving the order, the Seller sends the Order Acknowledgement
                            to the Client by email. The Sales agreement comes into force only when the Seller
                            confirms the dispatch of the goods via e-mail, or by delivering the goods.
                        </p>
                        <p>
                            The delivery shall only be performed to addresses in Qatar.
                        </p>
                        <p>
                            A standard delivery time for each order is within 30 mins to 2 hours.
                        </p>
                        <p>
                            If the Seller was not able to source all ordered goods, the Seller has the right
                            to cancel the order or perform partial deliveries. On the basis of partial deliveries
                            the Client does not bear any additional cost. Liability of the Seller for such cases
                            is excluded.
                        </p>
                        <p>
                            If the delivery of goods is not or not properly performed due to the fault of the
                            Client, the Seller can withdraw from the agreement and no further obligation will
                            remain between the Seller and the Client. Fault of the Client might include but
                            not limited to, providing a wrong delivery address and/or wrong phone number. The
                            Seller recommends the Client to check the accuracy of the Client information entered
                            to ensure smooth fulfilment.
                        </p>
                        <p>
                            The Seller can change the offer provided in the online shop at any time and without
                            notice. Due to the nature of the goods offered, slight deviations of the pictures
                            and product details might occur.
                        </p>
                        <p>
                            The Client can perform the payment by credit cards issued by Visa, MasterCard, a(or)
                            Online Banking (or) Cah On Delivery(COD).
                        </p>
                        <p>
                            The Client’s data is with the Seller in a safe port. The Seller has implemented
                            wherever possible high security levels and work with the most trusted service providers
                            . The Seller agrees to abide data protection regulations while processing the Client
                            data.
                        </p>
                        <p>
                            The Seller reserves the right to change the Terms & Conditions anytime. The most
                            updated and applicable Terms & Conditions can be found in the online shop or by
                            clicking Terms and Conditions.
                        </p>
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
