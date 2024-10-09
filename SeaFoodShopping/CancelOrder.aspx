<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CancelOrder.aspx.cs" Inherits="CancelOrder" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Products </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://www.onlinepayment.com.my/MOLPay/API/seamless/3.2/js/MOLPay_seamless.deco.js"></script>
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Hmenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script src="web/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="web/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/global.css" />
    <link rel="stylesheet" href="web/css/GridStyle.css" />
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
            padding: 3px 7px;
            border: 1px solid #c1011e;
            font: normal 16px/normal Arial, Helvetica, sans-serif;
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
                     <li><a href="AccontInfo.aspx">
                            <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small"></asp:Label>
                            <asp:Label ID="lblWelcome" runat="server" Text="" Style="font-size: small"> </asp:Label></a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                        <%-- <li>
                            <img src="images/cart.png" alt="" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></li>--%>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">Logout</a></li>
                        <%--  <li><a href="SupplierRegister.aspx">SupplierRegister</a></li>
                        <li><a href="SellatEBB.aspx">SupplierLogin</a></li>
                        <li><a href="BusinessRegister.aspx">Business Register</a></li>--%>
                    </ul>
                </div>
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <%-- <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />--%>
                <div class="clear">
                </div>
            </div>
            <div class="header_top">
              
               <!-- #Include file="IncludeHeader.html" -->
                <div class="cart">
                    <p>
                        <%--Welcome to our Online Store! --%>
                       <%-- <asp:Label ID="lblWelcome" runat="server" Text="Welcome : " Style="font-size: small"
                            ForeColor="Black"></asp:Label>
                        <asp:Label ID="lblName" runat="server" Text="" Style="font-size: small"></asp:Label>--%>
                        <%-- <div id="dd" class="wrapper-dropdown-2">
                            0 item(s) - $0.00
                            <ul class="dropdown">
                                <li>you have no items in your Shopping cart</li>
                            </ul>
                        </div>--%>
                    </p>
                </div>
                <script type="text/javascript">
                    function DropDown(el) {
                        this.dd = el;
                        this.initEvents();
                    }
                    DropDown.prototype = {
                        initEvents: function () {
                            var obj = this;

                            obj.dd.on('click', function (event) {
                                $(this).toggleClass('active');
                                event.stopPropagation();
                            });
                        }
                    }

                    $(function () {

                        var dd = new DropDown($('#dd'));

                        $(document).click(function () {
                            // all dropdowns
                            $('.wrapper-dropdown-2').removeClass('active');
                        });

                    });

		</script>
                <%--  <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "orderdetails.aspx/BindDatatable",
                    data: "{}",
                    dataType: "json",
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $("#tbDetails").append("<tr><td><asp:LinkButton ID='l1' runat='server'>" + data.d[i].ordernodetails + "</asp:LinkButton></td></tr>");
                        }
                    },
                    error: function (result) {
                        alert("Error");
                    }
                });
            });
