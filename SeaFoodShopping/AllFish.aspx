<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllFish.aspx.cs" Inherits="AllFish" %>

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
        function checkchar(el) {
            var ex = /^[a-zA-Z0-9-. ]*$/;
            if (ex.test(el.value) == false) {
                el.value = el.value.substring(0, el.value.length - 1);
            }
        }
        
    </script>
    <style type="text/css">
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
        a
        {
            color: #B81D22; /* original colour state*/
        }
        
        a:active
        {
            color: #B81D22;
        }
        
        a:hover
        {
            color: #000;
        }
        a[tabindex]:focus
        {
            color: #B81D22;
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
                        <li><a href="SellatEBB.aspx">Sell at EasyBuyBye</a></li>
                        <li><a id="btnShopCart" onserverclick="btnShopCart_Click" runat="server">
                            <img src="images/cart.png" alt="" style="top: 5px; position: relative; width: 18px;
                                height: 18px;" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">
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
                <div class="clear">
                </div>
            </div>
            <div class="">
                <div id='cssmenu'>
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
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="content_top">
                    <div class="heading">
                        <h3>
                            Products
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
                    <%     aa = aa + 1;      }

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
