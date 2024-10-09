<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShippingAddress.aspx.cs"
    Inherits="ShippingAddress" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ShippingAddress </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Radio.css" rel="stylesheet" type="text/css" media="all" />
   <%-- <link href="web/css/Select.css" rel="stylesheet" type="text/css" media="all" />--%>
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script type="text/javascript">
        function OnClientLoad(sender) {
            sender.get_inputDomElement().readOnly = "true";
        }
        function checkDec(el) {
            var ex = /^[0-9]+\.?[0-9]*$/;
            if (ex.test(el.value) == false) {
                el.value = el.value.substring(0, el.value.length - 1);
            }
        }
        function checkchar(el) {
            var ex = /^[a-zA-Z0-9-. ]*$/;
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
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <h3 style="padding-left: 30px; font-size: 1.5em; color: Black; font-family: 'ambleregular';
                        src: url(../font/Amble-Regular-webfont.ttf) format('truetype');">
                        Shipping Address</h3>
                    <div class="col span_2_of_7">
                        <div class="contact-form1">
                            <div>
                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                <span>
                                    <label>
                                        Name
                                    </label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="AddressBook.aspx">+ ADD A NEW ADDRESS</a> </span><span>
                                        <telerik:RadComboBox ID="cboAddress" runat="server" Height="300px" Width="300px"
                                            Skin="Hay" OnSelectedIndexChanged="cboAdress_SelectedIndexChanged" DropDownWidth="300px"
                                            EmptyMessage="Enter Name or Select Name" EnableLoadOnDemand="true" AutoPostBack="true"
                                            AppendDataBoundItems="True" Visible="true" OnItemsRequested="cboAdress_OnItemsRequested">
                                            <HeaderTemplate>
                                                <table style="width: 300px" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td style="width: 300px;">
                                                            Address Group
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table style="width: 300px" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td style="width: 300px;">
                                                            <%# DataBinder.Eval(Container, "Text")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadComboBox>
                                    </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Mobile</label>
                                </span><span>
                                    <asp:TextBox ID="txtMobile" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Email</label>
                                </span><span>
                                    <asp:TextBox ID="txtEmail" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <span></span>
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
                                        Address Line 2</label></span> <span>
                                            <asp:TextBox ID="txtAddress2" runat="server" class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                                <div>
                                    <span><span>
                                        <asp:TextBox ID="txtAddress3" runat="server" class="textbox" Visible="false"></asp:TextBox></span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            PostCode</label><label style="color: Red;">
                                                *</label></span> <span>
                                                    <asp:TextBox ID="txtPostCode" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
                                </div>
                                <asp:Label ID="lblGridStatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact-form1">
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
                                                <telerik:RadComboBox ID="txtState" runat="server" EnableLoadOnDemand="true" Width="300px"
                                                    Skin="Hay" OnClientLoad="OnClientLoad" AutoPostBack="false" DropDownWidth="300px"
                                                    AppendDataBoundItems="true" EmptyMessage="Select State">
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
                                                <telerik:RadComboBox ID="txtCountry" runat="server" EnableLoadOnDemand="true" Width="300px"
                                                    AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true" Skin="Hay"
                                                    OnClientLoad="OnClientLoad">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Qatar" Value="QA" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </span>
                            </div>
                           
                       
                         <div style="clear:both" class="panel panel-default">
                                <div class="panel-heading">
                                    Choose Payment Method</div>
                                <div class="panel-body">
                                    <div class="example">
                                        <asp:RadioButtonList ID="rdPaymentMethod" runat="server">
                                            <asp:ListItem Text="Cash On Delivery" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Online Banking/Credit Card" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                        <div>
                            <asp:Image ID="imgCaptcha" runat="server" />
                            <br />
                            <span>
                                <label>
                                    Enter Code Below</label>
                            </span>
                            <asp:TextBox ID="txtCaptcha" runat="server" class="tb10" Width="100px"></asp:TextBox>
                            <span style="float:right;margin-top :-2.5em; ">
                                <asp:Button ID="btnBuy" runat="server" Text=" Continue Buy " class="myButton" Style="text-align: left"
                                    OnClick="btnBuy_OnClick" /></span>
                        </div>
                        <div>
                            
                        </div> </div>
                    </div>
                </div>
            </div>
        </div>
   <%-- </div>
    </div>--%>
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
