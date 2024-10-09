<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel </title>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <%--<link rel="stylesheet" href="web/css/main.css"/>--%>
    <style type="text/css">
        .ih-item
        {
            position: relative;
            -webkit-transition: all 0.35s ease-in-out;
            -moz-transition: all 0.35s ease-in-out;
            transition: all 0.35s ease-in-out;
        }
        .ih-item, .ih-item *
        {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .ih-item a
        {
            color: #333;
        }
        .ih-item a:hover
        {
            text-decoration: none;
        }
        .ih-item img
        {
            width: 100%;
            height: 100%;
        }
        
        
        /* this is important for All Square */
        
        
        
        .ih-item.square
        {
            position: relative;
            width: 200px;
            height: 135px;
            border: 8px solid #fff;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }
        .ih-item.square .info
        {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            text-align: center;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
        }
        /* this is only for Effects */.ih-item.square.effect10
        {
            overflow: hidden;
        }
        .ih-item.square.effect10.colored .info
        {
            background: #1a4a72;
        }
        .ih-item.square.effect10.colored .info h3
        {
            background: rgba(12, 34, 52, 0.6);
        }
        .ih-item.square.effect10 .img
        {
            -webkit-transition: all 0.35s ease-in-out;
            -moz-transition: all 0.35s ease-in-out;
            transition: all 0.35s ease-in-out;
        }
        .ih-item.square.effect10 .info
        {
            background: #333333;
            visibility: hidden;
            opacity: 0;
            -webkit-transition: all 0.35s ease-in-out;
            -moz-transition: all 0.35s ease-in-out;
            transition: all 0.35s ease-in-out;
        }
        .ih-item.square.effect10 .info h3
        {
            text-transform: uppercase;
            color: #fff;
            text-align: center;
            font-size: 17px;
            padding: 10px;
            background: #111111;
            margin: 10px 0 0 0;
        }
        .ih-item.square.effect10 .info p
        {
            font-style: italic;
            font-size: 12px;
            position: relative;
            color: #bbb;
            padding: 20px 20px 20px;
            text-align: center;
        }
        .ih-item.square.effect10 a:hover .info
        {
            visibility: visible;
            opacity: 1;
        }
        .ih-item.square.effect10.left_to_right .img
        {
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            -ms-transform: translateX(0);
            -o-transform: translateX(0);
            transform: translateX(0);
        }
        .ih-item.square.effect10.left_to_right .info
        {
            -webkit-transform: translateX(-100%);
            -moz-transform: translateX(-100%);
            -ms-transform: translateX(-100%);
            -o-transform: translateX(-100%);
            transform: translateX(-100%);
        }
        .ih-item.square.effect10.left_to_right a:hover .img
        {
            -webkit-transform: translateX(100%);
            -moz-transform: translateX(100%);
            -ms-transform: translateX(100%);
            -o-transform: translateX(100%);
            transform: translateX(100%);
        }
        .ih-item.square.effect10.left_to_right a:hover .info
        {
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            -ms-transform: translateX(0);
            -o-transform: translateX(0);
            transform: translateX(0);
        }
        .ih-item.square.effect10.right_to_left .img
        {
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            -ms-transform: translateX(0);
            -o-transform: translateX(0);
            transform: translateX(0);
        }
        .ih-item.square.effect10.right_to_left .info
        {
            -webkit-transform: translateX(100%);
            -moz-transform: translateX(100%);
            -ms-transform: translateX(100%);
            -o-transform: translateX(100%);
            transform: translateX(100%);
        }
        .ih-item.square.effect10.right_to_left a:hover .img
        {
            -webkit-transform: translateX(-100%);
            -moz-transform: translateX(-100%);
            -ms-transform: translateX(-100%);
            -o-transform: translateX(-100%);
            transform: translateX(-100%);
        }
        .ih-item.square.effect10.right_to_left a:hover .info
        {
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            -ms-transform: translateX(0);
            -o-transform: translateX(0);
            transform: translateX(0);
        }
        .ih-item.square.effect10.top_to_bottom .img
        {
            -webkit-transform: translateY(0);
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -o-transform: translateY(0);
            transform: translateY(0);
        }
        .ih-item.square.effect10.top_to_bottom .info
        {
            -webkit-transform: translateY(-100%);
            -moz-transform: translateY(-100%);
            -ms-transform: translateY(-100%);
            -o-transform: translateY(-100%);
            transform: translateY(-100%);
        }
        .ih-item.square.effect10.top_to_bottom a:hover .img
        {
            -webkit-transform: translateY(100%);
            -moz-transform: translateY(100%);
            -ms-transform: translateY(100%);
            -o-transform: translateY(100%);
            transform: translateY(100%);
        }
        .ih-item.square.effect10.top_to_bottom a:hover .info
        {
            -webkit-transform: translateY(0);
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -o-transform: translateY(0);
            transform: translateY(0);
        }
        .ih-item.square.effect10.bottom_to_top .img
        {
            -webkit-transform: translateY(0);
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -o-transform: translateY(0);
            transform: translateY(0);
        }
        .ih-item.square.effect10.bottom_to_top .info
        {
            -webkit-transform: translateY(100%);
            -moz-transform: translateY(100%);
            -ms-transform: translateY(100%);
            -o-transform: translateY(100%);
            transform: translateY(100%);
        }
        .ih-item.square.effect10.bottom_to_top a:hover .img
        {
            -webkit-transform: translateY(-100%);
            -moz-transform: translateY(-100%);
            -ms-transform: translateY(-100%);
            -o-transform: translateY(-100%);
            transform: translateY(-100%);
        }
        .ih-item.square.effect10.bottom_to_top a:hover .info
        {
            -webkit-transform: translateY(0);
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -o-transform: translateY(0);
            transform: translateY(0);
        }
        
        .col-sm-6
        {
            position: relative;
            min-height: 1px;
            padding-left: 1px;
            padding-right: 1px;
            float: left;
            width: 1%;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/jquery.accordion.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#posts").accordion({
                header: "div.tab",
                alwaysOpen: false,
                autoheight: false
            });
        });
