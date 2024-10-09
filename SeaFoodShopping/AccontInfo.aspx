<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccontInfo.aspx.cs" Inherits="AccontInfo" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Account </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <%--<link href="web/css/VMenu1.css" rel="stylesheet" type="text/css" media="all" />--%>
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
                        <%--<li class="last"><a href="Login.aspx" style="border-right-width: 1px;">LOGOUT</a></li>--%>
                        <%-- <div class="Logname">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" /></div>--%>
                    </ul>
                </div>
                <%--<div class="menu">
                    <ul>
                        <!-- #Include file="IncludeMenu.html" -->
                    </ul>
                </div>--%>
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
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
                            <%--<br />
                            <h3 style="background-color: Blue">
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
                    <div class="col span_2_of_3">
                        <div class="contact-form1">
                            <h2>
                                Buyer Account Info</h2>
                            <div>
                                <h3 style="color: Blue;">
                                    User Information</h3>
                                <asp:Label Style="text-align: right" ID="lblStatus" runat="server" Text=""></asp:Label>
                                <hr />
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <div>
                                                <span>
                                                    <label>
                                                        Name</label><label style="color: Red;">
                                                            *</label></span> <span>
                                                                <asp:TextBox ID="txtName" runat="server" class="textbox" onkeyup="checkchar(this);"></asp:TextBox></span>
                                                <asp:TextBox ID="txtBusinessname" runat="server" class="textbox" Visible="false"></asp:TextBox>
                                            </div>
                                            <div>
                                                <span>
                                                    <label>
                                                        Gender
                                                    </label>
                                                    <label style="color: Red;">
                                                        *</label>
                                                </span><span>
                                                    <telerik:RadComboBox ID="cboGender" runat="server" EnableLoadOnDemand="true" AppendDataBoundItems="true"
                                                        EmptyMessage="Select Gender">
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="Male" Value="Male" />
                                                            <telerik:RadComboBoxItem Text="Female" Value="Female" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </span>
                                            </div>
                                            <div>
                                                <span>
                                                    <label>
                                                        Date of Birth
                                                    </label>
                                                    <label style="color: Red;">
                                                        *</label>
                                                </span><span>
                                                    <telerik:RadComboBox ID="cboDate" runat="server" EnableLoadOnDemand="true" Width="50px" OnClientLoad="OnClientLoad"
                                                        Height="200px" AppendDataBoundItems="true" EmptyMessage="Date" OnItemsRequested="cboDate_OnItemsRequested">
                                                        <Items>
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                    <telerik:RadComboBox ID="cboMonth" runat="server" EnableLoadOnDemand="true" Width="60px"
                                                        Height="200px" AppendDataBoundItems="true" EmptyMessage="Month" OnClientLoad="OnClientLoad">
                                                        <%--OnItemsRequested="cboMonth_OnItemsRequested"--%>
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="Jan" Value="01" />
                                                            <telerik:RadComboBoxItem Text="Feb" Value="02" />
                                                            <telerik:RadComboBoxItem Text="Mar" Value="03" />
                                                            <telerik:RadComboBoxItem Text="Apr" Value="04" />
                                                            <telerik:RadComboBoxItem Text="May" Value="05" />
                                                            <telerik:RadComboBoxItem Text="Jun" Value="06" />
                                                            <telerik:RadComboBoxItem Text="Jul" Value="07" />
                                                            <telerik:RadComboBoxItem Text="Aug" Value="08" />
                                                            <telerik:RadComboBoxItem Text="Sep" Value="09" />
                                                            <telerik:RadComboBoxItem Text="Oct" Value="10" />
                                                            <telerik:RadComboBoxItem Text="Nov" Value="11" />
                                                            <telerik:RadComboBoxItem Text="Dec" Value="12" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                    <telerik:RadComboBox ID="cboYear" runat="server" EnableLoadOnDemand="true" Width="70px" OnClientLoad="OnClientLoad"
                                                        Height="200px" AppendDataBoundItems="true" EmptyMessage="Year" OnItemsRequested="cboYear_OnItemsRequested">
                                                        <Items>
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </span>
                                            </div>
                                            <div>
                                                <span>
                                                    <label>
                                                        IC No/Passport Number</label><label style="font-size: x-small;">
                                                            (optional)</label></span> <span>
                                                                <asp:TextBox ID="txtICnumber" runat="server" class="textbox" onkeyup="checkchar(this);"></asp:TextBox></span>
                                            </div>
                                            <div>
                                                <br />
                                                <asp:LinkButton ID="lnkChangePassword" runat="server" OnClick="lnkChangePassword_OnClick"><u>Change Password</u></asp:LinkButton></div>
                                            <%--<div>
                                <span>
                                    <label>
                                        Address</label><label style="color:Red;"> *</label></span> <span>
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="60px" class="textbox"></asp:TextBox></span>
                            </div>--%>
                                        </td>
                                        <td>
                                            <div>
                                                <span>
                                                    <label>
                                                        Contact Number</label><label style="color: Red;">
                                                            *</label></span> <span>
                                                                <asp:TextBox ID="txtContact" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
                                            </div>
                                            <div>
                                                <span>
                                                    <label>
                                                        Email/UserId</label><label style="color: Red;">
                                                            *</label></span> <span>
                                                                <asp:TextBox ID="txtEmail" runat="server" class="textbox" Enabled="false" ForeColor="Gray"></asp:TextBox></span>
                                            </div>
                                            <%--<div>
                                                <span>
                                                    <label>
                                                        Password
                                                    </label>
                                                    <label style="color: Red;">
                                                        *</label>
                                                </span><span>
                                                    <asp:TextBox ID="txtPassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                                            </div>
                                            <div>
                                                <span>
                                                    <label>
                                                        RetypePassword
                                                    </label>
                                                    <label style="color: Red;">
                                                        *</label>
                                                </span><span>
                                                    <asp:TextBox ID="txtRetypePassword" runat="server" class="textbox" TextMode="Password"></asp:TextBox></span>
                                            </div>--%>
                                            <div>
                                                <br />
                                                <asp:Image ID="imgCaptcha" runat="server" /></div>
                                            <div>
                                                <span>
                                                    <label>
                                                        Enter Code Below
                                                    </label>
                                                </span>
                                                <asp:TextBox ID="txtCaptcha" runat="server" class="tb10" Width="100px"></asp:TextBox>
                                            </div>
                                            <div>
                                                <span>
                                                    <asp:Button ID="Button1" runat="server" Text="Modify" class="myButton" OnClick="btnAddCategory_OnClick" /></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%-- <div class="col span_1_of_2"> &nbsp; &nbsp; &nbsp;</div>--%>
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
