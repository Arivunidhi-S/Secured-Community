<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Fish Shopping Qatar</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta name="description" content="Online shopping website in Malaysia - Electronics,Fashion,Biscuits,Chocolates in wholesale price " />
    <meta name="keywords" content="shopping,online shopping,buy online,buy now,shop now,promotion,sale,fashion,electronics,men fashion,women fashion,grocery,kurtis,tops,sarees,punjabi dress,punjabi suit,salwar kameez,churidar,jacket,cap,round neck,polo,tshirt,t-shirt,laptop,mobile,phone,Lenovo,Asus,HP,Dell,wholesale,product,item,chocolate,biscuit,cookies,tudung,shawls,Denim,Crepe,Cotton,hairgel,chipsmore,jacobs,bake,tudor,tango,kandos,travel,travelloc,travel lock,easybuybye" />
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />--%>
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/hovermenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/VMenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/slider.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    <script type="text/javascript" src="engine1/jquery.js"></script>
    <script type="text/javascript" src="web/js/script1.js"></script>
    <script type='text/javascript'>
        var txt = "FishMarket Qatar......  ";
        var espera = 200;
        var refresco = null;
        function rotulo_title() {
            document.title = txt;
            txt = txt.substring(1, txt.length) + txt.charAt(0); refresco = setTimeout("rotulo_title()", espera);
        }
        rotulo_title();
    </script>
    <style type="text/css">
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
    <script type="text/javascript">
        document.oncontextmenu = document.body.oncontextmenu = function () { return false; }
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
                            <img src="images/cart.png" style="top: 5px; position: relative; width: 18px; height: 18px;"
                                alt="Cart" />
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
                        <li class="active"><a href="index.aspx">Home</a> </li>
                        <li><a href="AboutUs.aspx">About</a></li>
                        <li><a href="Delivery.aspx">Delivery</a></li>
                        <li><a href="News.aspx">News</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
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
            <div class="header_slide">
                <div class="header_bottom_left">
                    <div class="categories">
                        <h3>
                            Categories</h3>
                    </div>
                    <div id='cssmenu'>
                        <ul>
                            <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                               { %>
                            <li class='has-sub'><a href='#'><span>
                                <%= dtMenuItems.Rows[a][3].ToString()%></span></a>
                                <ul>
                                    <% dtSubMenuItems = BusinessTier.getSubMenuItems(dtMenuItems.Rows[a][0].ToString());
                                       int aa;
                                       for (aa = 0; aa < dtSubMenuItems.Rows.Count; aa++)
                                       { %>
                                    <li><a href='Products.aspx?Param=<%= dtSubMenuItems.Rows[aa][2].ToString()%>&Param1=0'>
                                        <span>
                                            <%= dtSubMenuItems.Rows[aa][0].ToString()%></span></a> </li>
                                    <% } %>
                                </ul>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <div class="header_bottom_right">
                    <!-- #Include file="IncludeSlider.html" -->
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="content_top">
                    <div class="heading">
                        <h3>
                            Available SeaFoods</h3>
                    </div>
                    <div class="see">
                        <p>
                            <a href="AllFish.aspx?Param=0">See all SeaFoods</a></p>
                    </div>
                    <div class="clear">
                    </div>
                </div>
              <% int aa2 = 0, aa1 = 0, s = 0, t = 0;
                   s = dtRecentitems.Rows.Count;
                   for (aa2 = 0; aa2 < dtRecentitems.Rows.Count; aa2++)
                   {  %>
                <div class="section group">
                    <%   
                       s = s - aa1;
                       if (s > 4)
                       { t = 4; }
                       else
                       { t = s; }
                       for (int f = 0; f < t; f++)
                       { %>
                    <div class="grid_1_of_4 images_1_of_4">
                        <a href="preview.aspx?Param=<%= dtRecentitems.Rows[aa2][4].ToString().Trim()%>">
                            <img src="<%= dtRecentitems.Rows[aa2][3].ToString().Trim()%>" title="<%= dtRecentitems.Rows[aa2][7].ToString()%>"
                                alt="<%= dtRecentitems.Rows[aa2][7].ToString()%>" /></a>
                        <h2>
                            <a href="preview.aspx?Param=<%= dtRecentitems.Rows[aa2][4].ToString().Trim()%>" title="<%= dtRecentitems.Rows[aa2][7].ToString()%>">
                                <%= dtRecentitems.Rows[aa2][8].ToString()%></a>
                            <%-- &nbsp;--%>
                            <%--    <%= dtRecentitems.Rows[aa2][1].ToString()%>--%>
                        </h2>
                        <div class="price-details">
                            <div class="price-number">
                                <p>
                                    <% 
                           if (string.IsNullOrEmpty(dtRecentitems.Rows[aa2][6].ToString()) || dtRecentitems.Rows[aa2][6].ToString() == "0")
                           { %>
                                    <span class="rupees">QAR
                                        <%= dtRecentitems.Rows[aa2][2].ToString()%></span>
                                    <% } %>
                                    <% 
                           else
                           { %>
                                    <span class="rupees1">QAR</span> <strike>
                                        <%= dtRecentitems.Rows[aa2][2].ToString()%></strike> <span class="rupees1">
                                            <%= dtRecentitems.Rows[aa2][5].ToString()%></span>
                                    <% } %>
                                </p>
                            </div>
                            <div class="add-cart">
                                <h4>
                                    <a href="preview.aspx?Param=<%= dtRecentitems.Rows[aa2][4].ToString().Trim()%>">Buy
                                        Now</a></h4>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <% 
                           aa2 = aa2 + 1;
                           //aa1 = aa1 + 1;

                       }

                       if (s > 4)
                       { aa2 = aa2 - 1; aa1 = 4; }
                       else
                       { aa2 = aa2 + 0; aa1 = 0; }  %>
                </div>
                <% } %>
               
            </div>
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <%-- <script type="text/javascript">
    $(document).ready(function () { $().UItoTop({ easingType: 'easeOutQuart' }); });
    </script>--%>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
