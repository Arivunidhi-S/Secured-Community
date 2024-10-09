<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> FAQ </title> <link rel="shortcut icon" href="web/Images/Slogo.png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="web/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<%--<script type="text/javascript" src="web/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="web/js/move-top.js"></script>
<script type="text/javascript" src="web/js/easing.js"></script>--%>
<script type="text/javascript" src="web/js/jquery.accordion.js"></script>
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
		<div class="headertop_desc">
			<div class="call">
				 <p> <span class="lblfont">Need help?</span> email us <span class="lblfont">admin@fishmarket.com.qa</span></p>
			</div>
			    <div class="account_desc">
                    <ul> <li><a href="AccontInfo.aspx">My Account</a></li>
                        <li><a href="SellatEBB.aspx">Sell SeaFood</a></li>
                          <li><a href="CustomerMaster.aspx">Signup</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                   
                    </ul>
                </div>
			<div class="clear"></div>
		</div>
		<div class="header_top">
			 <!-- #Include file="IncludeHeader.html" -->
		
	 <div class="clear"></div>
  </div>
	<div class="header_bottom">
	     	<div class="menu">
	     		   <!-- #Include file="IncludeMenu.html" -->
	     	</div>
	     
	     	<div class="clear"></div>
	     </div>	     	
   </div>
 <div class="main">
    <div class="content">
    	
		<div class="faqs">
    	  <h2>Frequently Asked Questions</h2>	          	
            <div id="posts">
			    <div class="tab bar">
                    <h4 class="post-title">1.How do I become a member in FishMarket?</h4>
                </div>
			    <div class="panel margin-lr-7">
            		<p>If you are not a member of FishMarket, then please click the “Sign Up” link on the right top of our website.  Then click the “Buyer” box and register yourself with your details in the registration form.</p>
			    </div>		   
                <div class="tab bar">
                     <h4 class="post-title">2.Can I become a member in FishMarket without verifying my email?</h4>
                </div>
				<div class="panel margin-lr-7">
	        		 <p>No. You cannot be a member of FishMarket without your email verification. Email is our main source to contact you during your financial processing. So FishMarket will not encourage wrong or false email. Once you verify your email, you will become the official member of FishMarket.</p>
                </div>
                <div class="tab bar">
                     <h4 class="post-title">3.I have registered already. But I have not received the verification email from FishMarket</h4>
                </div>
				<div class="panel margin-lr-7">
	        		 <p>If you have not received the verification email from FishMarket, Please check in your spam folder (or) Junk folder. Still if you have not received then please contact or email to Customer Service for further assistance.</p>
                </div>
				<div class="tab bar">
                    <h4 class="post-title"> 4.Do I have to pay any amount to become member in FishMarket?</h4>
            	</div>
			 	<div class="panel margin-lr-7">
	        		<p>No need to pay. It’s free for you to become member in FishMarket. Once you become the member you are eligible to enjoy the offers and discounts provided by FishMarket.</p>
             	</div>
                <div class="tab bar">
                    <h4 class="post-title"> 5.Is there any limitation in age to join as FishMarket member?</h4>
                </div>
			    <div class="panel margin-lr-7">
	        	     <p>No. There is no age limit for joining as member in FishMarket.  However you should be aware of using your authorised/own Credit Card, Online Banking or other payment methods processed by FishMarket.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 6.How can I change my email address?</h4>
            	</div>
				<div class="panel margin-lr-7">
                      <p>You cannot change you email address. Your email address is used as login ID for you to login to FishMarket. In case if you register with wrong email address then please contact Customer Service for further assistance.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 7.Can I purchase any product without registering as member in FishMarket?</h4>
            	</div>
				<div class="panel margin-lr-7">
	        	     <p>No. You have to register as a member in order to make your purchase. However as a guest you are allowed to browse and add products to cart. But during the checkout process you have to login first.</p>
                </div>
                <div class="tab bar">
                    <h4 class="post-title"> 8.Can I purchase checkout multiple products together in FishMarket?</h4>
            	</div>
				<div class="panel margin-lr-7">
	        	     <p>Yes. You can checkout more than 1 products together. In fact this will save more time for you and can also avoid multiple payments.</p>
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
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
    </form>
</body>
</html>
