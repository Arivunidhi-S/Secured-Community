<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Promotion.aspx.cs" Inherits="web_Promotion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Promotion </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
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
                        <li class="active"><a href="Promotion.aspx">Promotion</a></li>
                        <li><a href="SupplierView.aspx">Supplier View</a></li>
                        <li><a href="GetIPLocation.aspx">Get IPLocation</a></li>
                        <li><a href="AdminPanel.aspx">Admin Panel</a></li>
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
                    <h2>
                        Promotion Master</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true" Skin="Hay" EnableEmbeddedSkins="true"
                        OnInsertCommand="RadGrid1_InsertCommand" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                        AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="PromotionID" CommandItemDisplay="Top"
                            CommandItemSettings-AddNewRecordText="Add Promotion Here" Visible="true">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="PromotionID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="PromotionID" UniqueName="PromotionID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PromotionCode" DataType="System.String" HeaderText="Promotion Code"
                                    SortExpression="PromotionCode" UniqueName="PromotionCode">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Description" DataType="System.String" HeaderText="Description"
                                    SortExpression="Description" UniqueName="Description">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Type" DataType="System.String" HeaderText="Type"
                                    SortExpression="Type" UniqueName="Type">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Discount" DataType="System.String" HeaderText="Discount"
                                    SortExpression="Discount" UniqueName="Discount">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Total" DataType="System.String" HeaderText="Total"
                                    SortExpression="Total" UniqueName="Total">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="FromDate" DataType="System.DateTime" HeaderText="From Date"
                                    AllowFiltering="false" SortExpression="FromDate" UniqueName="FromDate" Visible="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                    <HeaderStyle Width="8%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ToDate" DataType="System.DateTime" HeaderText="To Date"
                                    AllowFiltering="false" SortExpression="ToDate" UniqueName="ToDate" Visible="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                    <HeaderStyle Width="8%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                    ConfirmText="Are you sure want to delete?">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridButtonColumn>
                            </Columns>
                            <EditFormSettings EditFormType="Template">
                                <EditColumn UniqueName="EditCommandColumn1">
                                </EditColumn>
                                <FormTemplate>
                                    <table cellspacing="2" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td colspan="4">
                                                <b>ID:
                                                    <%# Eval("PromotionID")%>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                PromotionCode:
                                            </td>
                                            <td align="left">
                                                <%--<telerik:RadComboBox ID="cboBasicCategories" runat="server" Text='<%# Eval("Page")%>'
                                                        DataValueField="Dept_ID" CssClass="test" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                        EmptyMessage="Select Basic Categories">
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="Women Fashion" Value="Women Fashion" />
                                                            <telerik:RadComboBoxItem Text="Men Fashion" Value="Men Fashion" />
                                                            <telerik:RadComboBoxItem Text="Electronics" Value="Electronics" />
                                                            <telerik:RadComboBoxItem Text="Home & Living" Value="Home & Living" />
                                                            <telerik:RadComboBoxItem Text="Sports & Leisure" Value="Sports & Leisure" />
                                                            <telerik:RadComboBoxItem Text="Health & Beauty" Value="Health & Beauty" />
                                                            <telerik:RadComboBoxItem Text="Kids & Baby" Value="Kids & Baby" />
                                                            <telerik:RadComboBoxItem Text="Grocery" Value="Grocery" />
                                                            <telerik:RadComboBoxItem Text="Services & Books" Value="Services & Books" />
                                                        </Items>
                                                    </telerik:RadComboBox>--%>
                                                <asp:TextBox ID="txtPromotionCode" runat="server" class="textbox" Text='<%# Eval("PromotionCode")%>'></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Description:
                                                <%-- <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Visible="true" />--%>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDescription" runat="server" class="textbox" Text='<%# Eval("Description")%>'></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Type:
                                                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <telerik:RadComboBox ID="cboType" runat="server" Text='<%# Eval("Type")%>' DataValueField="Dept_ID"
                                                    Width="120px" CssClass="test" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                    EmptyMessage="Select Type" Skin="Sunset">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="RM" Value="RM" />
                                                        <telerik:RadComboBoxItem Text="Percentage" Value="Percentage" />
                                                        <telerik:RadComboBoxItem Text="Shipping" Value="Shipping" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Discount:
                                                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDiscount" runat="server" class="textbox" Text='<%# Eval("Discount")%>'></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Total:
                                                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTotal" runat="server" class="textbox" Text='<%# Eval("Total")%>'></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                FromDate:
                                                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="DtFrom" runat="server" Width="150px" DateInput-EmptyMessage="Date"
                                                    Skin="Sunset" DbSelectedDate='<%# Bind("FromDate") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                                    MinDate="01/01/1900">
                                                    <Calendar ID="Calendar1" runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-CssClass="rcToday" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                ToDate:
                                                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="DtTo" runat="server" Width="150px" DateInput-EmptyMessage="Date"
                                                    Skin="Sunset" DbSelectedDate='<%# Bind("ToDate") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                                    MinDate="01/01/1900">
                                                    <Calendar ID="Calendar2" runat="server">
                                                        <SpecialDays>
                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-CssClass="rcToday" />
                                                        </SpecialDays>
                                                    </Calendar>
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="Button1" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                                                    CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                                </asp:Button>
                                                <asp:Button ID="Button2" runat="server" Text="Cancel" CausesValidation="false" CommandName="Cancel">
                                                </asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </FormTemplate>
                            </EditFormSettings>
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
