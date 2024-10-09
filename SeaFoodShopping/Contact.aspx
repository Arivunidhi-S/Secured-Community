<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
     <script type="text/javascript">


         function checkchar(el) {
             var ex = /^[a-zA-Z0-9-. ]*$/;
             if (ex.test(el.value) == false) {
                 el.value = el.value.substring(0, el.value.length - 1);
             }
         }

         function OnClientLoad(sender) {
             sender.get_inputDomElement().readOnly = "true";
         }
         function checkDec(el) {
             var ex = /^[0-9]+\.?[0-9]*$/;
             if (ex.test(el.value) == false) {
                 el.value = el.value.substring(0, el.value.length - 1);
             }
         }
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
                        <li><a href="Delivery.aspx">Delivery</a></li>
                        <li><a href="News.aspx">News</a></li>
                        <li class="active"><a href="Contact.aspx">Contact</a></li>
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
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>
                                Contact Us</h2>
                            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <form>
                            <div>
                                <span>
                                    <label>
                                        Name</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtContactName" runat="server" class="textbox"  onkeyup="checkchar(this);"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        E-mail</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtEmail" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Subject</label></span> <span>
                                            <asp:TextBox ID="txtSubject" runat="server" class="textbox"  onkeyup="checkchar(this);"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Message</label></span> <span>
                                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="100px" class="textbox"></asp:TextBox></span>
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
                                <span>
                                    <asp:Button ID="btnsumit" runat="server" Text="Submit" OnClick="btnsumit_OnClick" />
                                </span>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact_info">
                            <h3>
                                Find Us Here</h3>
                            <div class="map">
                                <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0"
                                    marginwidth="0" src="https://maps.google.com/maps?output=embed">
                                </iframe>
                            </div>
                        </div>
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
