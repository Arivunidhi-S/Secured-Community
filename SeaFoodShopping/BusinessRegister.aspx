<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusinessRegister.aspx.cs"
    Inherits="BusinessRegister" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Register </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
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
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                        <%--  <li><a href="SupplierRegister.aspx">SupplierRegister</a></li>
                        <li><a href="SellatEBB.aspx">SupplierLogin</a></li>
                        <li><a href="BusinessRegister.aspx">Business Register</a></li>--%>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <div class="logo">
                     <a href="index.aspx">
                        <img src="web/images/logo.png" alt="" /></a> <img src="web/images/malaysia.jpg" width="400px" height="70px" style="left:110px;position:relative" alt="" />
                </div>
                <div class="cart">
                    <p>
                        <%--Welcome to our Online Store! --%>
                        <%-- Welcome : <asp:Label ID="lblName"  runat="server" Text="" style="font-size:small"></asp:Label>--%>
                        <%-- <div id="dd" class="wrapper-dropdown-2">
                            0 item(s) - $0.00
                            <ul class="dropdown">
                                <li>you have no items in your Shopping cart</li>
                            </ul>
                        </div>--%>
                    </p>
                </div>
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
                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" /><input
                        type="submit" value="" />
                </div>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                 <h2>
                                Business Seller Membership Registration</h2>
                                <div style="text-align: center"><asp:Label Style="text-align: right" ID="lblStatus" runat="server" Text=""></asp:Label></div>

                                <div class="col span_2_of_7">
                        <div class="contact-form1">
                          <h3 style="color: Blue;">
                                Seller Information</h3>
                           
                            <hr />
                            <div>
                                <span>
                                    <label>
                                        Company Name</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtBusinessname" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Business Registration Number</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtRegno" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Contact Name</label>
                                <label style="color: Red;">
                                    *</label></span>
                                <span>
                                    <asp:TextBox ID="txtName" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        IC No/Passport Number</label><%--<label style="color: Red;">
                                            *</label>--%></span> <span>
                                                <asp:TextBox ID="txtICnumber" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Contact Number</label></span> <span>
                                            <asp:TextBox ID="txtContact" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Email
                                    </label>
                                </span><span>
                                    <asp:TextBox ID="txtEmail" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Address</label></span> <span>
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="textbox"></asp:TextBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        State
                                    </label>
                                </span><span>
                                    <asp:TextBox ID="txtState" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Postcode
                                    </label>
                                </span><span>
                                    <asp:TextBox ID="txtPostcode" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Password
                                    </label>
                                    <label style="color: Red;">
                                        *</label>
                                </span><span>
                                    <asp:TextBox ID="txtPassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        RetypePassword
                                    </label>
                                    <label style="color: Red;">
                                        *</label>
                                </span><span>
                                    <asp:TextBox ID="txtRetypePassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                            </div>
                           
                        </div>
                        </div>

                    <div class="col span_2_of_7">
                        <div class="contact-form1">
                           
                           
                          
                            <h3 style="color: Blue;">
                                Bank Account</h3>
                            <hr />
                            <div>
                                <span>
                                    <label>
                                        Bank</label></span> <span>
                                            <asp:TextBox ID="txtBank" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Account Holder's Name</label></span> <span>
                                            <asp:TextBox ID="txtAccountHolder" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Account no.</label></span> <span>
                                            <asp:TextBox ID="txtAccountno" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Branch Name</label></span> <span>
                                            <asp:TextBox ID="txtBranchName" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Settlement Method</label></span> <span>
                                            <asp:RadioButtonList ID="rdoButtonSettlementMethod" Enabled="true" RepeatDirection="Horizontal"
                                                Visible="true" AutoPostBack="false" ForeColor="Black" runat="server" Width="400px"
                                                Font-Size="Small">
                                                <asp:ListItem Text="Bank Transfer" Value="2" Selected="True" />
                                                <asp:ListItem Text="Seller Cash" Value="1" Selected="False" />
                                            </asp:RadioButtonList>
                                        </span>
                            </div>
                            <br />
                            <h3 style="color: Blue;">
                                Required Documents</h3>
                            <hr />
                            <div>
                                <span>
                                    <label>
                                        Copy of Representative MyKad/Passport</label></span> <span>
                                            <asp:FileUpload ID="FileDoc1" runat="server" class="textbox" /></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Copy of bank statement header or passbook</label></span> <span>
                                            <asp:FileUpload ID="FileDoc2" runat="server" class="textbox" /></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Copy of utilities bill header</label></span> <span>
                                            <asp:FileUpload ID="FileDoc3" runat="server" class="textbox" />
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Copy of form 9</label></span> <span>
                                            <asp:FileUpload ID="FileDoc4" runat="server" class="textbox" /></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Copy of form 49(not required for partnership company)</label></span> <span>
                                            <asp:FileUpload ID="FileDoc5" runat="server" class="textbox" /></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Copy of GST Approval form of Customs (optional)</label></span> <span>
                                            <asp:FileUpload ID="FileDoc6" runat="server" class="textbox" /></span>
                            </div>
                            <div>
                                <asp:Image ID="imgCaptcha" runat="server" />
                                <br />
                                <span>
                                    <label>
                                        Enter Code Below
                                    </label>
                                </span>
                                <asp:TextBox ID="txtCaptcha" runat="server" class="tb10" Width="100px"></asp:TextBox>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="btnbusinessregister" runat="server" Text="Register" class="myButton"
                                        OnClick="btnBusinessRegister_OnClick" /></span>
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
    <%--<a href="#" id="toTop"><span id="toTopHover"></span></a>--%>
    </form>
</body>
</html>
