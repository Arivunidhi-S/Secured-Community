<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductItemMaster.aspx.cs"
    Inherits="ProductItemMaster" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Products Item Master </title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="web/js/move-top.js"></script>
    <script type="text/javascript" src="web/js/easing.js"></script>
    <style type="text/css">
        .enjoy-css
        {
            display: inline-block;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            cursor: pointer;
            padding: 5px 15px;
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
        
        .search
        {
            background: url(images/Reject.png) no-repeat;
            background-position: center;
        }
    </style>
    <script type="text/javascript">

        function checkDec(el) {
            var ex = /^[0-9]+\.?[0-9]*$/;
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
                <%--  <div class="search_box">
                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" /><input
                        type="submit" value="" />
                </div>--%>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                <h2>
                                Add Stocks and Images</h2>
                    <div class="grid_1_of_3 images_1_of_3">
                        <div class="contact-form1">
                            
                            <div>
                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                <span>
                                    <label>
                                        Basic Categories</label></span> <span>
                                            <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                            <telerik:RadComboBox ID="cboBasicCategories" runat="server" EnableLoadOnDemand="true"
                                                Width="300px" AutoPostBack="true" DropDownWidth="300px" AppendDataBoundItems="true"
                                                OnItemsRequested="cboBasicCategories_OnItemsRequested" EmptyMessage="Select Basic Categories"
                                                OnSelectedIndexChanged="cboBasicCategories_SelectedIndexChanged">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Categories</label></span> <span>
                                            <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                            <telerik:RadComboBox ID="cboCategories" runat="server" Width="300px" 
                                                DropDownWidth="300px" DataValueField="Dept_ID" CssClass="textbox" EnableLoadOnDemand="true"
                                                AutoPostBack="true" AppendDataBoundItems="True" EmptyMessage="Select Categories"
                                                OnItemsRequested="cboCategory_OnItemsRequested">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                       English Name</label></span> <span>
                                            <telerik:RadComboBox ID="cboBrand" runat="server" Width="300px" OnItemsRequested="cboBrand_OnItemsRequested"
                                                DropDownWidth="300px" DataValueField="Dept_ID" CssClass="textbox" EnableLoadOnDemand="true"
                                                AutoPostBack="true" AppendDataBoundItems="True" EmptyMessage="Select English Name" OnSelectedIndexChanged="cboBrand_OnSelectedIndexChanged">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Arab Name</label></span> <span>
                                            <telerik:RadComboBox ID="cboModel" runat="server" Width="300px" DropDownWidth="300px" OnItemsRequested="cboModel_OnItemsRequested"
                                                DataValueField="Dept_ID" Visible="true" EnableLoadOnDemand="true" AppendDataBoundItems="True" OnSelectedIndexChanged="cboModel_SelectedIndexChanged"
                                                EmptyMessage="Select Arab Name" 
                                                AutoPostBack="true">
                                                <Items>
                                                </Items>
                                            </telerik:RadComboBox>
                                        </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Total Stock</label></span> <span>
                                            <asp:TextBox ID="txtTotalStock" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox>
                                        </span>
                            </div>
                          
                            <div>
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Add Product" class="myButton" OnClick="btnAddProduct_OnClick" /></span>
                            </div>
                        </div>
                    </div>

                    <div class="grid_1_of_3 images_1_of_3">
                        <div class="contact-form1">
                          <div><span>  <label style="color:Blue;font-weight:bold">
                                       (Note: Photo shape must be portrait and image size is less than 2MB)</label></span>
                                <span>
                                    <label>
                                        Image 1</label></span> <span>
                                            <asp:FileUpload ID="FileImage1" runat="server" class="textbox" /></span>
                                <asp:LinkButton ID="lnkDownload1" Font-Size="13px" runat="server" Visible="true"
                                    ForeColor="Red" OnClick="lnkDownload1_OnClick" CommandName="Download" />
                                <asp:Button runat="server" ID="btnclikrjt1" Font-Size="Smaller" ForeColor="Red" Text=" "
                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt1_Onclick" />
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Image 2</label></span> <span>
                                            <asp:FileUpload ID="FileImage2" runat="server" class="textbox" /></span>
                                <asp:LinkButton ID="lnkDownload2" Font-Size="13px" runat="server" Visible="true"
                                    ForeColor="Red" OnClick="lnkDownload2_OnClick" CommandName="Download" />
                                <asp:Button runat="server" ID="btnclikrjt2" Font-Size="Smaller" ForeColor="Red" Text=" "
                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt2_Onclick" />
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Image 3</label></span> <span>
                                            <asp:FileUpload ID="FileImage3" runat="server" class="textbox" />
                                        </span>
                                <asp:LinkButton ID="lnkDownload3" Font-Size="13px" runat="server" Visible="true"
                                    ForeColor="Red" OnClick="lnkDownload3_OnClick" CommandName="Download" />
                                <asp:Button runat="server" ID="btnclikrjt3" Font-Size="Smaller" ForeColor="Red" Text=" "
                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt3_Onclick" />
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Image 4</label></span> <span>
                                            <asp:FileUpload ID="FileImage4" runat="server" class="textbox" /></span>
                                <asp:LinkButton ID="lnkDownload4" Font-Size="13px" runat="server" Visible="true"
                                    ForeColor="Red" OnClick="lnkDownload4_OnClick" CommandName="Download" />
                                <asp:Button runat="server" ID="btnclikrjt4" Font-Size="Smaller" ForeColor="Red" Text=" "
                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt4_Onclick" />
                            </div>
                            <div>
                                <span>
                                    <label>
                                        Image 5</label></span> <span>
                                            <asp:FileUpload ID="FileImage5" runat="server" class="textbox" /></span>
                                <asp:LinkButton ID="lnkDownload5" Font-Size="13px" runat="server" Visible="true"
                                    ForeColor="Red" OnClick="lnkDownload5_OnClick" CommandName="Download" />
                                <asp:Button runat="server" ID="btnclikrjt5" Font-Size="Smaller" ForeColor="Red" Text=" "
                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt5_Onclick" />

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
    <%--<a href="#" id="toTop"><span id="toTopHover"></span></a>--%>
    </form>
</body>
</html>
