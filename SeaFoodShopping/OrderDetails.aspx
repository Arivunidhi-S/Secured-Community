<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Order Details </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/global.css" />
    <link rel="stylesheet" href="web/css/GridStyle.css" />
    <link rel="stylesheet" href="css/rating.min.css" />
    <link rel="stylesheet" href="web/css/ForPreview.css" />
    <style type="text/css">
        /*For Table*/
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
        }
        
        .tdwidth
        {
            width: 250px;
        }
    </style>
     <script type="text/javascript">

         function OnClientLoad(sender) {
             sender.get_inputDomElement().readOnly = "true";
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
                        <li><a href="#">
                            <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblWelcome" runat="server" Text="Account" Style="font-size: small"
                                Font-Bold="true"> </asp:Label></a></li>
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
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
                 <!-- #Include file="IncludeHeader.html" -->
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
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
        <div class="">
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
                                </ul>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="col span_1_of_5">
                        <h2>
                            My Order
                        </h2>
                        <div>
                            Year :<span>
                                <telerik:RadComboBox ID="cboOrderNo" runat="server" DataValueField="Dept_ID" Width="150px"
                                    EnableLoadOnDemand="true" AppendDataBoundItems="True" EmptyMessage="Select Year" Skin="Hay" OnClientLoad="OnClientLoad"
                                    OnItemsRequested="cboOrderNo_OnItemsRequested" AutoPostBack="true" OnSelectedIndexChanged="cboOrderNo_OnSelectedIndexChanged">
                                    <Items>
                                    </Items>
                                </telerik:RadComboBox>
                            </span>
                        </div>
                        <br />
                        <asp:Table ID="tbl" runat="server" CssClass="Rightborders" />
                        <br />
                        <asp:Label ID="lblOrno" runat="server" Text="Order No:"></asp:Label><asp:Label ID="lblOrderNo"
                            runat="server" Font-Bold="true" Text=""></asp:Label>
                        &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:Label class="labelstyle" ID="lblStatus" runat="server" Font-Bold="false" /><br />
                        <br />
                        <telerik:RadGrid runat="server" AllowPaging="false" ID="RadGridDisplay" CommandItemStyle-Visible="false"
                            OnNeedDataSource="RadGridDisplay_NeedDataSource" AllowMultiRowSelection="true"
                            OnItemDataBound="RadGrid1_ItemDataBound" GridLines="Both" Skin="Transparent"
                            ShowFooter="false" Width="100%" AllowSorting="true" OnItemCommand="RadGridDisplay_ItemCommand">
                            <MasterTableView DataKeyNames="AddcartID" EditMode="EditForms" AutoGenerateColumns="false"
                                CommandItemDisplay="None" Width="100%" ShowHeader="false">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AddcartID" DataType="System.Int64" HeaderText="ID"
                                        Visible="false" ReadOnly="True" SortExpression="AddcartID" UniqueName="AddcartID"
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
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="false"
                                        UniqueName="RunningNo">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblRunningNo" runat="server" Text='<%# Eval("RunningNo")%>' Style="font-size: large"
                                                ToolTip='<%# Eval("ProductID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Image">
                                        <HeaderStyle Width="10%" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemTemplate>
                                            <img src="<%# Eval("imagePath") %>" alt="" style="float: left; top: 5px; position: relative;
                                                width: 50px; height: 50px;" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Brand">
                                        <HeaderStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <h2>
                                                <label style="font-size: 14px">
                                                    <%# Eval("Brand") %>
                                                    &nbsp;
                                                    <%# Eval("Model")%>
                                                </label>
                                            </h2>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="false"
                                        UniqueName="DiscountPrice">
                                        <HeaderStyle Width="20%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("DiscountPrice")%>' Style="font-size: large"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <h2>
                                                <label style="font-size: 14px">
                                                    Qty :
                                                </label>
                                                <asp:Label ID="cboQnty" runat="server" Text='<%# Eval("Qnty")%>' Font-Size="14px"></asp:Label>
                                            </h2>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Total">
                                        <HeaderStyle Width="12%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotal" runat="server" Text="" Style="font-size: 14px" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblShip" runat="server" Style="font-size: 14px" Text="Shipped:"></asp:Label>
                                            <asp:Label ID="lblShipped" runat="server" Style="font-size: 14px" Text='<%# Eval("Shipping")%>'></asp:Label>
                                            <asp:Label ID="lblcancel" runat="server" Visible="false" Text='<%# Eval("Cancelorder")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblDeliver" runat="server" Style="font-size: 14px" Text="Delivered:"></asp:Label>
                                            <asp:Label ID="lblDelivered" runat="server" Style="font-size: 14px" Text='<%# Eval("Delivered")%>'></asp:Label>
                                            <asp:Label ID="lblReturn" runat="server" Visible="false" Text='<%# Eval("Returnpro")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="DiscountPrice">
                                        <HeaderStyle Width="6%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Button ID="lnkReturnCancel" runat="server" CommandName="Click"></asp:Button>
                                            <asp:Label ID="lblReturnCancel" runat="server" Style="font-size: 14px" ForeColor="Red"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <%--<telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="DiscountPrice">
                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                                Write Review</a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>
                                    <telerik:GridButtonColumn ButtonType="LinkButton" CommandArgument="Delivery" CommandName="Delivery"
                                        FilterControlAltText="Filter watch column" HeaderText="Delivery" Text="Write Review"
                                        UniqueName="Delivery">
                                        <%--ImageUrl="images/star-blank.png"--%>
                                        <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Blue" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" PageButtonCount="4" />
                            </MasterTableView>
                            <ClientSettings>
                                <Scrolling AllowScroll="false" UseStaticHeaders="true" />
                            </ClientSettings>
                        </telerik:RadGrid>
                        <br />
                        <%-- <div style="text-align: right;">
                           
                            <asp:Label class="labelstyle" ID="lblTotal" runat="server" ForeColor="Red" Font-Bold="true"
                                Visible="false" />
                            <br />
                            <br />
                           
                            <asp:Label class="labelstyle" ID="lblShippingCost" runat="server" ForeColor="Red"
                                Visible="false" Font-Bold="true" />
                            <br />
                            <br />
                           
                            <asp:Label class="labelstyle" ID="lblGrandTotal" runat="server" ForeColor="Red" Font-Bold="true"
                                Visible="false" />
                        </div>
                        <br />
                        <div style="text-align: right;">
                            <span>
                                <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel Order" CssClass="enjoy-css"
                                    OnClick="btnCancelOrder_OnClick" Visible="false" /></span> <span>&nbsp;&nbsp;
                                        <asp:Button ID="btnReturnOrder" runat="server" Text="Return Order" CssClass="enjoy-css"
                                            Visible="false" /></span>
                        </div>--%>
                        <!-- Trigger/Open The Modal -->
                        <div id="light" class="white_content lblfont">
                            <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"
                                style="float: right; color: Blue;">
                                <label  class="closehref">
                                    &nbsp;&nbsp;&nbsp;
                                </label>
                            </a>
                          <br />
                            <h4 class="titletext">
                                Please share your experience about this item</h4>
                            <br />
                            Rate this product
                            <div id="shop">
                            </div>
                            <input type="hidden" runat='server' id="HiddenField1" value="" />
                            <input type="hidden" runat='server' id="HiddenField2" value="" />
                            <br />
                            <label class="label-css">
                                Review title</label>
                            <label style="color: Red;">
                                *</label>
                            <br />
                            <asp:TextBox ID="txtReviewtitle" runat="server" class="textbox" Width="350px" ></asp:TextBox><br />
                            <br />
                            <label class="label-css">
                                Review description</label>
                            <label style="color: Red;">
                                *</label>
                            <br />
                            <asp:TextBox ID="txtReviewdescription" runat="server" class="textbox" Width="350px"
                                TextMode="MultiLine" Height="100px" ></asp:TextBox><br />
                            <br />
                            <div style="text-align:center">
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit Review" class="btn-css" OnClick="btnsubmit_Click" />
                             </div>
                        </div>
                        <div id="fade" class="black_overlay">
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <script type="text/javascript" src="js/rating.min.js"></script>
    <script type="text/javascript">

        /**
        * Demo in action!
        */
        (function () {

            'use strict';

            // SHOP ELEMENT
            var shop = document.querySelector('#shop');

            // DUMMY DATA
            var data = [
      {

          rating: document.getElementById("HiddenField1").value
      },
            //      {

            //          rating: 2
            //      },
            //      {

            //          rating: null
            //      }
    ];

            // INITIALIZE
            (function init() {
                for (var i = 0; i < data.length; i++) {
                    addRatingWidget(buildShopItem(data[i]), data[i]);
                }
            })();

            // BUILD SHOP ITEM
            function buildShopItem(data) {
                var shopItem = document.createElement('div');

                var html = '<div class="c-shop-item__img"></div>' +
        '<div class="c-shop-item__details">' +
                //          '<h3 class="c-shop-item__title">' + data.title + '</h3>' +
                //          '<p class="c-shop-item__description">' + data.description + '</p>' +
          '<ul class="c-rating"></ul>' +
        '</div>';

                shopItem.classList.add('c-shop-item');
                shopItem.innerHTML = html;
                shop.appendChild(shopItem);

                return shopItem;
            }

            // ADD RATING WIDGET
            function addRatingWidget(shopItem, data) {
                var ratingElement = shopItem.querySelector('.c-rating');
                var currentRating = data.rating;
                var maxRating = 5;

                var callback = function (rating) {
                    document.getElementById("HiddenField1").value = rating;
                    //                                alert(rating);

                };
                var r = rating(ratingElement, currentRating, maxRating, callback);
            }

        })();

</script>
    <a href="#" id="A1"><span id="Span1"></span></a>
    </form>
</body>
</html>
