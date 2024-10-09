<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SellatEBB.aspx.cs" Inherits="SellatEBB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sell SeaFood</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script type="text/javascript">
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
                    <!-- #Include file="IncludeMenu.html" -->
                </div>
            <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="news_desc1">
                        <h3>
                            Sell FishMarketQatar.com
                        </h3>
                        <!--<h4>Posted on Aug 13th, 2013 by <span><a href="#">Finibus Bonorum</a></span></h4>-->
                        <p>
                            FishMarketQatar, our newly launched e-commerce website in Qatar is now ready to join
                            hands with the potential suppliers of all category products. The suppliers are requested
                            to contact at <span><a href="#">supplier@fishmarket.com </a></span>with the details
                            of their company, products, person in-charge etc (or) just fill up the form below
                            and submit.
                        </p>
                        <p>
                            If you are supplier of any products which does not falls under the category existing
                            in our e-commerce website, we would like to inform you that if we are interested
                            on your products, we could create a new category for your products. Hence we encourage
                            any potential supplier to contact us regarding the supply of your products to our
                            growing e-commerce website.
                            <br />
                            <br />
                            Thank You
                            <br />
                            FishMarketQatar Team
                            <br />
                            Qatar<br />
                            <br />
                        </p>
                    </div>
                    <h3 style="padding-left: 0px; font-size: 1.5em; color: Black; font-family: 'ambleregular';
                        src: url(../font/Amble-Regular-webfont.ttf) format('truetype');">
                        Supplier Information</h3>
                    <div class="col span_1_of_3">
                        <div class="contact-form1">
                            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <div>
                                <span>
                                    <label>
                                        Company Name</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtCompanyName" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Contact Person</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtContactName" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Contact No</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtContactNo" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
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
                                        Website</label></span> <span>
                                            <asp:TextBox ID="txtWebsite" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <label>
                                        Company Address</label></span> <span>
                                            <asp:TextBox ID="txtCompanyAddress" runat="server" TextMode="MultiLine" Height="70px"
                                                class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Products to Supply</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtProductsSupply" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <br />
                                <asp:Image ID="imgCaptcha" runat="server" /></div>
                            <div>
                                <span>
                                    <label>
                                        Enter Code Below
                                    </label>
                                </span>
                                <asp:TextBox ID="txtCaptcha" runat="server" class="tb10" Width="100px"></asp:TextBox>
                            </div>
                            <div>
                                <span style="float:right;left:-100px;top:-38px;position:relative;">
                                    <asp:Button ID="btnsumit" runat="server" Text="Submit" OnClick="btnsumit_OnClick" />
                                    <%--<input type="submit" value="Submit" class="myButton">--%></span>
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
