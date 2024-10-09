<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCart.aspx.cs" Inherits="AddCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AddCart</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="web/css/VMenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/script1.js"></script>
    <script type="text/javascript">
        function checkDec(el) {
            var ex = /^[0-9]+\.?[0-9]*$/;
            if (ex.test(el.value) == false) {
                el.value = el.value.substring(0, el.value.length - 1);
            }
        }

        function OnClientLoad(sender) {
            sender.get_inputDomElement().readOnly = "true";
        }

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
                <div class="call lblfont">
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
                        <li><a id="btnShopCart" runat="server">
                            <img src="images/cart.png" alt="" style="top: 5px; position: relative; width: 18px;
                                height: 18px;" />
                            <asp:Label runat="server" ID="lblcart" Font-Size="16px" Text="0"></asp:Label></a></li>
                        <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">
                            <asp:Label ID="lblLog" runat="server" Text="" Style="font-size: small"></asp:Label></a></li>
                    </ul>
                </div>
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                    <Scripts>
                        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                    </Scripts>
                </telerik:RadScriptManager>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
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
                    <div class="content">
                        <telerik:RadGrid runat="server" AllowPaging="false" ID="RadGridDisplay" CommandItemStyle-Visible="false"
                            OnNeedDataSource="RadGridDisplay_NeedDataSource" AllowMultiRowSelection="false"
                            OnUpdateCommand="RadGridDisplay_UpdateCommand" OnDeleteCommand="RadGridDisplay_DeleteCommand"
                            OnItemDataBound="RadGrid1_ItemDataBound" GridLines="Both" Skin="Hay" ShowFooter="false"
                            Width="100%" AllowSorting="true">
                            <MasterTableView DataKeyNames="AddcartID" EditMode="EditForms" AutoGenerateColumns="false"
                                CommandItemDisplay="None" Width="100%" ShowHeader="false">
                                <CommandItemSettings ShowAddNewRecordButton="false" AddNewRecordText="ADD NEW ITEMS"
                                    ShowRefreshButton="false" />
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
                                            <asp:HiddenField ID="hdpricingid" runat="server" Value='<%# Eval("PricingID")%>' />
                                            <img src="<%# Eval("imagePath") %>" alt="" style="float: left;" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="20%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <h2>
                                                <%-- <label id="test">
                                                    <%# Eval("Category")%>
                                                    &nbsp;
                                                    <%# Eval("Brand")%>
                                                </label>--%>
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
                                                <h2>
                                                    <span>QAR
                                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("DiscountPrice")%>' Font-Size="Large"></asp:Label>
                                                    </span>
                                                </h2>
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
                                                <span>
                                                    <asp:Label ID="cboQnty" runat="server" Text='<%# Eval("Qnty") %>' Font-Size="16px"></asp:Label></span>
                                            </h2>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditButton">
                                        <HeaderStyle Width="2%" />
                                    </telerik:GridEditCommandColumn>
                                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false" Visible="true" UniqueName="Quantity">
                                        <HeaderStyle Width="15%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <div class="price">
                                                <h2>
                                                    <span>QAR
                                                        <asp:Label ID="lbltotal" runat="server" Text="" Style="font-size: large"></asp:Label></span>
                                                </h2>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridButtonColumn CommandName="Delete" Visible="true" UniqueName="DeleteColumn"
                                        ButtonType="ImageButton" ConfirmText="Are you sure want to delete?">
                                        <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings EditFormType="Template">
                                    <EditColumn UniqueName="EditCommandColumn1">
                                    </EditColumn>
                                    <FormTemplate>
                                        <table cellspacing="2" cellpadding="1" width="100%" border="0">
                                            <tr>
                                                <td align="right">
                                                    <h2>
                                                        <label>
                                                            Quantity :</label></h2>
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="cboQnty1" runat="server" Width="75px" Height="20px" Font-Size="16px"
                                                        Font-Bold="true" BorderStyle="Solid" Style="border-color: #00C31A" onkeyup="checkDec(this);"></asp:TextBox>
                                                    (In kgs)
                                                    <%--  <telerik:RadComboBox ID="cboQnty1" runat="server" Width="50px" DataValueField="Dept_ID"
                                                        CssClass="textbox" EnableLoadOnDemand="true" AppendDataBoundItems="false" Text=' <%# Eval("Qnty") %>'
                                                        AutoPostBack="false" OnSelectedIndexChanged="cboQnty_OnSelectedIndexChanged"
                                                        ToolTip='<%# Eval("ProductID")%>' OnItemsRequested="cboQuantity_OnItemsRequested"
                                                        Visible="true" OnClientLoad="OnClientLoad">
                                                        <Items>
                                                        </Items>
                                                    </telerik:RadComboBox>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="Button1" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Modify" %>'
                                                        CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                                    </asp:Button>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="Button2" runat="server" Text="Cancel" CausesValidation="false" CommandName="Cancel">
                                                    </asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </FormTemplate>
                                </EditFormSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" PageButtonCount="4" />
                            </MasterTableView>
                            <ClientSettings>
                                <Scrolling AllowScroll="false" UseStaticHeaders="false" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </div>
                    <table width="100%" cellpadding="100px" cellspacing="100px" border="5">
                        <tr>
                            <td>
                                <div class="contact-form1 lblfont" style="text-align: left;">
                                    If you have the promotion code enter here:
                                    <br />
                                    <br />
                                    <span>
                                        <asp:TextBox ID="txtPCode" runat="server" class="textbox"></asp:TextBox></span>
                                    <span>
                                        <br />
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="enjoy-css" OnClick="btnSubmit_OnClick" /></span>
                                </div>
                            </td>
                            <td>
                                <div style="text-align: right;" class="lblfont">
                                    Total Amount :
                                    <asp:Label class="labelstyle" ID="lblTotal" runat="server" ForeColor="Green" Font-Bold="true" /><br />
                                    <br />
                                    <asp:Label class="labelstyle" ID="lblPRA" runat="server" ForeColor="Black" Font-Bold="false" />
                                    <asp:Label class="labelstyle" ID="lblpromotion" runat="server" ForeColor="Green"
                                        Font-Bold="true" />
                                    Shipping Amount :
                                    <asp:Label class="labelstyle" ID="lblShippingCost" runat="server" ForeColor="Green"
                                        Font-Bold="true" /><br />
                                    <br />
                                    Grand Total :
                                    <asp:Label class="labelstyle" ID="lblGrandTotal" runat="server" ForeColor="Green"
                                        Font-Bold="true" />
                                </div>
                                <br />
                                <div style="text-align: right;">
                                    <asp:Label class="labelstyle" ID="lblstatus" runat="server" ForeColor="Red" />
                                    <span>&nbsp;&nbsp;
                                        <asp:Button ID="btnbuy" runat="server" Text="Buy Now" CssClass="enjoy-css" OnClick="btnbuy_OnClick" /></span>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <%--<div class="main">
        </div>--%>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <%-- <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>--%>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
