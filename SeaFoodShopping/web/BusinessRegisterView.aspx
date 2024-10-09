<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusinessRegisterView.aspx.cs"
    Inherits="BusinessRegisterView" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <%--    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>--%>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="header">
            <div class="header_bottom">
                <div class="menu">
                    <ul>
                        <li><a href="CategoriesMaster.aspx?param=0">Category View</a></li>
                        <li class="active"><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li><a href="ProductView.aspx?param=0">Product View</a></li>
                        <li><a href="OrderView.aspx?param=0">Order View</a></li>
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
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
                    <h2>
                        Business Register View</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" 
                        PageSize="50" AllowSorting="true" Skin="Hay" EnableEmbeddedSkins="true" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                        AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="BusinessID" CommandItemDisplay="Top"
                            CommandItemSettings-ShowAddNewRecordButton="false" CommandItemSettings-AddNewRecordText="Add Approval Here"
                            Visible="true" CommandItemSettings-ShowRefreshButton="false">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="BusinessID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="BusinessID" UniqueName="BusinessID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" DataType="System.String" HeaderText="Contact Name"
                                    SortExpression="Name" UniqueName="Name">
                                    <HeaderStyle Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ICno" DataType="System.String" HeaderText="IC No"
                                    AllowFiltering="true" SortExpression="ICno" UniqueName="ICno" FilterControlWidth="40px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn DataField="Gender" DataType="System.String" HeaderText="Gender"
                                    SortExpression="Gender" UniqueName="Gender" FilterControlWidth="30px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn DataField="DOB" DataType="System.String" HeaderText="DOB"
                                    SortExpression="DOB" UniqueName="DOB" FilterControlWidth="40px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Contactno" DataType="System.String" HeaderText="Contact No"
                                    SortExpression="Contactno" UniqueName="Contactno">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Email" DataType="System.String" HeaderText="Email"
                                    AllowFiltering="true" SortExpression="Short_Name" UniqueName="Email">
                                    <HeaderStyle Width="20%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Password" DataType="System.String" HeaderText="Password"
                                    AllowFiltering="false" SortExpression="Password" UniqueName="Password">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SysRegno" DataType="System.String" HeaderText="SysRegno"
                                    AllowFiltering="false" SortExpression="SysRegno" UniqueName="SysRegno">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                              
                              <%--  <telerik:GridBoundColumn DataField="Regno" DataType="System.String" HeaderText="Business Regno"
                                    SortExpression="Regno" UniqueName="Regno">
                                    <HeaderStyle Width="20%" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridTemplateColumn Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMyKad" runat="server" Text='<%# Eval("MyKad") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblbankstatement" runat="server" Text='<%# Eval("bankstatement") %>'
                                            ForeColor="Red" Visible="true" />
                                        <asp:Label ID="lblutilitiesbill" runat="server" Text='<%# Eval("utilitiesbill") %>'
                                            ForeColor="Red" Visible="true" />
                                        <asp:Label ID="lblform9" runat="server" Text='<%# Eval("form9") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblform49" runat="server" Text='<%# Eval("form49") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblGSTApproval" runat="server" Text='<%# Eval("GSTApproval") %>' ForeColor="Red"
                                            Visible="true" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
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
                                                    <%# Eval("BusinessID")%>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                              <td align="left">
                                                Email:
                                            </td>
                                            <td align="left">
                                                <asp:TextBox runat="server" ID="txtemail" Text='<%# Eval("Email") %>'></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                Approval:
                                                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkApprove" runat="server" BorderColor="Salmon" Visible="true"
                                                    Checked='<%# (DataBinder.Eval(Container.DataItem,"Approve") is DBNull ? false : Eval("Approve"))%>'
                                                    ToolTip='<%# Eval("Email") %>' />
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
