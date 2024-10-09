<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Catalog </title>
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
                            <%--<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />--%>
                        </Scripts>
                    </telerik:RadScriptManager>
                    <script type="text/javascript">
                    </script>
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                                    <telerik:AjaxUpdatedControl ControlID="txtQtyIn" />
                                    <telerik:AjaxUpdatedControl ControlID="txtUnitPrice" />
                                    <telerik:AjaxUpdatedControl ControlID="txtTotalPrice" />
                                    <telerik:AjaxUpdatedControl ControlID="lblStatus" />
                                    <telerik:AjaxUpdatedControl ControlID="lnkCalc" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
                    </telerik:RadAjaxManager>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
                    <h2>
                        Catalog Master</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        PageSize="25" AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true" Skin="Sunset" EnableEmbeddedSkins="true"
                        OnInsertCommand="RadGrid1_InsertCommand" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                        AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="Catalogid" CommandItemDisplay="Top"
                            CommandItemSettings-AddNewRecordText="Add Catalog Here" Visible="true">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="Catalogid" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="Catalogid" UniqueName="Catalogid" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="indate" DataType="System.DateTime" HeaderText="Date"
                                    AllowFiltering="false" SortExpression="indate" UniqueName="indate" Visible="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                    <HeaderStyle Width="8%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CatalogName" DataType="System.String" HeaderText="Catalog Name"
                                    SortExpression="CatalogName" UniqueName="CatalogName">
                                    <HeaderStyle Width="15%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="QtyIn" DataType="System.String" HeaderText="Qty In"
                                    SortExpression="QtyIn" UniqueName="QtyIn" AllowFiltering="false">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.String" HeaderText="UnitPrice"
                                    SortExpression="UnitPrice" UniqueName="UnitPrice" AllowFiltering="false">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPrice" DataType="System.String" HeaderText="Total Price"
                                    SortExpression="TotalPrice" UniqueName="TotalPrice" AllowFiltering="false">
                                    <HeaderStyle Width="15%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Damage" DataType="System.String" HeaderText="Damage"
                                    SortExpression="Damage" UniqueName="Damage" AllowFiltering="false">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Remarks" DataType="System.String" HeaderText="Remarks"
                                    SortExpression="Remarks" UniqueName="Remarks" AllowFiltering="false">
                                    <HeaderStyle Width="15%" />
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
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>ID:</b>
                                            </td>
                                            <td>
                                                <b>
                                                    <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("Catalogid")%>' Visible="true" />
                                                </b>
                                            </td>
                                            <td>
                                                Date:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="Dtindate" runat="server" Width="150px" DateInput-EmptyMessage="Date"
                                                    Skin="Sunset" DbSelectedDate='<%# Bind("indate") %>' DateInput-DateFormat="dd/MMM/yyyy"
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
                                                Catalog Name:
                                            </td>
                                            <td align="left">
                                                <telerik:RadTextBox ID="txtCatalogName" runat="server" class="textbox" Text='<%# Eval("CatalogName")%>'>
                                                </telerik:RadTextBox>
                                            </td>
                                            <td align="left">
                                                Qnty:
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtQtyIn" runat="server" class="textbox" Text='<%# Eval("QtyIn")%>'
                                                    onkeyup="checkDec(this);">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Unit Price:
                                            </td>
                                            <td align="left">
                                                <telerik:RadTextBox ID="txtUnitPrice" runat="server" class="textbox" Text='<%# Eval("UnitPrice")%>'
                                                    onkeyup="checkDec(this);" TextMode="SingleLine" AutoPostBack="true" OnTextChanged="txtUnitPrice_TextChanged">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td align="left">
                                                Total Price:
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="txtTotalPrice" runat="server" class="textbox" Text='<%# Eval("TotalPrice")%>'
                                                    Enabled="false">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                Damage:
                                            </td>
                                            <td valign="top">
                                                <telerik:RadTextBox ID="txtDamage" runat="server" class="textbox" Text='<%# Eval("Damage")%>'
                                                    onkeyup="checkDec(this);">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td align="left" valign="top">
                                                Remarks:
                                            </td>
                                            <td align="left">
                                                <telerik:RadTextBox ID="txtRemarks" runat="server" class="textbox" Text='<%# Eval("Remarks")%>'
                                                    TextMode="MultiLine" Height="40px">
                                                </telerik:RadTextBox>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <%--<a href="#" id="toTop"><span id="toTopHover"></span></a>--%>
    </form>
</body>
</html>
