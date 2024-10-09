<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs" Inherits="AddressBook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Address Book</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
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
    <script type="text/javascript">
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }
      
    </script>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <%--<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>--%>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                    <telerik:AjaxUpdatedControl ControlID="txtName" />
                    <telerik:AjaxUpdatedControl ControlID="txtAddress1" />
                    <telerik:AjaxUpdatedControl ControlID="txtAddress2" />
                    <telerik:AjaxUpdatedControl ControlID="txtAddress3" />
                    <telerik:AjaxUpdatedControl ControlID="txtPostCode" />
                    <telerik:AjaxUpdatedControl ControlID="txtCity" />
                    <telerik:AjaxUpdatedControl ControlID="txtState" />
                    <telerik:AjaxUpdatedControl ControlID="txtCountry" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
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
                            <h3 style="background-color: Blue">
                                Shop Now</h3>
                            <div id=''>
                               <ul>
                                    <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                                       { %>
                                    <li class='active'><a href='Products.aspx?Param=<%= dtMenuItems.Rows[a][1].ToString()%>&Param1=0'>
                                        <span>
                                            <%= dtMenuItems.Rows[a][3].ToString()%></span></a> </li>
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <h3 style="padding-left: 220px; font-size: 1.5em; color: Black; font-family: 'ambleregular';
                        src: url(../font/Amble-Regular-webfont.ttf) format('truetype');">
                        Address Book</h3>
                    <div class="col span_1_of_3">
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <%--       <telerik:RadComboBox ID="cboAddressList" runat="server" EnableLoadOnDemand="true"
                                        Width="200px" AutoPostBack="false" DropDownWidth="200px" AppendDataBoundItems="true"
                                        EmptyMessage="Select Name">
                                        <Items>
                                           
                                        </Items>
                                    </telerik:RadComboBox>--%>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Name</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtName" runat="server" class="textbox" onkeyup="checkchar(this);"></asp:TextBox></span>
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
                                        Email</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtEmail" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Address Line 1</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtAddress1" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Address Line 2</label><%--<label style="color: Red;">
                                    *</label>--%></span> <span>
                                        <asp:TextBox ID="txtAddress2" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <asp:Label ID="lblGridStatus" runat="server" Text=""></asp:Label>
                            </div>
                            <br />
                        </div>
                        <br />
                        <div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <%--       <telerik:RadComboBox ID="cboAddressList" runat="server" EnableLoadOnDemand="true"
                                        Width="200px" AutoPostBack="false" DropDownWidth="200px" AppendDataBoundItems="true"
                                        EmptyMessage="Select Name">
                                        <Items>
                                           
                                        </Items>
                                    </telerik:RadComboBox>--%>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        <%-- Address Line 3--%></label><%--<label style="color: Red;">
                                            *</label>--%></span> <span>
                                                <asp:TextBox ID="txtAddress3" runat="server" class="textbox" Visible="false"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        PostCode</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtPostCode" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        City</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <asp:TextBox ID="txtCity" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        State</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <%--<asp:TextBox ID="txtState" runat="server" class="textbox"></asp:TextBox>--%>
                                                <telerik:RadComboBox ID="txtState" runat="server" EnableLoadOnDemand="true" Width="300px" OnClientLoad="OnClientLoad"
                                                    AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true" EmptyMessage="Select State">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Doha" Value="Doha" />
                                                        <telerik:RadComboBoxItem Text="Al Daayen" Value="Al Daayen" />
                                                        <telerik:RadComboBoxItem Text="Al Khor" Value="Al Khor" />
                                                        <telerik:RadComboBoxItem Text="Al Rayyan" Value="Al Rayyan" />
                                                        <telerik:RadComboBoxItem Text="Al Wakrah" Value="Al Wakrah" />
                                                        <telerik:RadComboBoxItem Text="Madinat ash Shamal" Value="Madinat ash Shamal" />
                                                        <telerik:RadComboBoxItem Text="Umm Salal" Value="Umm Salal" />
                                                         </Items>
                                                </telerik:RadComboBox>
                                            </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Country</label><label style="color: Red;">
                                            *</label></span> <span>
                                                <%-- <asp:TextBox ID="txtCountry" runat="server" class="textbox"></asp:TextBox>--%>
                                                <telerik:RadComboBox ID="txtCountry" runat="server" EnableLoadOnDemand="true" Width="300px"
                                                    AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true" OnClientLoad="OnClientLoad"> 
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Qatar" Value="Qatar" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </span>
                            </div>
                            <br />
                            <span>
                                <asp:Button ID="Button1" runat="server" Text="Add Address" CssClass="enjoy-css" OnClick="btnAddAddressOnClick" /></span>&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="col ">
                        <telerik:RadGrid ID="RadGrid2" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid2_NeedDataSource"
                            GridLines="Vertical" AllowPaging="false" PagerStyle-AlwaysVisible="false" PagerStyle-Position="Bottom"
                            OnDeleteCommand="RadGrid2_DeleteCommand" Skin="Hay" AllowAutomaticUpdates="true"
                            OnItemCommand="RadGrid1_ItemCommand" Width="870px" AllowAutomaticInserts="true"
                            PagerStyle-Mode="NextPrevNumericAndAdvanced" AllowAutomaticDeletes="true" AllowSorting="true"
                            AllowFilteringByColumn="false">
                            <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="AddressId">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AddressId" DataType="System.Int64" HeaderText="ID"
                                        ReadOnly="True" SortExpression="AddressId" UniqueName="AddressId" AllowFiltering="false"
                                        AllowSorting="false" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <%-- <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditButton">
                                        <HeaderStyle Width="1%" />
                                    </telerik:GridEditCommandColumn>--%>
                                    <telerik:GridBoundColumn DataField="Name" DataType="System.String" HeaderText="Name"
                                        SortExpression="Name" UniqueName="Name" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Mobile" DataType="System.String" HeaderText="ContactNo"
                                        SortExpression="Mobile" UniqueName="Mobile" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Email" DataType="System.String" HeaderText="Email"
                                        SortExpression="Email" UniqueName="Email" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Address1" DataType="System.String" HeaderText="Address 1"
                                        SortExpression="Address1" UniqueName="Address1" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Address2" DataType="System.String" HeaderText="Address 2"
                                        SortExpression="Address2" UniqueName="Address2" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <%-- <telerik:GridBoundColumn DataField="Address3" DataType="System.String" HeaderText="Address 3"
                                        SortExpression="Address3" UniqueName="Address3" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="PostCode" DataType="System.String" HeaderText="PostCode"
                                        SortExpression="PostCode" UniqueName="PostCode" AllowFiltering="false">
                                        <HeaderStyle Width="3%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="City" DataType="System.String" HeaderText="City"
                                        SortExpression="City" UniqueName="City" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="State" DataType="System.String" HeaderText="State"
                                        SortExpression="State" UniqueName="State" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Country" DataType="System.String" HeaderText="Country"
                                        SortExpression="Country" UniqueName="Country" AllowFiltering="false">
                                        <HeaderStyle Width="7%" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                        HeaderText="" ConfirmText="Are you sure want to delete?">
                                        <HeaderStyle Width="1%" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                            <PagerStyle Mode="NumericPages"></PagerStyle>
                        </telerik:RadGrid>
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
    <%--<a href="#" id="toTop"><span id="toTopHover"></span></a>--%>
    </form>
</body>
</html>
