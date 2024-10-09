<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManualSalesEntry.aspx.cs"
    Inherits="web_ManualSalesEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manual Sales Entry </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
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
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <li><a href="CategoriesMaster.aspx">Category View</a></li>
                        <li><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li><a href="ProductView.aspx">Product View</a></li>
                        <li><a href="OrderView.aspx">Order View</a></li>
                        <li><a href="Promotion.aspx">Promotion</a></li>
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
                    <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />--%>
                    <h2>
                        Manual Sales Entry</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnUpdateCommand="RadGrid1_UpdateCommand" AllowSorting="true" Skin="Sunset" EnableEmbeddedSkins="true"
                        PageSize="50" PagerStyle-Mode="NextPrevNumericAndAdvanced" AllowFilteringByColumn="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" OnInsertCommand="RadGrid1_InsertCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="ManualSalesID" CommandItemDisplay="Top"
                            Visible="true">
                            <CommandItemSettings ShowAddNewRecordButton="true" AddNewRecordText="Add Manual Sales" />
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true" HeaderText="Edit">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="ManualSalesID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="ManualSalesID" UniqueName="ManualSalesID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="orderno" DataType="System.String" HeaderText="Order No"
                                    SortExpression="orderno" UniqueName="orderno" FilterControlWidth="50px">
                                    <HeaderStyle Width="9%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="invoiceno" DataType="System.String" HeaderText="Invoice No"
                                    SortExpression="invoiceno" UniqueName="invoiceno" FilterControlWidth="50px">
                                    <HeaderStyle Width="9%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Customer" DataType="System.String" HeaderText="Customer"
                                    SortExpression="Customer" UniqueName="Customer" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Distributor" DataType="System.String" HeaderText="Distributor"
                                    SortExpression="Distributor" UniqueName="Distributor" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="paymentdate" DataType="System.DateTime" HeaderText="PaymentDate"
                                    AllowFiltering="false" SortExpression="paymentdate" UniqueName="paymentdate"
                                    Visible="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    <HeaderStyle Width="8%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Qnty" DataType="System.String" HeaderText="Qnty"
                                    SortExpression="Qnty" UniqueName="Qnty" AllowFiltering="false">
                                    <HeaderStyle Width="4%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalAmount" DataType="System.String" HeaderText="TotalAmount"
                                    SortExpression="TotalAmount" UniqueName="TotalAmount" AllowFiltering="false">
                                    <HeaderStyle Width="6%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Amount" DataType="System.String" HeaderText="Amount"
                                    SortExpression="Amount" UniqueName="Amount" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GST" DataType="System.String" HeaderText="GST"
                                    SortExpression="GST" UniqueName="GST" AllowFiltering="false">
                                    <HeaderStyle Width="4%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Description" DataType="System.String" HeaderText="Description"
                                    SortExpression="Description" UniqueName="Description" AllowFiltering="false">
                                    <HeaderStyle Width="15%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BankingDate" DataType="System.DateTime" HeaderText="BankingDate"
                                    AllowFiltering="false" SortExpression="BankingDate" UniqueName="BankingDate"
                                    Visible="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    <HeaderStyle Width="8%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DeliveryNo" DataType="System.String" HeaderText="DeliveryNo"
                                    SortExpression="DeliveryNo" UniqueName="DeliveryNo" AllowFiltering="false">
                                    <HeaderStyle Width="6%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Paid" AllowFiltering="false">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ChkPaid" Font-Size="13px" Enabled="false" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"Paid") is DBNull ? false : Eval("Paid"))%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                    ConfirmText="Are you sure want to delete?" HeaderText="Del">
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
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
                                                    <%# Eval("ManualSalesID")%>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Order No:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtOrderno" runat="server" class="textbox" Text='<%# Eval("Orderno")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Invoice No:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInvoiceno" runat="server" class="textbox" Text='<%# Eval("invoiceno")%>'
                                                    ></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Payment Date:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="DtPayment" runat="server" Width="150px" DateInput-EmptyMessage="Date"
                                                    Skin="Sunset" DbSelectedDate='<%# Bind("PaymentDate") %>' DateInput-DateFormat="dd/MMM/yyyy"
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
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Product Id:
                                                <%-- <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Visible="true" />--%>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtproductid" runat="server" class="textbox" Text='<%# Eval("productid")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Qnty:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQnty" runat="server" class="textbox" Text='<%# Eval("Qnty")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                UnitPrice:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtUnitPrice" runat="server" class="textbox" Text='<%# Eval("UnitPrice")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Total Amount:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTotalAmount" runat="server" class="textbox" Text='<%# Eval("TotalAmount")%>'
                                                    onkeyup="checkDec(this);" AutoPostBack="true" OnTextChanged="txtTotalAmount_TextChanged"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Amount:
                                                <%-- <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Visible="true" />--%>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAmount" runat="server" class="textbox" Text='<%# Eval("Amount")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                GST:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtGST" runat="server" class="textbox" Text='<%# Eval("GST")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Customer:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtCustomer" runat="server" class="textbox" Text='<%# Eval("Customer")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Distributor:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDistributor" runat="server" class="textbox" Text='<%# Eval("Distributor")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Banking Date:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="dtBanking" runat="server" Width="150px" DateInput-EmptyMessage="Date"
                                                    Skin="Sunset" DbSelectedDate='<%# Bind("BankingDate") %>' DateInput-DateFormat="dd/MMM/yyyy"
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
                                            <td align="left" valign="top">
                                                Remarks:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtRemarks" runat="server" class="textbox" Text='<%# Eval("Remarks")%>'
                                                    TextMode="MultiLine" Height="40px"></asp:TextBox>
                                            </td>
                                            <td align="left" valign="top">
                                                Description:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDescription" runat="server" class="textbox" Text='<%# Eval("Description")%>'
                                                    TextMode="MultiLine" Height="40px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Delivery No:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDeliveryNo" runat="server" class="textbox" Text='<%# Eval("DeliveryNo")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                Paid:
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:CheckBox ID="ChkPaidAmount" Font-Size="13px" runat="server" Checked='<%# (DataBinder.Eval(Container.DataItem,"Paid") is DBNull ? false : Eval("Paid"))%>' />
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