</script>
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
                        <li><a href="ProductView.aspx">Product View</a></li>
                        <li><a href="OrderView.aspx">Order View</a></li>
                        <li><a href="Promotion.aspx">Promotion</a></li>
                        <li><a href="SupplierView.aspx">Supplier View</a></li>
                        <li><a href="GetIPLocation.aspx">Get IPLocation</a></li>
                        <li><a href="ProductReviewView.aspx">Review</a></li>
                        <li><a href="AdminLogin.aspx">Logout</a></li>
                        <div class="clear">
                        </div>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
       <%-- <asp:Label Style="color: #000000; background-color: #ffffff; text-shadow: 2px 2px 0 #bcbcbc, 4px 4px 0 #9c9c9c;"
            ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="true" Text="EasyBuyBye Admin Panel"/>--%>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 left_to_right">
                                <a href="CategoriesMaster.aspx?param=0">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/CategoryMaster.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Category Master</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 left_to_right">
                                <a href="BusinessRegisterView.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Business.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Business View</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="ProductView.aspx?param=0">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/ProductsView.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Product View</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="OrderView.aspx?param=0">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/OrderView.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Order View</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section group">
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="Promotion.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Promotion.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Promotion</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="SupplierView.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Supplier.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                SupplierView</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="GetIPLocation.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/IP.jpg" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Get IPLocation</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="ProductReviewView.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Review.png" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Product Review</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="section group">
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="Catalog.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Catalog.png" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Catalog</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="ManualSalesEntry.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/ManualSale.png" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Manual Sales</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="Inventory.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Inventory.png" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Inventory</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%--<div class="grid_1_of_3 images_1_of_4">
                        <div class="col-sm-6">
                            <div class="ih-item square effect10 right_to_left">
                                <a href="ProductReviewView.aspx">
                                    <div class="spinner">
                                    </div>
                                    <div class="img">
                                        <img src="images/Review.png" alt="img"></div>
                                    <div class="info">
                                        <div class="info-back">
                                            <h3>
                                                Product Review</h3>
                                            <p>
                                                Click here</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <%-- <div class="footer">
        <div class="copy_right">
            <p>
                EasyBuyBye © All rights Reseverd
            </p>
        </div>
    </div>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
	</script>
    <a href="#" id="toTop"><span id="toTopHover"></span></a>
    </form>
</body>
</html>
