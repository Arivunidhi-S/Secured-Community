<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Preview.aspx.cs" Inherits="Preview" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products Preview</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta name="description" content="Online shopping website in Malaysia - Electronics,Fashion,Biscuits,Chocolates in wholesale price " />
    <meta name="keywords" content="shopping,online shopping,buy online,buy now,shop now,promotion,sale,fashion,electronics,men fashion,women fashion,grocery,kurtis,tops,sarees,punjabi dress,punjabi suit,salwar kameez,churidar,jacket,cap,round neck,polo,tshirt,t-shirt,laptop,mobile,phone,Lenovo,Asus,HP,Dell,wholesale,product,item,chocolate,biscuit,cookies,tudung,shawls,Denim,Crepe,Cotton,hairgel,chipsmore,jacobs,bake,tudor,tango,kandos,travel,travelloc,travel lock,easybuybye" />
    <%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/flexslider.css" type="text/css" media="all" />
    <link href="web/css/Radio.css" rel="stylesheet" type="text/css" media="all" />
    <%--<script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>--%>
    <script src="web/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="web/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/global.css" />
    <link rel="stylesheet" href="web/css/ForPreview.css" />
    <link rel="stylesheet" href="css/rating.min.css" />
    <style type="text/css">
     .lblfont
        { font-family: 'ambleregular'; src:url(../font/Amble-Regular-webfont.ttf) format('truetype');" } 
        
    }
    </style>
    <%--<script src="web/js/slides.min.jquery.js" type="text/javascript"></script>--%>
    <script type="text/javascript">

        function checkDec(el) {
            var ex = /^[0-9]+\.?[0-9]*$/;
            if (ex.test(el.value) == false) {
                el.value = el.value.substring(0, el.value.length - 1);
            }
        }

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));

        function fbs_click() {
            u = location.href; t = document.title; window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=626,height=436');
            return false;
        }
        function twi_click() {
            u = location.href; t = document.title; window.open('https://twitter.com/intent/tweet?original_referer=' + encodeURIComponent(u) + '&url=' + encodeURIComponent(u), 'sharer', 'toolbar=0,status=0,width=626,height=436');
            return false;
        }

        //$("input[name='cboQuantity']").keydown(function (event) {
        //         event.preventDefault();
        //         return false;
        //     });
        function OnClientLoad(sender) {
            sender.get_inputDomElement().readOnly = "true";
        }
       
    </script>
    <script type="text/javascript">
        function winOpen() {
            var Mleft = (screen.width / 2) - (650 / 2);
            var Mtop = (screen.height / 2) - (650 / 2);
            window.open(document.getElementById("param1").value, null, 'width=650,height=550,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,resizable=no,top=' + Mtop + ', left=' + Mleft + '');
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
                        <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span> <asp:TextBox CssClass="txtsearch" ID="txtsearch" runat="server" placeholder="Search at Fishmarket"
                            onkeyup="checkchar(this);"></asp:TextBox>
                        <asp:ImageButton ImageUrl="images/Search.png" ID="btnSearch" runat="server" Text="Search"
                            CssClass="btnSearch" OnClick="btnSearch_OnClick" /></p>
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
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">
                            <asp:Label ID="lblLog" runat="server" Text="" Style="font-size: small"></asp:Label></a></li>
                    </ul>
                </div>
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <asp:HiddenField ID="hdqnty" runat="server" />
                <div id='cssmenu' class="lblfont">
                   <ul>
                        <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                           { %>
                        <li class="has-sub"><a href='BasicCategory.aspx?Param=<%= dtMenuItems.Rows[a][0].ToString()%>'><span>
                            <%= dtMenuItems.Rows[a][3].ToString()  %></span></a>
                            <ul>
                                <% dtSubMenuItems = BusinessTier.getSubMenuItems(dtMenuItems.Rows[a][0].ToString());
                                   int h;

                                   for (h = 0; h < dtSubMenuItems.Rows.Count; h++)
                                   { %>
                                <li class="has-sub"><a href='Products.aspx?Param=<%= dtSubMenuItems.Rows[h][2].ToString()%>&Param1=0'>
                                    <span>
                                        <%= dtSubMenuItems.Rows[h][0].ToString()%>
                                    </span></a></li>
                                <% } %>
                            </ul>
                        </li>
                        <% } %>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="product-details">
                        <table width="100%" style="padding-top: -30px; margin-left: -25px; border: 1px">
                            <tr>
                                <td align="center" style="width: 35%; vertical-align: top;">
                                    <div class="">
                                        <a href="javascript:;" onclick="winOpen()" class="lblfont">
                                            <img src="<%= dtPreview.Rows[0][0].ToString()%>" data-imagezoom="true" height="450"
                                                width="300" class="effect2" alt="" /><br />
                                            <br />
                                            Click to Enlarge Images</a>
                                        <input type="hidden" runat='server' id="param1" value="" />
                                    </div>
                                </td>
                                <td style="vertical-align: top; width: 48%;">
                                    <div class="col span_2_of_9">
                                        <h2>
                                            <%= dtPreview.Rows[0][5].ToString()%>&nbsp;
                                            <%= dtPreview.Rows[0][6].ToString()%>
                                            <%--  <%= dtPreview.Rows[0][14].ToString()%>&nbsp;
                                            (<%= dtPreview.Rows[0][5].ToString()%>)--%>
                                        </h2>
                                        <asp:Label runat="server" CssClass="ico_discount" ID="lblDiscount"></asp:Label><asp:Label
                                            runat="server" ID="lblshipping" Text="Free Shipping" class="lblfont" Style="position: relative;
                                            display: inline-block; top: 0; right: 0; margin: 16px 0 0 12px; padding-top: 12px;
                                            color: #00C31A; font-size: 19px; text-align: center; vertical-align: top;"></asp:Label>
                                        <div class="price">
                                            <p>
                                                Price: <span>
                                                    <asp:Label runat="server" ID="lblprice" Font-Size="24px"></asp:Label>&nbsp;<asp:Label
                                                        runat="server" ID="lblDiscountPrice" Font-Size="30px"></asp:Label>
                                                </span>&nbsp;&nbsp;&nbsp; <a class="lblfont" href="#about" data-hover="ABOUT">(View
                                                    Product Details)</a><br />
                                                <%--(GST Included)--%>
                                            </p>
                                        </div>
                                        <div class="available">
                                            <p class="lblfont">
                                                Available : </p> 
                                            <ul>
                                                <li>
                                                    <telerik:RadComboBox ID="cboColor" runat="server" Width="100px" OnItemsRequested="cboColor_OnItemsRequested"
                                                        DataValueField="Dept_ID" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                        EmptyMessage="Color" AutoPostBack="true" Visible="false">
                                                        <Items>
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </li>
                                                <li>
                                                    <asp:Label runat="server" ID="lblsize" Text="Size:"></asp:Label>
                                                    <telerik:RadComboBox ID="cboSize" runat="server" Width="100px" OnItemsRequested="cboSize_OnItemsRequested"
                                                        DataValueField="Dept_ID" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                        EmptyMessage="Size" AutoPostBack="true" OnClientLoad="OnClientLoad">
                                                        <Items>
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </li>
                                                <li>
                                                    <table width="100%" style="margin-top: -40px;">
                                                        <tr>
                                                            <td style="width: 43%">
                                                            </td>
                                                            <td align="center" style="width: 30%">
                                                                <p class="lblfont">
                                                                    Need Cutting :</p>
                                                            </td>
                                                            <td style="width: 30%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="">
                                                                    <label class="lblfont">Quantity:
                                                                    </label>
                                                                    <asp:TextBox ID="cboQuantity" runat="server" Width="70px" Height="20px" Font-Size="14px"
                                                                        Font-Bold="true" BorderStyle="Solid" Style="border-color: #00C31A; padding-left: 5px;"
                                                                        onkeyup="checkDec(this);" placeholder="EnterQty"></asp:TextBox>(In kgs)
                                                                </div>
                                                            </td>
                                                            <td align="center" style="border:0px;border-style:solid;border-color:#00af31 " >
                                                                <div >
                                                                    <asp:RadioButtonList ID="rdCutting" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Text="Yes&nbsp&nbsp&nbsp;" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                            </td>
                                                            <td valign="bottom">
                                                                <asp:Button CssClass="enjoy-css" Style="margin-top: 0px;" ID="button" runat="server"
                                                                    Text="Add to Cart" OnClick="btnAddCart_OnClick" />
                                                            </td>
                                                           
                                                        </tr>
                                                         <tr align="left"><td colspan="3"> <p class="lblfont" style="padding-top:8px">
                                                        <asp:Label runat="server" ID="Label1" ForeColor="#0076fb" Font-Size="12px" Text="(Enter quantity for ¼ kg = 0.250, ½ kg = 0.500, ¾ kg = 0.750, 1 kg = 1)"></asp:Label></p> </td></tr>
                                                         <tr align="center"><td colspan="3"> <p class="lblfont">
                                                        <asp:Label runat="server" ID="lblstatus" ForeColor="Red" Font-Size="14px"></asp:Label></p> </td></tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                        <div style="margin-top: -30px;" class="contact-form">
                                            <div class="share">
                                                <p class="lblfont">
                                                    Share Product :</p>
                                                <ul>
                                                    <li><a href="" onclick="return fbs_click()" target="_blank">
                                                        <img src="web/images/facebook.png" alt="" /></a></li>
                                                    <li><a href="" onclick="return twi_click()" target="_blank">
                                                        <img src="web/images/twitter.png" alt="" /></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                        </div>
                                        <div style="margin-top: -30px;" class="wish-list">
                                            <ul>
                                                <li class="wish"><a id="A1" href="#" runat="server" onserverclick="btnAddWishlist_OnClick">
                                                    Add to Wishlist</a></li>
                                            </ul>
                                        </div>
                                        <div>
                                           
                                        </div>
                                    </div>
                                </td>
                                <td style="vertical-align: top; float: right;">
                                    <div class="col span_2_of_2">
                                        <div class="categories">
                                            <h3>
                                                My Account</h3>
                                            <div id=''>
                                                <ul class="lblfont">
                                                    <li class='active'><a href="AccontInfo.aspx"><span>My Account</span></a> </li>
                                                    <li class='active'><a href="OrderDetails.aspx"><span>My Orders</span></a></li>
                                                    <li class='active'><a href="AddWishlist.aspx"><span>My Wishlist</span></a> </li>
                                                    <li class='active'><a href="AddressBook.aspx"><span>My Address Book</span></a></li>
                                                    <li class='active'><a href="Feedback.aspx"><span>My Feedback</span></a> </li>
                                                    <%--   <li class='active'><a href='#'><span>Change Password</span></a></li>--%>
                                                </ul>
                                            </div>
                                            <%--<h3 style="background-color: Blue">
                                                Shop Now</h3>
                                            <div id='cssmenu'>
                                                <ul>
                                                    <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                                                       { %>
                                                    <li class='active'><a href='Products.aspx?Param=<%= dtMenuItems.Rows[a][1].ToString()%>&Param1=0'>
                                                        <span>
                                                            <%= dtMenuItems.Rows[a][3].ToString()%></span></a> </li>
                                                    <% } %>
                                                </ul>
                                            </div>--%>
                                        </div>
                                        <br />
                                        <%-- Facebook Like button--%>
                                        <div class="fb-page" data-href="https://www.facebook.com/arivunidhis" data-width="200"
                                            data-hide-cover="false" data-show-facepile="false" data-show-posts="false">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="product_desc" id="about">
                        <div id="horizontalTab">
                            <ul class="resp-tabs-list">
                                <li><strong style="font-weight: bold">Product Details</strong></li>
                                <div class="clear">
                                </div>
                            </ul>
                            <p style="font-size: 0.8em; background-color: #ededed; padding: 5px 5px 5px 30px;
                                color: #000; line-height: 1.8em; font-family: verdana, arial, helvetica, helve, sans-serif;">
                                <%= dtPreview.Rows[0][9].ToString()%>
                            </p>
                            <br />
                            <div style="text-align: center;">
                                <% 
                                    if (!(string.IsNullOrEmpty(dtPreview.Rows[0][0].ToString())))
                                    { %>
                                <img src="<%= dtPreview.Rows[0][0].ToString()%>" alt="" />
                                <% } %><br />
                                <% 
                                    if (!(string.IsNullOrEmpty(dtPreview.Rows[0][1].ToString())))
                                    { %>
                                <img src="<%= dtPreview.Rows[0][1].ToString()%>" alt="" />
                                <% } %><br />
                                <% 
                                    if (!(string.IsNullOrEmpty(dtPreview.Rows[0][2].ToString())))
                                    { %>
                                <img src="<%= dtPreview.Rows[0][2].ToString()%>" alt="" />
                                <% } %><br />
                                <% 
                                    if (!(string.IsNullOrEmpty(dtPreview.Rows[0][3].ToString())))
                                    { %>
                                <img src="<%= dtPreview.Rows[0][3].ToString()%>" alt="" />
                                <% } %><br />
                                <% 
                                    if (!(string.IsNullOrEmpty(dtPreview.Rows[0][4].ToString())))
                                    { %>
                                <img src="<%= dtPreview.Rows[0][4].ToString()%>" alt="" />
                                <% } %>
                            </div>
                            <% if (!(dtProductReview.Rows.Count == 0))
                               { %>
                            <div class="review">
                                <div class="your-review">
                                    <%   
                                   int dtPR = 0;
                                   for (dtPR = 0; dtPR < dtProductReview.Rows.Count; dtPR++)
                                   { %>
                                    <h4>
                                        Review by
                                        <%= dtProductReview.Rows[dtPR][2].ToString().Trim()%></h4>
                                    <ul>
                                        <li>Rating :<img src="images/star<%= dtProductReview.Rows[dtPR][1].ToString().Trim()%>.png"
                                            alt="" /></li>
                                        <li>
                                            <%= dtProductReview.Rows[dtPR][3].ToString().Trim()%></li>
                                        <%--<li>Quality :<a href="#"><img src="images/quality-rating.png" alt="" /></a></li>--%>
                                    </ul>
                                    <p>
                                        <%= dtProductReview.Rows[dtPR][4].ToString().Trim()%></p>
                                    <hr style="border: 0; height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
                                    <% 
                                   }
                               }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
