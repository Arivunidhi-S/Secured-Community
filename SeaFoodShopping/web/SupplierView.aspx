<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierView.aspx.cs" Inherits="SupplierView" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register </title>
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
                        <li><a href="Promotion.aspx">Promotion</a></li>
                        <li class="active"><a href="SupplierView.aspx">Supplier View</a></li>
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
                        Supplier View</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" OnItemCommand="RadGrid1_ItemCommand"
                        OnInsertCommand="RadGrid1_InsertCommand" AllowSorting="true" Skin="Hay" EnableEmbeddedSkins="true"
                        PagerStyle-Mode="NextPrevNumericAndAdvanced" AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="SupplierID" CommandItemDisplay="Top"
                            CommandItemSettings-AddNewRecordText="Add Approval Here" Visible="true">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="2%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="SupplierID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="SupplierID" UniqueName="SupplierID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SupplierName" DataType="System.String" HeaderText="Supplier Name"
                                    SortExpression="SupplierName" UniqueName="SupplierName">
                                    <HeaderStyle Width="15%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PersonIncharge" DataType="System.String" HeaderText="PersonIncharge"
                                    SortExpression="PersonIncharge" UniqueName="PersonIncharge">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Mobile" DataType="System.String" HeaderText="Mobile"
                                    SortExpression="Mobile" UniqueName="Mobile">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Email" DataType="System.String" HeaderText="Email/UserID"
                                    SortExpression="Email" UniqueName="Email">
                                    <HeaderStyle Width="15%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PostCode" DataType="System.String" HeaderText="PostCode"
                                    AllowFiltering="false" SortExpression="PostCode" UniqueName="PostCode">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="City" DataType="System.String" HeaderText="City"
                                    AllowFiltering="false" SortExpression="City" UniqueName="City">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="State" DataType="System.String" HeaderText="State"
                                    AllowFiltering="false" SortExpression="State" UniqueName="State">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton"
                                    ConfirmText="Are you sure want to delete?">
                                    <HeaderStyle Width="2%" />
                                </telerik:GridButtonColumn>
                            </Columns>
                            <EditFormSettings EditFormType="Template">
                                <EditColumn UniqueName="EditCommandColumn1">
                                </EditColumn>
                                <FormTemplate>
                                    <table cellspacing="2" cellpadding="1" width="100%" border="0">
                                        <tr>
                                            <td colspan="6">
                                                <b>ID:
                                                    <asp:Label ID="lblSupplierID" runat="server" Text='<%# Eval("SupplierID") %>' Visible="true"
                                                        Font-Bold="true" />
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Supplier Name:<label style="color: Red;">
                                                    *</label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtSupplierName" runat="server" class="textbox" Text='<%# Eval("SupplierName")%>'></asp:TextBox>
                                            </td>
                                            <td>
                                                Person Incharge:<label style="color: Red;">
                                                    *</label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPersonIncharge" runat="server" class="textbox" Text='<%# Eval("PersonIncharge")%>'></asp:TextBox>
                                            </td>
                                            <td>
                                                Contact No:<label style="color: Red;">
                                                    *</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtContactNo" runat="server" class="textbox" onkeyup="checkDec(this);"
                                                    Text='<%# Eval("Mobile")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Fax:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtFax" runat="server" class="textbox" Text='<%# Eval("Fax")%>'
                                                    onkeyup="checkDec(this);"></asp:TextBox>
                                            </td>
                                            <td>
                                                Email:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEmail" runat="server" class="textbox" Text='<%# Eval("Email")%>'></asp:TextBox>
                                            </td>
                                            <td>
                                                Address Line 1:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress1" runat="server" class="textbox" Text='<%# Eval("Address1")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address Line 2:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtAddress2" runat="server" class="textbox" Text='<%# Eval("Address2")%>'></asp:TextBox>
                                            </td>
                                            <td>
                                                PostCode:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPostCode" runat="server" class="textbox" onkeyup="checkDec(this);"
                                                    Text='<%# Eval("PostCode")%>'></asp:TextBox>
                                            </td>
                                            <td>
                                                City:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCity" runat="server" class="textbox" Text='<%# Eval("City")%>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                State:
                                            </td>
                                            <td align="left">
                                                <telerik:RadComboBox ID="cboState" runat="server" EnableLoadOnDemand="true" Text='<%# Eval("State")%>'
                                                    AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true" EmptyMessage="Select State">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="WP Kuala Lumpur" Value="WP Kuala Lumpur" />
                                                        <telerik:RadComboBoxItem Text="Johor" Value="Johor" />
                                                        <telerik:RadComboBoxItem Text="Kedah" Value="Kedah" />
                                                        <telerik:RadComboBoxItem Text="Kelantan" Value="Kelantan" />
                                                        <telerik:RadComboBoxItem Text="Melaka" Value="Melaka" />
                                                        <telerik:RadComboBoxItem Text="Negeri Sembilan" Value="Negeri Sembilan" />
                                                        <telerik:RadComboBoxItem Text="Pahang" Value="Pahang" />
                                                        <telerik:RadComboBoxItem Text="Penang" Value="Penang" />
                                                        <telerik:RadComboBoxItem Text="Perak" Value="Perak" />
                                                        <telerik:RadComboBoxItem Text="Perlis" Value="Perlis" />
                                                        <telerik:RadComboBoxItem Text="Sabah" Value="Sabah" />
                                                        <telerik:RadComboBoxItem Text="Sarawak" Value="Sarawak" />
                                                        <telerik:RadComboBoxItem Text="Selangor" Value="Selangor" />
                                                        <telerik:RadComboBoxItem Text="Terengganu" Value="Terengganu" />
                                                        <telerik:RadComboBoxItem Text="WP Labuan" Value="WP Labuan" />
                                                        <telerik:RadComboBoxItem Text="WP Putrajaya" Value="WP Putrajaya" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </td>
                                            <td>
                                                Country:
                                            </td>
                                            <td align="left">
                                                <telerik:RadComboBox ID="cboCountry" runat="server" EnableLoadOnDemand="true" AutoPostBack="false"
                                                    DropDownWidth="300px" AppendDataBoundItems="true" Text='<%# Eval("Country")%>'>
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="Malaysia" Value="Malaysia" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </td>
                                            <td>
                                                <%-- City:--%>
                                            </td>
                                            <td>
                                                <%--<asp:TextBox ID="TextBox3" runat="server" class="textbox"></asp:TextBox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
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
