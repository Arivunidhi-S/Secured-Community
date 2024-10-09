<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddWishlist.aspx.cs" Inherits="AddWishlist" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Wishlist </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/HMenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script src="web/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="web/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/global.css">
    <link rel="stylesheet" href="web/css/GridStyle.css">
    <script src="web/js/slides.min.jquery.js"></script>
    <script>
        $(function () {
            $('#products').slides({
                preload: true,
                preloadImage: 'img/loading.gif',
                effect: 'slide, fade',
                crossfade: true,
                slideSpeed: 350,
                fadeSpeed: 500,
                generateNextPrev: true,
                generatePagination: false
            });
        });
	</script>
    <style type="text/css">
        .enjoy-css
        {
            display: inline-block;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            cursor: pointer;
            padding: 7px 14px;
            border: 1px solid #00af31;
            font: normal 16px/normal Arial, Helvetica, sans-serif;
            color: rgba(255,255,255,0.9);
            -o-text-overflow: clip;
            text-overflow: clip;
            background: #00af31;
            -webkit-box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2);
            box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2);
            text-shadow: -1px -1px 0 rgba(15,73,168,0.66);
            -webkit-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            -moz-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            -o-transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
            transition: font-size 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 4ms, color 200ms cubic-bezier(0.19, 1, 0.22, 1) 15ms;
        }
        
        .enjoy-css:hover
        {
            border: 1px solid #0c0a0a;
            background: #0c0b0b;
            -webkit-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            -moz-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            -o-transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
            transition: all 1000ms cubic-bezier(0.25, 0.25, 0.75, 0.75) 17ms;
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
                         <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
                </div>
                 <div class="account_desc">
                    <ul>                     <li><a href="#">
                            <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblWelcome" runat="server" Text="Account" Style="font-size: small" Font-Bold="true"> </asp:Label></a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                         <li><a id="btnShopCart" onserverclick="btnShopCart_Click" runat="server">
                             <img src="images/cart.png" alt="" style="top: 5px; position: relative; width: 18px;
                                height: 18px;" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">Logout</a></li>
                    </ul>
                </div>
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <%-- <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />--%>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
                <%--<div class="menu">
                      <!-- #Include file="IncludeMenu.html" -->
                </div>--%>
               <div id='cssmenu'>
                    <ul>
                        <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                           { %>
                        <li class="has-sub"><a href="#"><span>
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
                    <div class="col span_2_of_2">
                        <div class="categories">
                            <h3>
                                My Account</h3>
                            <div id=''>
                                <ul>
                                    <li class='active'><a href="AccontInfo.aspx"><span>My Account</span></a> </li>
                                    <li class='active'><a href="OrderDetails.aspx"><span>My Orders</span></a></li>
                                    <li class='active'><a href="AddWishlist.aspx"><span>My Wishlist</span></a> </li>
                                    <li class='active'><a href="AddressBook.aspx"><span>My Address Book</span></a></li>
                                    <li class='active'><a href="Feedback.aspx"><span>My Feedback</span></a> </li>
                                    <%--   <li class='active'><a href='#'><span>Change Password</span></a></li>--%>
                                </ul>
                            </div>
                            <br />
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
                    </div>
                    <div class="col span_1_of_5">
                        <h2>
                            Wishlist</h2>
                        <%--   <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />--%>
                        <telerik:RadGrid runat="server" AllowPaging="false" ID="RadGridDisplay" CommandItemStyle-Visible="false"
                            OnNeedDataSource="RadGridDisplay_NeedDataSource" AllowMultiRowSelection="false"
                            OnDeleteCommand="RadGridDisplay_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound"
                            GridLines="Both" Skin="Transparent" OnItemCommand="RadGrid1_ItemCommand" ShowFooter="false"
                            Width="100%" AllowSorting="true">
                            <MasterTableView DataKeyNames="WishlistID" EditMode="EditForms" AutoGenerateColumns="false"
                                CommandItemDisplay="None" Width="100%" ShowHeader="false">
                                <%--<CommandItemSettings ShowAddNewRecordButton="false" AddNewRecordText="ADD NEW ITEMS"
                            ShowRefreshButton="false" />--%>
                                <Columns>
                                    <%-- <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditButton">
                                <HeaderStyle Width="5%" />
                            </telerik:GridEditCommandColumn>--%>
                                    <telerik:GridBoundColumn DataField="WishlistID" DataType="System.Int64" HeaderText="ID"
                                        Visible="false" ReadOnly="True" SortExpression="WishlistID" UniqueName="WishlistID"
                                        AllowSorting="false" AllowFiltering="false">
                                        <ItemStyle ForeColor="Silver" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProductID" DataType="System.String" HeaderText="ProductID"
                                        SortExpression="ProductID" UniqueName="ProductID" Visible="false">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="CustomerID" HeaderText="CustomerID" HeaderButtonType="TextButton"
                                        DataField="CustomerID" UniqueName="CustomerID" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn SortExpression="PricingID" HeaderText="PricingID" HeaderButtonType="TextButton"
                                        DataField="PricingID" UniqueName="PricingID" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="3%" HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelected" runat="server" BorderColor="Salmon" Visible="true" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="7%" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Height="10px" />
                                        <ItemTemplate>
                                            <%--  <input value="<%# Eval("imagePath") %>" alt="" type="button" />--%>
                                            <img src="<%# Eval("imagePath") %>" alt="" style="float: left;" />
                                            <%-- <div>
                                    <br />
                                     <h2>
                                        <label id="test">
                                            <%# Eval("Brand") %>
                                            &nbsp;
                                            <%# Eval("Model")%>
                                        </label>
                                     
                                   </h2>
                                    </div>--%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <h2>
                                                <label id="test">
                                                    <%# Eval("Brand") %>
                                                    &nbsp;
                                                    <%# Eval("Model")%>
                                                </label>
                                            </h2>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="20%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <div class="price">
                                                <span>
                                                    <asp:Label ID="lblRM" runat="server" Text="RM" Font-Size="XX-Large" ToolTip='<%# Eval("PricingID")%>'></asp:Label>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("DiscountPrice")%>' Font-Size="XX-Large"
                                                        ToolTip='<%# Eval("ProductID")%>'></asp:Label>
                                                </span>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="15%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <div class="price">
                                                <asp:Button ID="btncart" runat="server" Text="Add Cart" CssClass="enjoy-css" CommandName="Cart" /></span>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <%--  <telerik:GridImageColumn DataType="System.String" DataImageUrlFields="imagePath"
                                DataImageUrlFormatString="IMG/{0}.jpg" AlternateText="Product image" DataAlternateTextField="Image"
                                ImageAlign="Middle" ImageHeight="100px" ImageWidth="82px" HeaderText="Image Column">
                            </telerik:GridImageColumn>--%>
                                    <%-- <telerik:GridBoundColumn SortExpression="Brand" HeaderText="Brand" AllowFiltering="true"
                                HeaderButtonType="TextButton" DataField="Brand" UniqueName="Brand" Visible="true">
                                <HeaderStyle Width="25%" />
                            </telerik:GridBoundColumn>--%>
                                    <%--<telerik:GridBoundColumn SortExpression="Model" HeaderText="Model" HeaderButtonType="TextButton"
                                DataField="Model" UniqueName="Model" Visible="true">
                                <HeaderStyle Width="22%" />
                            </telerik:GridBoundColumn>--%>
                                    <%--  <telerik:GridBoundColumn SortExpression="Qnty" HeaderText="Qnty" HeaderButtonType="TextButton"
                                DataField="Qnty" UniqueName="Qnty" Visible="true">
                                <HeaderStyle Width="7%" />
                                  <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </telerik:GridBoundColumn>--%>
                                    <%-- <telerik:GridBoundColumn DataField="Price" DataType="System.Int32" HeaderText="Price"
                                SortExpression="Price" UniqueName="Price">
                                <HeaderStyle Width="7%" HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </telerik:GridBoundColumn>--%>
                                    <%-- <telerik:GridCalculatedColumn HeaderText="Total Price" UniqueName="TotalPrice" DataType="System.Decimal"
                                DataFields="Qnty, Price" Expression="{0}*{1}" FooterText="Total: " Aggregate="Sum">
                                <HeaderStyle Width="10%" HorizontalAlign="Left" />
                            </telerik:GridCalculatedColumn>--%>
                                    <telerik:GridButtonColumn CommandName="Delete" Visible="true" UniqueName="DeleteColumn"
                                        ButtonType="ImageButton" ConfirmText="Are you sure want to delete?">
                                        <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" PageButtonCount="4" />
                            </MasterTableView>
                            <ClientSettings>
                                <Scrolling AllowScroll="false" UseStaticHeaders="true" />
                            </ClientSettings>
                        </telerik:RadGrid>
                        <br />
                        <div style="text-align: right;">
                            <%--    <span>
                    <asp:Button ID="button" runat="server" Text="Add Items" CssClass="enjoy-css" /></span>--%>
                            <span>&nbsp;&nbsp;
                                <asp:Button ID="btnAllCart" runat="server" Text="Add selected item to shopping cart"
                                    CssClass="enjoy-css" OnClick="btnAllCart_OnClick" /></span>
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
