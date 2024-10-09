<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Products </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta name="description" content="Online shopping website in Malaysia - Electronics,Fashion,Biscuits,Chocolates in wholesale price " />
    <meta name="keywords" content="shopping,online shopping,buy online,buy now,shop now,promotion,sale,fashion,electronics,men fashion,women fashion,grocery,kurtis,tops,sarees,punjabi dress,punjabi suit,salwar kameez,churidar,jacket,cap,round neck,polo,tshirt,t-shirt,laptop,mobile,phone,Lenovo,Asus,HP,Dell,wholesale,product,item,chocolate,biscuit,cookies,tudung,shawls,Denim,Crepe,Cotton,hairgel,chipsmore,jacobs,bake,tudor,tango,kandos,travel,travelloc,travel lock,easybuybye" />
    <%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />--%>
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/slider.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script type="text/javascript">
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return; n = f.fbq = function () {
                n.callMethod ?
n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            }; if (!f._fbq) f._fbq = n;
            n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
            t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
        } (window,
document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '166416463867806'); // Insert your pixel ID here.
        fbq('track', 'PageView');

        function OnClientLoad(sender) {
            sender.get_inputDomElement().readOnly = "true";
        }
    </script>
    <style>
        .sold
        {
            float: right;
            display: inline-block;
            font-size: 0.9em;
            display: block;
            padding: 7px 5px;
            font-family: 'ambleregular';
            background: #c9c8c8;
            color: #000;
            text-decoration: none;
            outline: 0;
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
        }
        .sold:hover
        {
            text-shadow: 0px 0px 1px #000;
            background: #292929;
            color: #fff;
        }
        /* .forlink
        {
            color: #B81D22;
            text-decoration:none; 
        }
        .forlink:visited
        {
            color: #B81D22;
            text-decoration:none; 
        }
        .forlink:hover
        {
            color: #000;
        }*/
        
        a
        {
            color: #028741; /* original colour state*/
        }
        
        a:active
        {
            color: #028741;
        }
        
        a:hover
        {
            color: #000;
        }
        a[tabindex]:focus
        {
            color: #028741;
            outline: none;
        }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="headertop_desc">
                <div class="call">
                    <p>
                        <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span>
                        <asp:TextBox CssClass="txtsearch" ID="txtsearch" runat="server" placeholder="Search at Fishmarket"
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
            <div class="">
                <div id='cssmenu'>
                    <ul>
                        <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                           { %>
                        <li class="has-sub"><a href='BasicCategory.aspx?Param=<%= dtMenuItems.Rows[a][0].ToString()%>'>
                            <span>
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
                <%--  <div class="menu">
                    <!-- #Include file="IncludeMenu.html" -->
                </div>--%>
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <%--  <div class="search_box">
                   
                </div>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="content_top">
                    <div class="heading">
                        <h3>
                            <%--New Products--%>
                            <%= dtProductsItems.Rows[0][10].ToString().Trim()%>
                            <asp:Label ID="lblWholesale" runat="server" Text="(in Carton Box - Wholesale Price)"
                                Style="color: Red;" Font-Size="Smaller" Visible="false"></asp:Label>
                            &nbsp; &nbsp;
                            <telerik:RadComboBox ID="cboSize" runat="server" DataValueField="Dept_ID" CssClass="textbox"
                                EnableLoadOnDemand="true" AppendDataBoundItems="True" EmptyMessage="Select Size"
                                OnClientLoad="OnClientLoad" OnSelectedIndexChanged="cboSize_SelectedIndexChanged"
                                OnItemsRequested="cboSize_OnItemsRequested" AutoPostBack="true" Style="width: 150px"
                                Visible="false">
                                <Items>
                                    <%--<telerik:RadComboBoxItem Text="Select Products" Value="Select Products" />--%>
                                </Items>
                            </telerik:RadComboBox>
                            <telerik:RadComboBox ID="cboProducts" runat="server" DataValueField="Dept_ID" CssClass="textbox"
                                EnableLoadOnDemand="true" AppendDataBoundItems="True" EmptyMessage="Select Brands"
                                OnClientLoad="OnClientLoad" OnSelectedIndexChanged="cboProduct_SelectedIndexChanged"
                                OnItemsRequested="cboProduct_OnItemsRequested" AutoPostBack="true" Visible="false">
                                <Items>
                                    <%--<telerik:RadComboBoxItem Text="Select Products" Value="Select Products" />--%>
                                </Items>
                            </telerik:RadComboBox>
                        </h3>
                    </div>
                    <div class="see">
                        <p>
                            <a href="AllFish.aspx?Param=0">See all SeaFoods</a></p>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <% int aa = 0, aa1 = 0, s = 0, t = 0;
                   s = dtProductsItems.Rows.Count;
                   for (aa = 0; aa < dtProductsItems.Rows.Count; aa++)
                   {  %>
                <div class="section group">
                    <%   
                       s = s - aa1;
                       if (s > 4)
                       { t = 4; }
                       else
                       { t = s; }
                       for (int a = 0; a < t; a++)
                       { %>
                    <div class="grid_1_of_4 images_1_of_4">
                        <% 
                           if (dtProductsItems.Rows[aa][9].ToString() == "0")
                           { %>
                        <img src="<%= dtProductsItems.Rows[aa][3].ToString().Trim()%>" title="<%= dtProductsItems.Rows[aa][7].ToString()%>"
                            alt="" />
                        <% } %>
                        <% 
                           else
                           { %>
                        <a href="preview.aspx?Param=<%= dtProductsItems.Rows[aa][4].ToString().Trim()%>">
                            <img src="<%= dtProductsItems.Rows[aa][3].ToString().Trim()%>" title="<%= dtProductsItems.Rows[aa][7].ToString()%>"
                                alt="" /></a>
                        <% } %>
                        <h2>
                            <% 
                           if (dtProductsItems.Rows[aa][9].ToString() == "0")
                           { %>
                            <a href="#" title="<%= dtProductsItems.Rows[aa][7].ToString()%>" class="">
                                <%= dtProductsItems.Rows[aa][8].ToString()%></a>
                            <% } %>
                            <% 
                           else
                           { %>
                            <a href="preview.aspx?Param=<%= dtProductsItems.Rows[aa][4].ToString().Trim()%>"
                                title="<%= dtProductsItems.Rows[aa][7].ToString()%>">
                                <%= dtProductsItems.Rows[aa][8].ToString()%></a>
                            <% } %>
                        </h2>
                        <div class="price-details">
                            <div class="price-number">
                                <p>
                                    <% 
                           if (string.IsNullOrEmpty(dtProductsItems.Rows[aa][6].ToString()) || dtProductsItems.Rows[aa][6].ToString() == "0")
                           { %>
                                    <span class="rupees">QAR
                                        <%= dtProductsItems.Rows[aa][2].ToString()%></span>
                                    <% } %>
                                    <% 
                           else
                           { %>
                                    <span class="rupees1">QAR</span> <strike>
                                        <%= dtProductsItems.Rows[aa][2].ToString()%></strike> <span class="rupees1">
                                            <%= dtProductsItems.Rows[aa][5].ToString()%></span>
                                    <% } %>
                                </p>
                            </div>
                            <% 
                           if (dtProductsItems.Rows[aa][9].ToString() == "0")
                           { %>
                            <div>
                                <h4>
                                    <a href="preview.aspx?Param=<%= dtProductsItems.Rows[aa][4].ToString().Trim()%>"
                                        class="sold">Sold Out</a></h4>
                            </div>
                            <% } %>
                            <% 
                           else
                           { %>
                            <div class="add-cart">
                                <h4>
                                    <a href="preview.aspx?Param=<%= dtProductsItems.Rows[aa][4].ToString().Trim()%>">Buy
                                        Now</a></h4>
                            </div>
                            <% } %>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <% 
                           aa = aa + 1;
                           //aa1 = aa1 + 1;

                       }

                       if (s > 4)
                       { aa = aa - 1; aa1 = 4; }
                       else
                       { aa = aa + 0; aa1 = 0; }  %>
                </div>
                <% } %>
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
