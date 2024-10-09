<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> Login</title> <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
   <%-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>--%>
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
                        <li><a href="../index.aspx">Home</a></li>
                       <%-- <li><a href="/e-shopping/about.html">About</a></li>
                         <li><a href="/e-shopping/delivery.html">Delivery</a></li>
                        <li><a href="/e-shopping/news.html">News</a></li>
                        <li><a href="/e-shopping/contact.html">Contact</a></li>--%>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <%--  <div class="search_box">
                    <form>
                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input
                        type="submit" value="">
                    </form>
                </div>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>
                                Admin Login</h2>
                            <div>
                                <span>
                                    <label>
                                        UserID</label></span> <span>
                                            <asp:TextBox ID="txtUserID" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Password</label></span> <span>
                                            <asp:TextBox ID="txtPassword" runat="server" class="textbox" TextMode="Password"
                                                Font-Bold="true" Font-Names="Arial"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_OnClick" class="myButton" /></span><asp:Label
                                        ID="lblStatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <%--  <div class="contact_info">
                            <h3>
                                Find Us Here</h3>
                            <div class="map">
                                <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0"
                                    marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed">
                                </iframe>
                                <br>
                                <small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
                                    style="color: #666; text-align: left; font-size: 12px">View Larger Map</a></small>
                            </div>
                        </div>--%>
                            <div class="company_address">
                            <h3>
                                Company Information :</h3>
                            <strong><h4>
                                Silver Star Fish Trading </h4></strong>
                            <p>
                                No 160, A4 , First floor, Retaj building </p>
                            <p>
                                Near by Vegetable Market.</p>
                            <p>
                                Doha, Qatar</p>
                            <p>
                                Phone: +974  33332768, +974 33381484</p>
                            <%--<p>
                                     &nbsp;&nbsp;&nbsp;:</p>--%>
                            <p>
                                Email: <span>Ssfishtrading@gmail.com</span></p>
                            <!-- <p>
                                Web: <span>www.e-serbadk.com</span></p>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <%--<div class="wrap">
            <div class="section group">
                <div class="col_1_of_4 span_1_of_4">
                    <h4>
                        Information</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="#">Advanced Search</a></li>
                        <li><a href="ReturnsPolicy.aspx">Return and Refund</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>
                        Why buy from us</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="Privacy.html">Privacy Policy</a></li>
                        <li><a href="contact.html">Site Map</a></li>
                         <li><a href="FAQ.html">FAQ</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>
                        My account</h4>
                    <ul>
                        <li><a href="contact.html">Sign In</a></li>
                        <li> <a href="index.aspx">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="contact.html">Help</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>
                        Contact</h4>
                    <ul>
                        <li><span>1-300-888-225</span></li>
                        <%--<li><span>+00-123-000000</span></li>
                    </ul>
                    <div class="social-icons">
                        <h4>
                            Follow Us</h4>
                        <ul>
                            <li><a href="#" target="_blank">
                                <img src="web/images/facebook.png" alt="" /></a></li>
                            <li><a href="#" target="_blank">
                                <img src="web/images/twitter.png" alt="" /></a></li>
                            <li><a href="#" target="_blank">
                                <img src="web/images/skype.png" alt="" />
                            </a></li>
                            <li><a href="#" target="_blank">
                                <img src="web/images/dribbble.png" alt="" /></a></li>
                            <li><a href="#" target="_blank">
                                <img src="web/images/linkedin.png" alt="" /></a></li>
                            <div class="clear">
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="copy_right">
            <p>
                EasyBuyBye © All rights Reseverd
            </p>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html> 