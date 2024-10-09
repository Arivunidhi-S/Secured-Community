<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderView.aspx.cs" Inherits="OrderView" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Order List </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
      
</head>
<body oncontextmenu="return false;">
    <div class="wrap">
        <div class="header">
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <%
                            if (param == "0")
                            {
                        %>
                        <li><a href="CategoriesMaster.aspx?param=0">Category View</a></li>
                        <li><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li><a href="ProductView.aspx?param=0">Product View</a></li>
                        <li class="active"><a href="#">Order View</a></li>
                        <li><a href="Promotion.aspx">Promotion</a></li>
                        <li><a href="SupplierView.aspx">Supplier View</a></li>
                        <li><a href="GetIPLocation.aspx">Get IPLocation</a></li>
                        <li><a href="AdminPanel.aspx">Admin Panel</a></li>
                        <li><a href="AdminLogin.aspx">Logout</a></li>
                        <%
                        }
                        else
                        {
                            
                        %>
                        <li><a href="../index.aspx">Home</a></li>
                        <li><a href="../AboutUs.aspx">About</a></li>
                        <li><a href="../Delivery.aspx">Delivery</a></li>
                        <li><a href="../News.aspx">News</a></li>
                        <li><a href="../Contact.aspx">Contact</a></li>
                        <li><a href="../AdminPage.aspx">Dashboard</a></li>
                        <%
                            }
                        %>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadInputManager1" />
                    <telerik:AjaxUpdatedControl ControlID="lblStatus" />
                    <telerik:AjaxUpdatedControl ControlID="hyperlinkMyKad" />
                    <telerik:AjaxUpdatedControl ControlID="Label2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="wrap">
        <div class="main">
            <div class="content">
                <div>
                    <script type="text/javascript">
                    </script>
                    <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />--%>
                    <h2>
                        Order List</h2>
                    <div style="float: right">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="enjoy-css" OnClick="btnUpdate_OnClick" />
                    </div>
                    <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        PageSize="50" OnItemCommand="RadGrid1_ItemCommand" AllowSorting="true" Skin="Hay"
                        EnableEmbeddedSkins="true" PagerStyle-Mode="NextPrevNumericAndAdvanced" AllowFilteringByColumn="true">
                        <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="false">
                            <Selecting AllowRowSelect="false" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="OrderNo" CommandItemDisplay="Top"
                            CommandItemSettings-ShowAddNewRecordButton="false" CommandItemSettings-AddNewRecordText="Add Approval Here"
                            Visible="true" CommandItemSettings-ShowRefreshButton="false">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="AddcartID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="AddcartID" UniqueName="AddcartID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ProductID" DataType="System.String" HeaderText="ProductID"
                                    SortExpression="ProductID" UniqueName="ProductID" Visible="false">
                                    <ItemStyle HorizontalAlign="Left" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="CustomerID" HeaderText="CustomerID" HeaderButtonType="TextButton"
                                    DataField="CustomerID" UniqueName="CustomerID" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrderNo" DataType="System.String" HeaderText="Order No"
                                    SortExpression="OrderNo" UniqueName="OrderNo" FilterControlWidth="50px">
                                    <HeaderStyle Width="7%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OrderName" DataType="System.String" HeaderText="Customer Name"
                                    SortExpression="OrderName" UniqueName="OrderName">
                                    <HeaderStyle Width="12%" />
                                </telerik:GridBoundColumn>
                                <%--  <telerik:GridBoundColumn DataField="OrderEmail" DataType="System.String" HeaderText="Buyer Email"
                                    SortExpression="OrderEmail" UniqueName="OrderEmail">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="Mobile" DataType="System.String" HeaderText="Contact No"
                                    SortExpression="Mobile" UniqueName="Mobile" FilterControlWidth="50px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Brand" DataType="System.String" HeaderText="Brand"
                                    SortExpression="Brand" UniqueName="Brand" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <%--      <telerik:GridBoundColumn DataField="Model" DataType="System.String" HeaderText="Model"
                                    AllowFiltering="true" SortExpression="Short_Name" UniqueName="Email">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Size" DataType="System.String" HeaderText="Size"
                                    AllowFiltering="false" SortExpression="Size" UniqueName="Size">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridTemplateColumn HeaderText="Cutting" AllowFiltering="false">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ChkCutting" Font-Size="13px" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"cutting") is DBNull ? false : Eval("cutting"))%>'
                                           Enabled="false" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Qnty" DataType="System.String" HeaderText="Qnty"
                                    AllowFiltering="false" SortExpression="Qnty" UniqueName="Qnty">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DiscountPrice" DataType="System.String" HeaderText="Price"
                                    SortExpression="DiscountPrice" UniqueName="DiscountPrice" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPrice" DataType="System.String" HeaderText="TotalPrice"
                                    SortExpression="TotalPrice" UniqueName="TotalPrice" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Shipped" AllowFiltering="false">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ChkShipped" Font-Size="13px" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"Shipped") is DBNull ? false : Eval("Shipped"))%>'
                                            ToolTip='<%# Eval("AddcartID") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Deliverd" AllowFiltering="false">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ChkDeliverd" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"Deliver") is DBNull ? false : Eval("Deliver"))%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridButtonColumn ButtonType="LinkButton" CommandArgument="Invoice" CommandName="Invoice"
                                    FilterControlAltText="Filter watch column" HeaderText="Invoice" Text="InvoiceNo"
                                    DataTextField="InvoiceNo" UniqueName="InvoiceNo">
                                    <HeaderStyle Width="5%" HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                                <telerik:GridBoundColumn DataField="PayMethod" DataType="System.String" HeaderText="PaymentMethod"
                                    AllowFiltering="true" SortExpression="PayMethod" UniqueName="PayMethod">
                                    <HeaderStyle Width="7%" />
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <PagerStyle Mode="NumericPages"></PagerStyle>
                    </telerik:RadGrid>
                    <br />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
