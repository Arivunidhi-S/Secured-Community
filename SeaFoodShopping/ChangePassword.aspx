<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

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
                    <ul>
                        <li><a href="AccontInfo.aspx">My Account</a></li>
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
                <div class="logo">
                     <a href="index.aspx">
                        <img src="web/images/logo.png" alt="" /></a> <img src="web/images/malaysia.jpg" width="400px" height="70px" style="left:110px;position:relative" alt="" />
                </div>
                <%-- <div class="cart">
                    <p>
                        Welcome to our Online Store! <span>Cart:</span>
                        <div  class="wrapper-dropdown-2">
                           Sell
                            <ul class="dropdown">
                                <li>My Account</li>
                            </ul>
                        </div>
                    </p>
                </div>--%>
                <script type="text/javascript">
                    function DropDown(el) {
                        this.dd = el;
                        this.initEvents();
                    }
                    DropDown.prototype = {
                        initEvents: function () {
                            var obj = this;

                            obj.dd.on('click', function (event) {
                                $(this).toggleClass('active');
                                event.stopPropagation();
                            });
                        }
                    }

                    $(function () {

                        var dd = new DropDown($('#dd'));

                        $(document).click(function () {
                            // all dropdowns
                            $('.wrapper-dropdown-2').removeClass('active');
                        });

                    });

		</script>
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
                    <div class="col span_2_of_2">
                   
                        <div class="contact-form">
                            <h2>
                                Change Password</h2>
                            <div>
                                <span>
                                    <label>
                                        Name :</label></span> <span>
                                            <asp:Label ID="lblname" runat="server" Font-Size="14px" Text=""></asp:Label></span>
                            </div>
                            <div>
                                <span>
                                    <asp:Label ID="lblsysno" runat="server" Text="SysRegNo :" Font-Size="12px"></asp:Label></span>
                                <span>
                                    <asp:Label ID="lblsysregno" runat="server" Text="" Font-Size="14px"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact-form">
                            <br />
                             <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                              <div>
                                <span> <asp:Label ID="lblOldPassword" runat="server" Text="Enter Old Password" Font-Size="14px"></asp:Label>
                                   <%-- <label>
                                       Enter Old Password</label>--%></span> <span>
                                            <asp:TextBox ID="txtOldPassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                      Enter New Password</label></span> <span>
                                            <asp:TextBox ID="txtPassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Retype New Password</label></span> <span>
                                            <asp:TextBox ID="txtRetypePassword" runat="server" class="textbox" TextMode="Password"
                                                Font-Bold="true" Font-Names="Arial"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="btnSignin" runat="server" Text="Change Password" OnClick="btnChangePassword_OnClick"
                                        class="myButton" /></span>
                            </div>
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
