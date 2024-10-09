<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZoomImage.aspx.cs" Inherits="web_Zoom_ZoomImage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>E-Shopping More images</title>
    <link rel="shortcut icon" href="web/Images/Slogo.png" />
    <link rel="stylesheet" type="text/css" href="web/zoom/css/styleZoom.css" />
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <div class="bzoom_wrap">
  
        <ul id="bzoom">
            <% 
                if (image1.ToString() != "")
                { %>
            <li>
                <asp:Image class="bzoom_thumb_image" ID="Image1" runat="server" title="first img" />
                <asp:Image class="bzoom_big_image" ID="Image2" runat="server" />
            </li>
            <% } %>
            <% 
                if (image2.ToString() != "")
                { %>
            <li>
                <asp:Image class="bzoom_thumb_image" ID="Image3" runat="server" title="Second img" />
                <asp:Image class="bzoom_big_image" ID="Image4" runat="server" />
            </li>
            <% } %>
            <% 
                if (image3.ToString() != "")
                { %>
            <li>
                <asp:Image class="bzoom_thumb_image" ID="Image5" runat="server" title="Third img" />
                <asp:Image class="bzoom_big_image" ID="Image6" runat="server" />
            </li>
            <% } %>
            <% 
                if (image4.ToString() != "")
                { %>
            <li>
                <asp:Image class="bzoom_thumb_image" ID="Image7" runat="server" title="Forth img" />
                <asp:Image class="bzoom_big_image" ID="Image8" runat="server" />
            </li>
            <% } %>
            <% 
                if (image5.ToString() != "")
                { %>
            <li>
                <asp:Image class="bzoom_thumb_image" ID="Image9" runat="server" title="Fifth img" />
                <asp:Image class="bzoom_big_image" ID="Image10" runat="server" />
            </li>
            <% } %>
        </ul>
          <input  type="hidden" runat='server' id="param1" value="" />
    </div>
    </form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="web/zoom/js/jqzoom.js"></script>
<script type="text/javascript">
    $("#bzoom").zoom({
        zoom_area_width: 300,
        autoplay_interval: 3000,
        small_thumbs: document.getElementById("param1").value,
        autoplay: false
    });
</script>
</html>
