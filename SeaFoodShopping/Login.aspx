<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> Login</title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
                    <ul> <li><a href="AccontInfo.aspx">My Account</a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                        <%--  <li><a href="SupplierRegister.aspx">SupplierRegister</a></li>
                        <li><a href="SellatEBB.aspx">SupplierLogin</a></li>
                        <li><a href="BusinessRegister.aspx">Business Register</a></li>--%>
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
                                User Login</h2>
                            <div>
                                <span>
                                    <label>
                                        EmailID</label></span> <span>
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
                                <asp:LinkButton runat="server" OnClick="btnForgetPassword_OnClick">Forget Password? </asp:LinkButton>
                              <%--  <a href="ForgetPassword.aspx" > </a>--%>
                                    <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_OnClick"
                                        class="myButton" /></span><asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
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
