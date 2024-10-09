<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MasterProduct.aspx.cs" Inherits="MasterProduct" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product Master </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
     <link href="web/css/select.css" rel="stylesheet" type="text/css" media="all" />
    <%--    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>--%>
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
    <script type="text/javascript">
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
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
            padding: 5px 10px;
            border: 1px solid #c1011e;
            font: normal 14px/normal Arial, Helvetica, sans-serif;
            color: rgba(255,255,255,0.9);
            -o-text-overflow: clip;
            text-overflow: clip;
            background: #ba2518;
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
                <div class="call">
                    <p>
                         <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
                </div>
                <div class="account_desc">
                    <ul>
                        <li><a id="A1" runat="server">Welcome :</a>
                            <asp:Label ID="lblName" runat="server" Style="font-size: small"></asp:Label></li>
                        <li><a id="BtnLogout" onserverclick="BtnLogout_Click" runat="server">Logout</a></li>
                    </ul>
                </div>
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
                    <ul>
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="AboutUs.aspx">About</a></li>
                        <li><a href="Delivery.aspx">Delivery</a></li>
                        <li><a href="News.aspx">News</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                        <li><a href="AdminPage.aspx">Dashboard</a></li>
                        <%-- <li><a href="index.aspx">Logout</a></li>--%>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <telerik:RadScriptManager ID="ScriptManager1" runat="server" />
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <h2>
                        Add SeaFoods</h2>
                    <div style="text-align: center">
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <label>
                                        Basic Categories</label></span> <span>
                                            <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                            <telerik:RadComboBox ID="cboBasicCategories" runat="server" EnableLoadOnDemand="true" Skin="Hay"
                                                Width="300px" AutoPostBack="true" DropDownWidth="300px" AppendDataBoundItems="true"
                                                EmptyMessage="Select Basic Categories" OnItemsRequested="cboBasicCategories_OnItemsRequested">
                                                <Items>
                                                    <%--  <!-- #Include file="web/IncludecboCatagery.html" -->--%>
                                                </Items>
                                            </telerik:RadComboBox>
                                            <%--<asp:Button ID="btnedit" runat="server"  Text="Edit Products" onclientclick="redirect();"/>--%>
                                            <asp:LinkButton runat="server" ID="SomeLinkButton" href="MasterProductEdit.aspx"
                                                CssClass="enjoy-css" Visible="false">Edit Products</asp:LinkButton>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Categories</label></span> <span>
                                            <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                            <telerik:RadComboBox ID="cboCategories" runat="server" Width="300px" DropDownWidth="300px"  
                                                DataValueField="CategoryID" Skin="Hay" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                EmptyMessage="Select Categories" OnItemsRequested="cboCategory_OnItemsRequested">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                     <label style="float: left;padding-right:3px">
                                        English Name</label> &nbsp;<img title="You don't use Special Character like ' \ / : * ? ' < > | '"
                                            src="images/q.jpg" style="float:left" alt=""/></span> <span>
                                            <asp:TextBox ID="txtBrand" runat="server" class="textbox" onkeyup="checkchar(this);"></asp:TextBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                     <label style="float: left;padding-right:3px">
                                         Arab Name</label>&nbsp;<img title="You don't use Special Character like ' \ / : * ? ' < > | '"
                                            src="images/q.jpg" style="float:left" alt=""/></span> <span>
                                            <asp:TextBox ID="txtModel" runat="server" class="textbox" Visible="true" onkeyup="checkchar(this);"></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Actual Price</label></span> <span>
                                            <asp:TextBox ID="txtActualPrice" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Selling Price</label></span> <span>
                                            <%-- <telerik:RadNumericTextBox ID="txtPrice" MinValue="0" MaxValue="9999999999999999999999999"
                                                DbValue='<%# Bind("TenderValue") %>' MaxLength="10" ToolTip="Maximum Length: 20"
                                                runat="server" Class="textbox">
                                                <NumberFormat GroupSeparator="" DecimalDigits="2" />
                                            </telerik:RadNumericTextBox>--%>
                                            <asp:TextBox ID="txtSellingPrice" runat="server" class="textbox" onkeyup="checkDec(this);"  AutoPostBack="true" OnTextChanged="txtDiscount_OnTextChanged"></asp:TextBox></span>
                            </div>
                            
                            <div>
                                <span>
                                    <label>
                                        Discount Price</label></span> <span>
                                            <asp:TextBox ID="txtDiscountPrice" runat="server" class="textbox" onkeyup="checkDec(this);"   AutoPostBack="true" OnTextChanged="txtDiscount_OnTextChanged" ></asp:TextBox></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Discount (%)</label></span> <span>
                                            <asp:TextBox ID="txtDiscount" runat="server" MaxLength="2" class="textbox" onkeypress="return onlyNos(event,this);"
                                                Enabled="false"></asp:TextBox></span>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_3">
                        <div class="contact-form1">
                            <div>
                                <span>
                                    <label>
                                        Shipping Cost</label></span> <span>
                                            <asp:TextBox ID="txtShippingCost" runat="server" CssClass="csstext" onkeyup="checkDec(this);"></asp:TextBox>
                                        </span>
                            </div>
                            <div>
                               <%-- <span>
                                    <label>
                                        Weight(In Grams)</label></span>--%> <span>
                                            <asp:TextBox ID="txtWeight" runat="server" class="textbox" onkeyup="checkDec(this);" Visible="false"></asp:TextBox></span>
                            </div>
                            <div>
                               <%-- <span>
                                    <label>
                                        URL</label></span> --%><span>
                                            <asp:TextBox ID="txtURL" runat="server" class="textbox" Visible="false"></asp:TextBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Supplier</label></span> <span>
                                         
                                            <telerik:RadComboBox ID="cboSupplier" runat="server" Width="300px" DropDownWidth="300px"
                                                DataValueField="SupplierID" Skin="Hay" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                EmptyMessage="Select Supplier" OnItemsRequested="cboSupplier_OnItemsRequested" Visible="true">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Product Photo </label></span>  <span>
                                    <label style="color:Blue;font-weight:bold">
                                       (Note: Photo resolution must be 212x212)</label></span><span>
                                            <asp:FileUpload ID="flProductPhoto" runat="server" class="textbox" />
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Product Details</label></span> <span>
                                            <asp:TextBox ID="txtProductDetails" runat="server" TextMode="MultiLine" Height="60px"
                                                class="textbox"></asp:TextBox></span>
                            </div>
                            <div>
                               <%-- <span>
                                    <label>
                                        CatalogName</label></span>--%> <span>
                                         
                                                    <telerik:RadComboBox ID="txtCatalogName" runat="server" EnableLoadOnDemand="true"
                                                Width="300px" AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true"
                                                EmptyMessage="Select Catalog" OnItemsRequested="txtCatalogName_OnItemsRequested" Visible="false">
                                                <Items>
                                                 
                                                </Items>
                                            </telerik:RadComboBox>
                                                </span>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_OnClick" />  <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_OnClick" /></span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        <%--Product Photo--%></label></span> <span>
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="textbox" Visible="false" />
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="btntest" runat="server" Text="Test" OnClick="btntest_OnClick1" Visible="false" /></span>
                                <asp:Image ID="Img" runat="server" Visible="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #Include file="IncludeFooter.html" -->
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
