<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReturnsPolicy.aspx.cs" Inherits="ReturnsPolicy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<head>
    <title>Return & Refund Policy </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <style>
        table.Rightborders td
        {
            height: 30px;
            width: 150px;
            vertical-align: middle;
            text-align: center;
            margin-top: 10px;
            border-width: 1px;
            border-style: solid;
            border-color: Black;
            font-size: 14px;
            padding: 2px 2px 2px 2px;
        }
    </style>
</head>
<body oncontextmenu="return false;">
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
                <div class="logo">
                    <a href="index.aspx">
                        <img src="web/images/logo.png" alt="" /></a>
                    <img src="web/images/malaysia.jpg" width="400px" height="70px" style="left: 110px;
                        position: relative" alt="" />
                    <div class="social">
                        <a href="https://www.facebook.com/Easybuybye-151955558610155/" target="_blank" class="icon fb">
                            <img class="imgalign" src="images/f.png" alt="" /></a> <a href="https://twitter.com/easybuybye"
                                target="_blank" class="icon tw">
                                <img class="imgalign" src="images/t.png" alt="" /></a> <a href="https://plus.google.com/115499738327775097465"
                                    target="_blank" class="icon gp">
                                    <img class="imgalign" src="images/g.png" alt="" /></a>&nbsp;&nbsp;&nbsp;
                        <a href="https://www.linkedin.com/in/easybuybye-online-shopping-427335132" target="_blank"
                            class="icon in">
                            <img class="imgalign" src="images/in.png" alt="" /></a>
                    </div>
                </div>
                <!-- <div class="cart">
			  	   <p>Welcome to our Online Store! <span>Cart:</span><div id="dd" class="wrapper-dropdown-2"> 0 item(s) - $0.00
			  	   	<ul class="dropdown">
							<li>you have no items in your Shopping cart</li>
					</ul></div></p>
			  </div>
			  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>-->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <div class="menu">
                    <!-- #Include file="IncludeMenu.html" -->
                </div>
                <!--	<div class="search_box">
	     		<form>
	     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
	     		</form>
	     	</div>-->
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="image group">
                    <%--         <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg1.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg2.jpg" alt="" />
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <img src="web/images/newsimg3.jpg" alt="" />
                    </div>--%>
                    <div class="news_desc1">
                        <h3>
                            Return & Refund Policy
                        </h3>
                        <strong>Returns</strong>
                        <p>
                            Due to the perishable nature of the goods, physical returns are not allowed and
                            cannot be accepted. But fish market makes sure that we deliver the product under
                            customer satisfaction.
                        </p>
                        <%--<p>
                            1. Check the validity of the return policy.<br />
                            2. Fill in the return forms & print or copy the shipping label.<br />
                            3. Pack the product and attach the shipping label to packing.<br />
                            4. Drop of at our courier partner nearby your area or contact EasyBuyBye for assistance.<br />
                            5. Now we can process customer's replacement and inform them accordingly through
                            email or phone.
                        </p>
                        <h4>
                            <strong>Return Policy</strong>
                        </h4>
                        <p>
                            1. Return of the product should be done within 3 days of the delivery.<br />
                            2. Replacement of the product does not implement to products from overseas supplier.<br />
                            3. For drop off at Collection outlets, package size accepted must not exceed 35
                            cm (L) x 35 cm (W) x 35 cm (H) and weigh less than 10 Kgs.
                        </p>
                        <h4>
                            <strong>Requirements for a valid return</strong>
                        </h4>
                        <p>
                            Proof of product’s purchase (order number, invoice etc.)<br />
                            Bank details in Shipping Label if the original payment is made via payment gateway.<br />
                            Include printed Shipping Label and EasyBuyBye Tax Invoice in each return package
                            box.<br />
                            Valid reason for the product return should be met.
                        </p>
                        <h4>
                            <strong>Valid Reasons</strong>
                        </h4>
                        <p>
                            Wrong product delivery Damaged Product<br />
                            Defective or Poor Quality<br />
                            Product does not fix (not applicable for fashion products from overseas suppliers)<br />
                            Customer change mind (not applicable for products from overseas suppliers)<br />
                            Does not meet customer's expectations<br />
                            Wrong content from website's description
                        </p>
                        <br />
                        <p>
                            Note:<br />
                            Returns are not applicable for all under garments sold. This is due to hygiene purposes.<br />
                            In case that of you have received damaged products, please contact EasyBuyBye within
                            48 hours to expedite the claim process.
                        </p>--%>
                        <br />
                        <strong>Refund</strong>
                        <p>
                            Refund can be processed in case of order cancellation. But we request customer to
                            make cancellation before shipping. After shipping cancellation is not possible because
                            we are delivering fish and other sea food products.
                        </p>
                        <p>
                            We will update you via email once your refund has been initiated. You will be able
                            to see the credited amount on your statement as per the lead time listed in the
                            table below for each of the refund methods.
                        </p>
                        <p>
                            If the refund does not arrive after the next two months’ statements, please contact
                            your issuing bank or Fish Market directly (or) through email for support.
                        </p>
                        <br />
                        <table width="100%" border="1" cellpadding="3" class="Rightborders">
                            <tr>
                                <td width="25%" style="font-weight: bold;">
                                    Payment Method (during purchase)
                                </td>
                                <td width="25%" style="font-weight: bold;">
                                    Refund Method
                                </td>
                                <td width="25%" style="font-weight: bold;">
                                    FishMarket processing time (after cancellation has been checked)
                                </td>
                                <td width="25%" style="font-weight: bold;">
                                    Bank processing Time (after refund has been processed by FishMarket)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Credit card/Debit card
                                </td>
                                <td>
                                    Credit card
                                </td>
                                <td>
                                    1 - 3 working days
                                </td>
                                <td>
                                    5 - 15 working days (depending on your bank)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Bank transfer
                                </td>
                                <td>
                                    Qpay reversal refund
                                </td>
                                <td>
                                    1 - 3 working days
                                </td>
                                <td>
                                    5 – 14 working days (depending on your bank)
                                </td>
                            </tr>
                        </table>
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
</body>
</html> 