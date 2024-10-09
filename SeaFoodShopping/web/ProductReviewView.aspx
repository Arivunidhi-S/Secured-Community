<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductReviewView.aspx.cs"
    Inherits="web_ProductReviewView" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Products Review </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <li><a href="CategoriesMaster.aspx?param=0">Category View</a></li>
                        <li><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li><a href="ProductView.aspx?param=0">Product View</a></li>
                        <li><a href="OrderView.aspx?param=0">Order View</a></li>
                        <li><a href="Promotion.aspx">Promotion</a></li>
                        <li><a href="SupplierView.aspx">Supplier View</a></li>
                        <li><a href="GetIPLocation.aspx">Get IPLocation</a></li>
                        <li><a href="ProductReviewView.aspx">Product Review</a></li>
                        <li><a href="AdminLogin.aspx">Logout</a></li>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div>
                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                        <Scripts>
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                        </Scripts>
                    </telerik:RadScriptManager>
                    <script type="text/javascript">
                    </script>
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
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
                    <h2 style="float: left">
                        Products Review</h2>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="enjoy-css" OnClick="btnUpdate_OnClick"
                        Style="float: right" />
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        PageSize="50" OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true" Skin="Hay"
                        EnableEmbeddedSkins="true" PagerStyle-Mode="NextPrevNumericAndAdvanced" AllowFilteringByColumn="true">
                        <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="false">
                            <Selecting AllowRowSelect="false" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="ReviewID" CommandItemDisplay="Top"
                            CommandItemSettings-ShowAddNewRecordButton="false" CommandItemSettings-AddNewRecordText="Add Approval Here"
                            Visible="true" CommandItemSettings-ShowRefreshButton="false">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="ReviewID" DataType="System.String" HeaderText="ReviewID"
                                    SortExpression="ReviewID" UniqueName="ReviewID" Visible="false">
                                    <ItemStyle HorizontalAlign="Left" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Product" AllowFiltering="false" Visible="true"
                                    UniqueName="Quantity">
                                    <HeaderStyle Width="3%" HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Height="10px" />
                                    <ItemTemplate>
                                        <img src="..\\<%# Eval("imagePath") %>" alt="" style="float: left;" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Brand" AllowFiltering="false" Visible="true"
                                    UniqueName="Quantity">
                                    <HeaderStyle Width="10%" HorizontalAlign="Left" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <label>
                                            <%# Eval("Brand") %>
                                            &nbsp;
                                            <%# Eval("Model")%>
                                        </label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Name" DataType="System.String" HeaderText="Review by"
                                    SortExpression="Name" UniqueName="Name" AllowFiltering="false">
                                    <HeaderStyle Width="7%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Rate" DataType="System.String" HeaderText="Rate"
                                    SortExpression="Rate" UniqueName="Rate" FilterControlWidth="50px">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReviewTitle" DataType="System.String" HeaderText="ReviewTitle"
                                    AllowFiltering="false" SortExpression="ReviewTitle" UniqueName="ReviewTitle">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ProductReview" DataType="System.String" HeaderText="ProductReview"
                                    AllowFiltering="false" SortExpression="ProductReview" UniqueName="ProductReview">
                                    <HeaderStyle Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Approve" AllowFiltering="false">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkApprove" Font-Size="13px" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"Approve") is DBNull ? false : Eval("Approve"))%>'
                                            ToolTip='<%# Eval("ReviewID") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                    HeaderText="Del" ConfirmText="Are you sure want to delete?">
                                    <HeaderStyle Width="2%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                        <PagerStyle Mode="NumericPages"></PagerStyle>
                    </telerik:RadGrid>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
