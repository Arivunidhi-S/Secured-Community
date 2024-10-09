<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderConfirmation.aspx.cs"
    Inherits="OrderConfirmation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Banking Order Confirmation</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.onlinepayment.com.my/MOLPay/API/seamless/3.2/js/MOLPay_seamless.deco.js"></script>
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/Radio.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <script src="web/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="web/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="web/css/global.css" />
    <link rel="stylesheet" href="web/css/GridStyle.css" />
    <script type="text/javascript" src="web/js/slides.min.jquery.js"></script>
    <script  type="text/javascript">
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
            padding: 5px 10px;
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
        .lblfont
        { font-family: 'ambleregular'; src:url(../font/Amble-Regular-webfont.ttf) format('truetype');" }  
          
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
                        <%-- <li>
                            <img src="images/cart.png" alt="" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></li>--%>
                        <%-- <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a href="Login.aspx">Login</a></li>--%>
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
                <div class="clear">
                </div>
            </div>     
           
            <div class="header_bottom">
                <div class="menu">
                    <!-- #Include file="IncludeMenu.html" -->
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
                        <div class="header_slide">
                <div class="header_bottom_left">
                    <div class="categories">
                        <h3>
                            Billing Address</h3>
                    </div>
                     <div style="border-color:#03d164;" class="panel lblfont" >
                   
                    <div class="panel-body" >
                       <strong style="font-weight:bold"> <% =Name %><br /></strong>
                       <% =Address1%><% =Address2%><br />
                       <% =PostCode%> <% =City%><br />
                       <% =State%> <% =Country %> <br /><br />
                       Mobile : <% =Mobile%>
                       </div>
                   
                    </div>
                </div>
                 <div class="header_bottom_right"> 
                  <br />
            <div>
                <asp:Label ID="lblordertitle" runat="server" Text="Order No : " Style="font-size: large"
                    ForeColor="Black" CssClass="lblfont"></asp:Label><span>
                        <asp:Label ID="lblOrderno" runat="server" Text="" Style="font-size: large" ForeColor="Black" CssClass="lblfont"></asp:Label></span>
                <div style="text-align: right; float:right;">
                    <span>   
                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="enjoy-css" OnClick="btnPrint_Click" Visible="false" /></span>
                </div>
            </div>
            <br />
            <div>
                <span>
                    <asp:Label ID="lblstatus" runat="server" Text="" Style="font-size: large" ForeColor="Black" CssClass="lblfont"></asp:Label></span>
            </div>
            <br />
            <div>
                <%-- <span><asp:Label ID="lblemailconfirm" runat="server" Text="Email Confirmation Sent to your email address" Style="font-size: large" ForeColor="Black"></asp:Label></span>--%></div>
            <div class="content">
                <%--   <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />--%>
                <telerik:RadGrid runat="server" AllowPaging="false" ID="RadGridDisplay" CommandItemStyle-Visible="false"
                    OnNeedDataSource="RadGridDisplay_NeedDataSource" AllowMultiRowSelection="false"
                    OnItemDataBound="RadGrid1_ItemDataBound" GridLines="None" Skin="Transparent"
                    ShowFooter="false" Width="100%" AllowSorting="true">
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
                            <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                <HeaderStyle Width="7%" HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Height="10px" />
                                <ItemTemplate>
                                    <img src="<%# Eval("imagePath") %>" alt="" style="float: left;" />
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
                                        <span>RM
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("DiscountPrice")%>' ToolTip='<%# Eval("PricingID")%>'
                                                Font-Size="Large"></asp:Label>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                <HeaderStyle Width="17%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <h2>
                                        <label id="Label1">
                                            Qty :
                                        </label>
                                        <asp:Label ID="cboQnty" runat="server" Text='<%# Eval("Qnty")%>' ToolTip='<%# Eval("ProductID")%>'> </asp:Label>
                                        <telerik:RadComboBox ID="cboQnty1" runat="server" Height="100px" Width="50px" DataValueField="Dept_ID"
                                            CssClass="textbox" EnableLoadOnDemand="true" AppendDataBoundItems="True" Text=' <%# Eval("Qnty") %>'
                                            AutoPostBack="true" Visible="false">
                                            <Items>
                                            </Items>
                                        </telerik:RadComboBox>
                                    </h2>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                <HeaderStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <ItemTemplate>
                                    <div class="price">
                                        <span>RM
                                            <asp:Label ID="lbltotal" runat="server" Text="" Style="font-size: large" ForeColor="Black" CssClass="lblfont"></asp:Label>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" PageButtonCount="4" />
                    </MasterTableView>
                    <ClientSettings>
                        <Scrolling AllowScroll="false" UseStaticHeaders="true" />
                    </ClientSettings>
                </telerik:RadGrid>
            </div>
            <div style="text-align: right;" >
                <label class="lblfont">Total Amount : </label>
                <asp:Label ID="lblTotal" runat="server" ForeColor="Green" Font-Bold="true"
                    Visible="true" CssClass="lblfont" />
                <br />
                <br />
                <label class="lblfont">Shipping Amount : </label>
                <asp:Label  ID="lblShippingCost" runat="server" ForeColor="Green"
                    Visible="true" Font-Bold="true" CssClass="lblfont" />
                <br />
                <br />
                 <asp:Label ID="lblGrand" runat="server" CssClass="lblfont" Text="Grand Total :"/>
                <asp:Label ID="lblGrandTotal" runat="server" ForeColor="Green" Font-Bold="true"
                    Visible="true" CssClass="lblfont" />
            </div>
            <br />
            <div style="text-align: right;">
                <span>
                    <asp:Button ID="btnMoreBuy" runat="server" Text="Buy More" CssClass="enjoy-css" OnClick="btnMoreBuy_Click" /></span>
            </div>
                 </div>
                 <div class="clear">
                </div>
                 </div>
        </div>
   
            <div class="main">
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
