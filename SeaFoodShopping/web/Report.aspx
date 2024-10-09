<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>
<%@ Register Assembly="Stimulsoft.Report.Web, Version=2011.2.1100.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a"
    Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
    <br />
   <%-- <div id="divrepo" class="text" style="background: -webkit-linear-gradient(#dbf6e3,#f2e9b0);
        border: 4px solid Black; width: 100%; height:auto;  overflow: auto; box-shadow: 3px 5px 6px rgba(0,0,0,0.5);">
        <br />--%>
        <cc1:stiwebviewer id="StiWebViewer1" runat="server" rendermode="UseCache" scrollbarsmode="true"
            width="100%" height="1000px" />
       <%-- <br />
    </div>--%>
    </form>
</body>
</html>
