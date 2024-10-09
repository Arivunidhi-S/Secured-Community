<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product List</title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
     <script type="text/javascript">

         function checkDec(el) {
             var ex = /^[0-9]+\.?[0-9]*$/;
             if (ex.test(el.value) == false) {
                 el.value = el.value.substring(0, el.value.length - 1);
             }
         }
         function checkchar(el) {
             var ex = /^[a-zA-Z0-9-. ]*$/;
             if (ex.test(el.value) == false) {
                 el.value = el.value.substring(0, el.value.length - 1);
             }
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
                        <li><a href="CategoriesMaster.aspx?param=0">Category View</a></li>
                        <li><a href="BusinessRegisterView.aspx">Business View</a></li>
                        <li class="active"><a href="#">Product View</a></li>
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
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" />
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
                                    <telerik:AjaxUpdatedControl ControlID="imgMain" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
                    </telerik:RadAjaxManager>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
                    <h2>
                        Product List</h2>
                         <div style="float: right">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="enjoy-css" OnClick="btnUpdate_OnClick" />
                    </div><br />
                    <asp:Label class="labelstyle" ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" />
                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" OnNeedDataSource="RadGrid1_NeedDataSource"
                        GridLines="Vertical" AllowPaging="True" PagerStyle-AlwaysVisible="true" PagerStyle-Position="Bottom"
                        PageSize="50" AllowAutomaticUpdates="true" AllowAutomaticInserts="true" AllowAutomaticDeletes="true"
                        CommandItemStyle-Visible="false" OnItemCommand="RadGrid1_ItemCommand" AllowSorting="true"
                        Skin="Hay" EnableEmbeddedSkins="true" OnDeleteCommand="RadGrid1_DeleteCommand"
                        OnItemDataBound="RadGrid1_ItemDataBound" PagerStyle-Mode="NextPrevNumericAndAdvanced"
                        AllowFilteringByColumn="true" OnUpdateCommand="RadGrid1_UpdateCommand">
                        <ClientSettings EnableRowHoverStyle="true">
                            <Scrolling AllowScroll="false" UseStaticHeaders="false" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="ProductID" CommandItemDisplay="Top"
                            CommandItemSettings-ShowAddNewRecordButton="false" CommandItemSettings-AddNewRecordText="Add Approval Here"
                            Visible="true" ShowHeader="true" CommandItemSettings-ShowRefreshButton="false">
                            <PagerStyle Mode="Slider" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" Visible="true">
                                    <HeaderStyle Width="3%" />
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="ProductID" DataType="System.Int64" HeaderText="ID"
                                    ReadOnly="True" SortExpression="ProductID" UniqueName="ProductID" AllowFiltering="true"
                                    AllowSorting="true" Visible="true" FilterControlWidth="30px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ProductItemID" DataType="System.Int64" HeaderText="ProductItemID"
                                    ReadOnly="True" SortExpression="ProductItemID" UniqueName="ProductItemID" AllowFiltering="true"
                                    AllowSorting="true" Visible="false" FilterControlWidth="30px">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Product" AllowFiltering="false" Visible="true"
                                    UniqueName="Quantity">
                                    <HeaderStyle Width="3%" HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Height="10px" />
                                    <ItemTemplate>
                                        <img src="..\\<%# Eval("imagePath") %>" alt="" style="float: left;" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="BasicCategory" DataType="System.String" HeaderText="BasicCategory"
                                    SortExpression="BasicCategory" UniqueName="BasicCategory">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Category" DataType="System.String" HeaderText="Category"
                                    SortExpression="Category" UniqueName="Category">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Brand" DataType="System.String" HeaderText="EnglishName"
                                    SortExpression="Brand" UniqueName="Brand">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="Model" DataType="System.String" HeaderText="ArabName"
                                    SortExpression="Model" UniqueName="Model">
                                    <HeaderStyle Width="10%" />
                                </telerik:GridBoundColumn>
                                 <telerik:GridTemplateColumn HeaderText="ActualPrice" AllowFiltering="false">
                                    <HeaderStyle Width="5%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtActualPrice" runat="server" Text='<%# Eval("ActualPrice") %>'
                                            ToolTip='<%# Eval("ProductID") %>' Width="70px" onkeyup="checkDec(this);" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn HeaderText="SellingPrice" AllowFiltering="false">
                                    <HeaderStyle Width="5%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSellingPrice" runat="server" Text='<%# Eval("SellingPrice") %>'
                                            Width="70px" onkeyup="checkDec(this);"/>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn HeaderText="DiscountPrice" AllowFiltering="false">
                                    <HeaderStyle Width="5%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtDiscountPrice" runat="server" Text='<%# Eval("DiscountPrice") %>'
                                           Width="70px" onkeyup="checkDec(this);" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                              <%--  <telerik:GridBoundColumn DataField="ActualPrice" DataType="System.String" HeaderText="ActualPrice"
                                    SortExpression="ActualPrice" UniqueName="ActualPrice" FilterControlWidth="30px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SellingPrice" DataType="System.String" HeaderText="SellingPrice"
                                    SortExpression="SellingPrice" UniqueName="SellingPrice" FilterControlWidth="30px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DiscountPrice" DataType="System.String" HeaderText="Disc Price"
                                    SortExpression="DiscountPrice" UniqueName="DiscountPrice" FilterControlWidth="30px">
                                    <HeaderStyle Width="5%" />
                                </telerik:GridBoundColumn>--%>
                                <telerik:GridBoundColumn DataField="Discount" DataType="System.String" HeaderText="Disc(%)"
                                    SortExpression="Discount" UniqueName="Discount" FilterControlWidth="20px">
                                    <HeaderStyle Width="4%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMyKad" runat="server" Text='<%# Eval("imagePath") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblbankstatement" runat="server" Text='<%# Eval("Image1") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblutilitiesbill" runat="server" Text='<%# Eval("Image2") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblform9" runat="server" Text='<%# Eval("Image3") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblform49" runat="server" Text='<%# Eval("Image4") %>' ForeColor="Red"
                                            Visible="true" />
                                        <asp:Label ID="lblGSTApproval" runat="server" Text='<%# Eval("Image5") %>' ForeColor="Red"
                                            Visible="true" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="TotalStock" DataType="System.String" HeaderText="TotalStock"
                                    SortExpression="TotalStock" UniqueName="TotalStock" AllowFiltering="false">
                                    <HeaderStyle Width="5%" />
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
                                                <b></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                ID:
                                                <%--  System Registration Number:--%>
                                            </td>
                                            <td align="left">
                                                <%-- <%# Eval("ProductID")%>--%>
                                                <asp:Label ID="lblProductID" runat="server" Text='<%# Eval("ProductID") %>' Visible="true"
                                                    Font-Bold="true" ToolTip='<%# Eval("Name") %>' />
                                            </td>
                                            <td>
                                                Approval:
                                                <asp:Label ID="lblApprove" runat="server" Text="*" ForeColor="Red" Visible="true"
                                                    ToolTip='<%# Eval("Name") %>' />
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
                                            <td>
                                                Main Image:
                                            </td>
                                            <td align="left">
                                                <asp:LinkButton runat="server" ID="hyperlinkMyKad" NavigateUrl="#" Text='<%# Eval("imagePath") %>'
                                                    CommandName="imagePath"></asp:LinkButton>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("imagePath") %>' ForeColor="Red"
                                                    Visible="false" />
                                            </td>
                                            <td>
                                                Image1:
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="hyperlinkBank" NavigateUrl="#" Text='<%# Eval("Image1") %>'
                                                    CommandName="Image1"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Image2:
                                            </td>
                                            <td align="left">
                                                <asp:LinkButton runat="server" ID="hyperlinkUtilities" NavigateUrl="#" Text='<%# Eval("Image2") %>'
                                                    CommandName="Image2"></asp:LinkButton>
                                            </td>
                                            <td>
                                                Image3:
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="hyperlinkForm9" NavigateUrl="#" Text='<%# Eval("Image3") %>'
                                                    CommandName="Image3"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Image4:
                                            </td>
                                            <td align="left">
                                                <asp:LinkButton runat="server" ID="hyperlinkForm49" NavigateUrl="#" Text='<%# Eval("Image4") %>'
                                                    CommandName="Image4"></asp:LinkButton>
                                            </td>
                                            <td>
                                                Image5:
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="hyperlinkGSTApproval" NavigateUrl="#" Text='<%# Eval("Image5") %>'
                                                    CommandName="Image5"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Delete:
                                                <asp:CheckBox ID="chkdelete" runat="server" BorderColor="Salmon" Visible="true" Checked='<%# (DataBinder.Eval(Container.DataItem,"MasterDel") is DBNull ? false : Eval("MasterDel"))%>' />
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
