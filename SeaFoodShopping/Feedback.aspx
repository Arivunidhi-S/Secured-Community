<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Feedback </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
     <link href="web/css/HMenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <style type="text/css">
        .enjoy-css
        {
            display: inline-block;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            cursor: pointer;
            padding: 5px 15px;
            border: 1px solid #c1011e;
            font: normal 14px/normal Arial, Helvetica, sans-serif;
            color: rgba(255,255,255,0.9);
            -o-text-overflow: clip;
            text-overflow: clip;
            background: #ba2518;
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
        
        .search
        {
            background: url(images/Reject.png) no-repeat;
            background-position: center;
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
                    <ul>
                    <li><a href="#">
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

                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
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

                           <%-- <h3 style="background-color:Blue">
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
                    <div class="col span_1_of_3">
                        <div class="contact_info">
                            <h3>
                                Feedback</h3>
                        </div>
                        <div class="contact-form">
                            <div>
                                <span>
                                   <%-- <telerik:RadComboBox ID="cboAddressList" runat="server" EnableLoadOnDemand="true"
                                        Width="200px" AutoPostBack="false" DropDownWidth="200px" AppendDataBoundItems="true"
                                        EmptyMessage="Select Address">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="Address 1" Value="1" />
                                            <telerik:RadComboBoxItem Text="Address 2" Value="2" />
                                            <telerik:RadComboBoxItem Text="Address 3" Value="3" />
                                            <telerik:RadComboBoxItem Text="Address 4" Value="4" />
                                            <telerik:RadComboBoxItem Text="Address 5" Value="5" />
                                        </Items>
                                    </telerik:RadComboBox>--%>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Feedback</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Height="60px" Width="300px"
                                                    class="textbox"></asp:TextBox></span>
                            </div>
                            <br />
                            <span>
                                <asp:Button ID="Button2" runat="server" Text="Send Feedback" CssClass="enjoy-css" OnClick="btnAddFeedback_OnClick" /></span>&nbsp;&nbsp;&nbsp;<asp:Label
                                    ID="lblGridStatus" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <div>
                        </div>
                    </div>
                 <%--   <div class="col span_1_of_3">
                        <telerik:RadGrid ID="RadGrid2" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid2_NeedDataSource"
                            GridLines="Vertical" AllowPaging="false" PagerStyle-AlwaysVisible="false" PagerStyle-Position="Bottom"
                            OnDeleteCommand="RadGrid2_DeleteCommand" Skin="Sunset" AllowAutomaticUpdates="true"
                            Width="400px" AllowAutomaticInserts="true" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                            AllowAutomaticDeletes="true" AllowSorting="true" AllowFilteringByColumn="false">
                            <ClientSettings EnableRowHoverStyle="true">
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="AddressId">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="FeedbackID" DataType="System.Int64" HeaderText="ID"
                                        ReadOnly="True" SortExpression="FeedbackID" UniqueName="FeedbackID" AllowFiltering="false"
                                        AllowSorting="false" Visible="false">
                                    </telerik:GridBoundColumn>
                                  <%--  <telerik:GridBoundColumn DataField="AddressList" DataType="System.String" HeaderText="Address Group"
                                        SortExpression="AddressList" UniqueName="AddressList" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Address" DataType="System.String" HeaderText="Address"
                                        SortExpression="Address" UniqueName="Address" AllowFiltering="false">
                                        <HeaderStyle Width="13%" />
                                    </telerik:GridBoundColumn>
                                    <%--  <telerik:GridBoundColumn DataField="Stock" DataType="System.String" HeaderText="Stock"
                                            SortExpression="Stock" UniqueName="Stock" AllowFiltering="false">
                                            <HeaderStyle Width="10%" />
                                        </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                        HeaderText="Remove" ConfirmText="Are you sure want to delete?">
                                        <HeaderStyle Width="2%" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                            <PagerStyle Mode="NumericPages"></PagerStyle>
                        </telerik:RadGrid>
                    </div>--%>
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
