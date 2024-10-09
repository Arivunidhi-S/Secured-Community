<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Privacy.aspx.cs" Inherits="Privacy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Privacy Policy </title>
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
                            Privacy Policy
                        </h3>
                        <!--<h4>Posted on Aug 13th, 2013 by <span><a href="#">Finibus Bonorum</a></span></h4>-->
                        <p>
                            According to Personal Data Protection Act of Qatar which was introduced by government
                            to process personal data in commercial transactions, we are required to inform you
                            about your rights with respect of your personal data that we are collecting and
                            processed during registration and data processing respectively. We will only collect
                            information wherever it is necessary for us to do so and also if it is relevant
                            to our dealings with you. You can visit our website, www. fishmarket.com.qa and
                            browse without providing any of your personal details. During your visit to our
                            website, you may remain anonymous and at no time would we be able to identify you
                            unless you have registered an account (“Fish Market account”) with us on our website
                            and have logged on with your user name and password.
                        </p>
                        <%--      <p>
                            You can visit our website, www. EasyByeBuy.com and browse without providing any
                            of your personal details. During your visit to our website, you may remain anonymous
                            and at no time would we be able to identify you unless you have registered an account
                            (“EasyByeBuy account”) with us on our website and have logged on with your user
                            name and password.</p>
                        <p>
                            If you have any comments or suggestions, we would be very much pleased to receive
                            them at our Customer Service page.
                        </p>--%>
                        <p>
                            If you have any comments or suggestions, we would be very much pleased to receive
                            them at our Customer Service page. For your information, Fish Market do not sell
                            or trade the collected customer’s personal data with any third parties. The personal
                            information collected in online by Fish Market may include your below details:
                        </p>
                        <p>
                            <ul>
                                <li>• Name</li>
                                <%-- <li>• Delivery Address</li>--%>
                                <li>• Email Address</li>
                                <li>• Date of Birth</li>
                                <%-- <li>• IC No. (or) Passport No. (Optional)</li>--%>
                                <li>• Gender</li>
                                <li>• Telephone (or) Mobile Number</li>
                                <li>• Delivery Address</li>
                                <li>• Credit card details (if paid by Credit Card)</li>
                            </ul>
                        </p>
                        <p>
                            The customer’s personal information collected by Fish Market will be used and/ or
                            shared within our corporate group and also to the third parties to deliver the products
                            that you purchase from our website. For example, we may pass your name and address
                            on to a third party such as our Shipping (or) Courier Service Company or supplier
                            of your choice in order to make delivery of the product to you.
                        </p>
                        <p>
                            Fish Market also ensures that all the information collected by us will be safely
                            and securely stored. We protect your personal information by:
                        </p>
                        <p>
                            <ul>
                                <li>• Allowing access to personal information only through secured passwords.</li>
                                <li>• Maintaining technology products to prevent unauthorised user/computer access.</li>
                                <li>• Securely destroy your personal information when it is no longer needed for us.</li>
                              <%--  <li>• EasyBuyBye uses 128-bit SSL (Secure Sockets Layer) encryption technology when
                                    processing your financial details.</li>--%>
                            </ul>
                        </p>
                        <p>
                            Fish Market reserves the right to modify or change the Privacy Policy at any time.
                            Any changes to this policy will be published on our website. You should check this
                            Policy each time you access our website so as to be aware of the most recent updates
                            in the Policy. If you are not satisfied with the way in which we handle your enquiry
                            or complaint, please don't hesitate to contact Customer Service.
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