</script>--%>
                <div class="clear">
                </div>
            </div>
            <div class="header_bottom">
               <%-- <div class="menu">
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
                <%--<div class="search_box">
                    <form>
                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input
                        type="submit" value="">
                    </form>
                </div>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="">
            <%--  <div>
                 <span>Congratulations! You will receive your order in 7-8 days </span>
            </div>
            <br />--%>
            <%--  <div>
                <span>Email Confirmation Sent to your email address</span></div>--%>
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
                           <%-- <h3 style="background-color: Blue">
                                Shop Now</h3>
                            <div id='cssmenu'>
                                <ul>
                                    <% for (int a = 0; a < dtMenuItems.Rows.Count; a++)
                                       { %>
                                    <li class='active'><a href="Index.aspx"><span>
                                        <%= dtMenuItems.Rows[a][0].ToString()%></span></a> </li>
                                    <% } %>
                                    <%--<li class='active'><a href="Index.aspx"><span>Men Fashion</span></a></li>
                                    <li class='active'><a href="Index.aspx"><span>Electronics</span></a> </li>
                                    <li class='active'><a href="Index.aspx"><span>Home & Living</span></a></li>
                                    <li class='active'><a href="Index.aspx"><span>Sports & Leisure</span></a> </li>
                                       <li class='active'><a href="Index.aspx"><span>Health & Beauty</span></a></li>
                                </ul>
                            </div>--%>
                        </div>
                    </div>
                    <div class="col span_1_of_5">
                        <h2>
                            Cancel Order</h2>
                        <br />
                        <asp:Label ID="lblOrno" runat="server" Text="Order No:"></asp:Label><asp:Label ID="lblOrderNo"
                            runat="server" Font-Bold="true" Text=""></asp:Label>
                       
                        <br />
                        <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                        <br />
                       
                        <telerik:RadGrid runat="server" AllowPaging="false" ID="RadGridDisplay" CommandItemStyle-Visible="false"
                            OnNeedDataSource="RadGridDisplay_NeedDataSource" AllowMultiRowSelection="true"
                            OnItemDataBound="RadGrid1_ItemDataBound" GridLines="Both" Skin="Transparent"
                            ShowFooter="false" Width="50%"
                            AllowSorting="true">
                            <MasterTableView DataKeyNames="AddcartID" EditMode="EditForms" AutoGenerateColumns="false"
                                CommandItemDisplay="None" Width="100%" ShowHeader="true">
                                <Columns>
                                    <%--    <telerik:GridButtonColumn ButtonType="ImageButton" UniqueName="EditCommandColumn"
                                        Text="Update">
                                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                    </telerik:GridButtonColumn>--%>
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
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Image">
                                        <HeaderStyle Width="7%" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemTemplate>
                                            <img src="<%# Eval("imagePath") %>" alt="" style="float: left;" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Brand/Model" AllowFiltering="false" Visible="true"
                                        UniqueName="Brand">
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
                                            <asp:Label ID="lblCancelReason" runat="server" Text='<%# Eval("CancelReason")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Qty" AllowFiltering="false" Visible="true"
                                        UniqueName="Quantity">
                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <h2>
                                                <%--<label style="font-size: 14px">
                                                    Qty :
                                                </label>--%>
                                                <asp:Label ID="cboQnty" runat="server" Text='<%# Eval("Qnty")%>' Font-Size="14px"></asp:Label>
                                            </h2>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Total" AllowFiltering="false" Visible="true"
                                        UniqueName="Total">
                                        <HeaderStyle Width="12%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotal" runat="server" Text="" Style="font-size: 14px" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="CancelDate" HeaderText="Cancel Date" SortExpression="CancelDate"
                                        UniqueName="CancelDate" DataFormatString="{0:dd/MMM/yyyy}" Visible="false">
                                        <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CancelReason" DataType="System.String" HeaderText="Cancel Reason"
                                        SortExpression="CancelReason" UniqueName="CancelReason" Visible="false">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                    <%--  <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" EditText="Cancel">
                                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                                        <HeaderStyle Width="3%" HorizontalAlign="Left" />
                                    </telerik:GridEditCommandColumn>--%>
                                </Columns>
                                <%-- <EditFormSettings EditColumn-ButtonType="PushButton" EditFormType="Template">
                                    <FormTemplate>
                                        <table cellspacing="2" cellpadding="1" width="100%" border="0">
                                            <tr>
                                                <td align="right">
                                                    <h2>
                                                        <label>
                                                            Reason :</label></h2>
                                                </td>
                                                <td align="left">
                                                    <telerik:RadComboBox ID="cboReason" runat="server" Height="140px" Width="250px" DataValueField="Dept_ID"
                                                        CssClass="textbox" EnableLoadOnDemand="false" AppendDataBoundItems="false" EmptyMessage="Select Reason"
                                                        AutoPostBack="false" Visible="true">
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="No reason for return given" Value="0" />
                                                            <telerik:RadComboBoxItem Text="Ordered incorrect product" Value="1" />
                                                            <telerik:RadComboBoxItem Text="Product is not needed" Value="2" />
                                                            <telerik:RadComboBoxItem Text="Product did not fit the customer’s expectations" Value="3" />
                                                            <telerik:RadComboBoxItem Text="Company shipped the incorrect product" Value="4" />
                                                            <telerik:RadComboBoxItem Text="Change in delivery address" Value="5" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="Button1" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Yes" %>'
                                                        CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                                    </asp:Button>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="Button2" runat="server" Text="No" CausesValidation="false" CommandName="Cancel">
                                                    </asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </FormTemplate>
                                </EditFormSettings>--%>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" PageButtonCount="4" />
                            </MasterTableView>
                            <ClientSettings>
                                <Scrolling AllowScroll="false" UseStaticHeaders="true" />
                            </ClientSettings>
                        </telerik:RadGrid>
                        <br />
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <label>
                                        Reason</label>
                                </span><span>
                                    <telerik:RadComboBox ID="cboReason" runat="server" Height="140px" Width="250px" DataValueField="Dept_ID"
                                        CssClass="textbox" EnableLoadOnDemand="false" AppendDataBoundItems="false" EmptyMessage="Select Reason"
                                        AutoPostBack="false" Visible="true">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="Decided for alternative product" Value="0" />
                                            <telerik:RadComboBoxItem Text="Fees-shipping" Value="1" />
                                            <telerik:RadComboBoxItem Text="Found cheaper elsewhere" Value="2" />
                                            <telerik:RadComboBoxItem Text="Lead time too long" Value="3" />
                                            <telerik:RadComboBoxItem Text="Invalid order Mgmt: change/combine order" Value="4" />
                                            <telerik:RadComboBoxItem Text="Invalid order Mgmt: change payment method" Value="5" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        What do you want to do with your cancel?
                                    </label>
                                   <label style="color: Red;">
                                                            *</label></span><span><telerik:RadComboBox ID="cboreimburse" runat="server" Width="250px"
                                        DataValueField="Dept_ID" CssClass="textbox" EnableLoadOnDemand="false" AppendDataBoundItems="false"
                                        EmptyMessage="Select reimburse" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="cboreimburse_OnSelectedIndexChanged">
                                        <Items>
                                            <%--<telerik:RadComboBoxItem Text=" Replace with same/another product of same value" Value="0" />--%>
                                            <telerik:RadComboBoxItem Text="Store credit" Value="1" />
                                            <telerik:RadComboBoxItem Text="Full refund" Value="2" />
                                        </Items>
                                    </telerik:RadComboBox>
                                    </span>
                            </div>
                            <div>
                                <span>
                                    <telerik:RadComboBox ID="cboBankers" runat="server" Width="250px" DataValueField="Dept_ID"
                                        CssClass="textbox" EnableLoadOnDemand="false" AppendDataBoundItems="false" EmptyMessage="Select Banking Type"
                                        AutoPostBack="true" Visible="true" OnSelectedIndexChanged="cboBankers_OnSelectedIndexChanged">
                                        <Items>
                                            <%--<telerik:RadComboBoxItem Text=" Replace with same/another product of same value" Value="0" />--%>
                                            <telerik:RadComboBoxItem Text="Bank Transfer" Value="1" />
                                            <telerik:RadComboBoxItem Text="Credit Card" Value="2" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <asp:TextBox class="labelstyle" ID="txtAccname" runat="server" Font-Bold="true" placeholder="Account Name*"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <asp:TextBox class="labelstyle" ID="txtAccno" runat="server" Font-Bold="true" placeholder="Account Number*"></asp:TextBox>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <asp:TextBox class="labelstyle" ID="txtBankname" runat="server" Font-Bold="true"
                                        placeholder="Bank Name*"></asp:TextBox>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <asp:TextBox class="labelstyle" ID="txtBranch" runat="server" Font-Bold="true" placeholder="Branch/Location Name*"></asp:TextBox>
                                </span>
                            </div>
                            <div>
                             <span>&nbsp;&nbsp;
                            <asp:Button ID="btnCancelOrder" runat="server" Text="Submit" CssClass="enjoy-css"  Visible="true" OnClick="btnCancelOrder_Click" /></span>
                            </div>
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
    <a href="#" id="A1"><span id="Span1"></span></a>
    </form>
</body>
</html>
