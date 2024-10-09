<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoriesMaster.aspx.cs"
    Inherits="CategoriesMaster" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Categories </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
        function checkchar(el) {
            var ex = /^[a-zA-Z0-9-. ]*$/;
            if (ex.test(el.value) == false) {
                el.value = el.value.substring(0, el.value.length - 1);
            }
        }
        function OnClientLoad(sender) {
            sender.get_inputDomElement().readOnly = "true";
        }
    </script>
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
                        <li class="active"><a href="CategoriesMaster.aspx?param=0">Category View</a></li>
                        <li><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li><a href="#">Product View</a></li>
                        <li><a href="OrderView.aspx?param=0">Order View</a></li>
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
    <div class="wrap">
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
                    <%-- <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />--%>
                    <h2>
                        Category Master</h2>
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        PageSize="25" AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true" Skin="Hay" EnableEmbeddedSkins="true"
                        OnInsertCommand="RadGrid1_InsertCommand" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                        OnItemDataBound="RadGrid1_OnItemDataBound" AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="CategoryID" CommandItemDisplay="Top"
                            CommandItemSettings-AddNewRecordText="Add Category Here" Visible="true">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="CategoryID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="CategoryID" UniqueName="CategoryID" AllowFiltering="false"
                                    AllowSorting="false" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BasicCategory" DataType="System.String" HeaderText="Basic Category"
                                    SortExpression="BasicCategory" UniqueName="BasicCategory">
                                    <HeaderStyle Width="50%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Category" DataType="System.String" HeaderText="Category"
                                    SortExpression="Category" UniqueName="Category">
                                    <HeaderStyle Width="50%" />
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
                                                    <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("CategoryID")%>' Visible="true" />
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Basic Categories:
                                            </td>
                                            <td align="left">
                                                <telerik:RadComboBox ID="cboBasicCategories" runat="server" Text='<%# Eval("BasicCategory")%>'
                                                    OnClientLoad="OnClientLoad" DataValueField="Dept_ID" CssClass="test" EnableLoadOnDemand="true"
                                                    AppendDataBoundItems="True" EmptyMessage="Select Basic Categories" OnItemsRequested="cboBasicCategories_OnItemsRequested">
                                                    <Items>
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </td>
                                            <td align="left">
                                                Categories:<asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Visible="true" />
                                                &nbsp;<img title="You don't use Special Character like ' \ / : * ? ' < > | '" src="../images/q.jpg"
                                                    style="float: inherit" alt="" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCategory" runat="server" class="textbox" Text='<%# Eval("Category")%>'
                                                    onkeyup="checkchar(this);"></asp:TextBox>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <%--<a href="#" id="toTop"><span id="toTopHover"></span></a>--%>
    </form>
</body>
</html>
