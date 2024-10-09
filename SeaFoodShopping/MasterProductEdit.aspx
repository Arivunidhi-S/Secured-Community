<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MasterProductEdit.aspx.cs"
    Inherits="MasterProductEdit" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product Master Edit</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="web/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
                        Edit SeaFoods</h2>
                    <div style="text-align: center">
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="section group">
                        <div class="grid_1_of_3 images_1_of_3">
                            <div class="contact-form1">
                                <div>
                                    <span>
                                        <label>
                                            Enter Product Id</label></span> <span style="float: left; padding-right: 5px;">
                                                <asp:TextBox ID="txtProductID" runat="server" class="textbox" Width="100px"></asp:TextBox>
                                            </span><span>
                                                <asp:Button ID="btnEdit" runat="server" Text="Edit" Style="padding: 5px 10px 5px 10px;"
                                                    OnClick="btnEdit_Onclick" />
                                            </span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            Basic Categories</label></span> <span>
                                                <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                                <telerik:RadComboBox ID="cboBasicCategories" runat="server" EnableLoadOnDemand="true"
                                                    OnSelectedIndexChanged="cboBasicCategories_OnSelectedIndexChanged" Width="300px"
                                                    Visible="false" AutoPostBack="true" DropDownWidth="300px" AppendDataBoundItems="true"
                                                    EmptyMessage="Select Basic Categories" OnItemsRequested="cboBasicCategories_OnItemsRequested">
                                                    <Items>
                                                    </Items>
                                                </telerik:RadComboBox>
                                                <asp:Label ID="lblBasicCategories" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
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
                                                    OnSelectedIndexChanged="cboCategory_OnSelectedIndexChanged" AutoPostBack="true"
                                                    Visible="false" DataValueField="CategoryID" CssClass="test" EnableLoadOnDemand="true"
                                                    AppendDataBoundItems="True" EmptyMessage="Select Categories" OnItemsRequested="cboCategory_OnItemsRequested">
                                                    <Items>
                                                    </Items>
                                                </telerik:RadComboBox>
                                                <asp:Label ID="lblCategories" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                                            </span>
                                </div>
                                <div>
                                    <span>
                                        <label style="float: left; padding-right: 3px">
                                           English Name</label>
                                        <img title="You don't use Special Character like ' \ / : * ? ' < > | '" src="images/q.jpg"
                                            style="float: left" alt="" /></span> <span>
                                                <telerik:RadComboBox ID="cboBrand" runat="server" Width="300px" DropDownWidth="300px"
                                                    OnSelectedIndexChanged="cboBrand_OnSelectedIndexChanged" AutoPostBack="true"
                                                    Visible="false" DataValueField="CategoryID" CssClass="test" EnableLoadOnDemand="true"
                                                    AppendDataBoundItems="True" EmptyMessage="Select Brand" OnItemsRequested="cboBrand_OnItemsRequested">
                                                    <Items>
                                                    </Items>
                                                </telerik:RadComboBox>
                                                <asp:TextBox ID="txtBrand" runat="server" class="textbox" onkeyup="checkchar(this);"></asp:TextBox>
                                            </span>
                                </div>
                                <div>
                                    <span>
                                          <label style="float: left;padding-right:3px">
                                            Arab Name</label><img title="You don't use Special Character like ' \ / : * ? ' < > | '"
                                                src="images/q.jpg" style="float: left" alt="" /></span>
                                    <span>
                                        <telerik:RadComboBox ID="cboModel" runat="server" Width="300px" DropDownWidth="300px"
                                            OnSelectedIndexChanged="cboModel_SelectedIndexChange" AutoPostBack="true" DataValueField="CategoryID"
                                            CssClass="test" EnableLoadOnDemand="true" AppendDataBoundItems="True" EmptyMessage="Select Model"
                                            OnItemsRequested="cboModel_OnItemsRequested" Visible="false">
                                            <Items>
                                            </Items>
                                        </telerik:RadComboBox>
                                        <asp:TextBox ID="txtModel" runat="server" class="textbox" Visible="true" onkeyup="checkchar(this);"></asp:TextBox>
                                    </span>
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
                                                <asp:TextBox ID="txtSellingPrice" runat="server" class="textbox" onkeyup="checkDec(this);"></asp:TextBox></span>
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
                                    <%--  <span>
                                        <label>
                                            Weight(In Grams)</label></span> --%><span>
                                                <asp:TextBox ID="txtWeight" runat="server" class="textbox" onkeyup="checkDec(this);"
                                                    Visible="false"></asp:TextBox></span>
                                </div>
                                <div>
                                    <%--<span>
                                        <label>
                                            URL &nbsp;(<asp:HyperLink ID="lnkURL" runat="server" Target="_blank">Click here to view URL</asp:HyperLink>)</label></span>
                                    --%><span>
                                        <asp:TextBox ID="txtURL" runat="server" class="textbox" Visible="false"></asp:TextBox>
                                    </span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            Supplier</label></span> <span>
                                                <%--  <asp:DropDownList ID="cboCategories" runat="server" class="mydropdown" Height="33px"
                                                Width="684px">
                                            </asp:DropDownList>--%>
                                                <telerik:RadComboBox ID="cboSupplier" runat="server" Width="300px" DropDownWidth="300px"
                                                    DataValueField="SupplierID" CssClass="test" EnableLoadOnDemand="true" AppendDataBoundItems="True"
                                                    EmptyMessage="Select Supplier" OnItemsRequested="cboSupplier_OnItemsRequested">
                                                    <Items>
                                                    </Items>
                                                </telerik:RadComboBox>
                                            </span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            Product Details</label></span> <span>
                                                <asp:TextBox ID="txtProductDetails" runat="server" TextMode="MultiLine" Height="90px"
                                                    class="textbox"></asp:TextBox></span>
                                </div>
                                 <div>
                                    <span>
                                        <label>
                                            Product Photo</label></span><span>  <label style="color:Blue;font-weight:bold">
                                       (Note: Photo resolution must be 212x212)</label></span><span>
                                                <asp:FileUpload ID="flProductPhoto" runat="server" class="textbox" />
                                                <asp:LinkButton ID="lnkDownload1" Font-Size="13px" runat="server" Visible="true"
                                                    ForeColor="Red" OnClick="lnkDownload1_OnClick" CommandName="Download" />
                                                <asp:Button runat="server" ID="btnclikrjt1" Font-Size="Smaller" ForeColor="Red" Text=" "
                                                    BorderStyle="None" Style="background: url(images/Reject.png) no-repeat; background-position: center;"
                                                    AutoPostBack="true" Width="25px" Height="20px" OnClick="btnclikrjt1_Onclick" />
                                            </span>
                                </div>
                                <div>
                                    <span>
                                        <asp:Button ID="Button1" runat="server" Text="Update Product" OnClick="btnAddProduct_OnClick" /></span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            <%--Product Photo--%></label></span> <span>
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="textbox" Visible="false" />
                                            </span>
                                </div>
                                <div>
                                    <%-- <span>
                                        <label>
                                            CatalogName</label></span>--%>
                                    <span>
                                        <%--<asp:TextBox ID="txtCatalogName" runat="server" class="textbox" TextMode="MultiLine"
                                                    Height="70px"></asp:TextBox>--%>
                                        <telerik:RadComboBox ID="txtCatalogName" runat="server" EnableLoadOnDemand="true"
                                            Width="300px" AutoPostBack="false" DropDownWidth="300px" AppendDataBoundItems="true"
                                            EmptyMessage="Select Catalog" OnItemsRequested="txtCatalogName_OnItemsRequested"
                                            Visible="false">
                                            <Items>
                                            </Items>
                                        </telerik:RadComboBox>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="grid_1_of_3 images_1_of_3">
                            <div class="contact-form1">
                                <div>
                                    <span>
                                        <asp:Button ID="btntest" runat="server" Text="Test" OnClick="btntest_OnClick1" Visible="false" /></span>
                                    <asp:Image ID="Img" runat="server" Visible="true" />
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                    </div>
                    <div class="col span_1_of_3">
                        <%--	<div class="col span_1_of_3">
					<div class="contact_info">
    	 				<h3>Find Us Here</h3>
					    	  <div class="map">
							   	    <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
							  </div>
      				</div>
      			<div class="company_address">
				     	<h3>Company Information :</h3>
						    	<p>500 Lorem Ipsum Dolor Sit,</p>
						   		<p>22-56-2-9 Sit Amet, Lorem,</p>
						   		<p>USA</p>
				   		<p>Phone:(00) 222 666 444</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <span>info@mycompany.com</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>--%>
                    </div>
                    <div class="col span_1_of_3">
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
