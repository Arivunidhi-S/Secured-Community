<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inventory.aspx.cs" Inherits="web_Inventory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>EasyBuyBye</title>
    <style>
        td
        {
            border-left: 1;
        }
    </style>
</head>
<body>
    <br />
    <font face="Arial, Helvetica, sans-serif" />
    <table align="center" cellpadding="2" cellspacing="2" bgcolor="#000000" width="1000">
        <tr bgcolor="#FFFFFF" >
            <td colspan="2"  align="center">
                <img src="images/logo2.png" alt="" />
            </td>
            <td colspan="7" align="center">
                <b><font size="+2">
                    <asp:Label ID="lbltitle" runat="server" Text="Inventory"></asp:Label></font></b>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF" align="center">
            <td width="25">
                <b>ITEM</b>
            </td>
            <td width="300">
                <b>DESCRIPTION</b>
            </td>
            <td width="70">
                <b>IN(Qty)</b>
            </td>
            <td width="70">
                <b>OUT(Qty)</b>
            </td>
            <td width="70">
                <b>BAL(Qty)</b>
            </td>
            <td width="100">
                <b>UNIT PRICE</b>
            </td>
            <td width="100">
                <b>TOTAL AMOUNT</b>
            </td>
            <td width="100">
                <b>INVENTORY AT SOLD</b>
            </td>
            <td width="100">
                <b>INVENTORY AT WAREHOUSE</b>
            </td>
        </tr>
      <%--  <tr bgcolor="#FFFFFF" align="center">
            <td colspan="9">
                <table cellpadding="2" cellspacing="2" bgcolor="#000000">--%>
                    <%
                        int TotalOut = 0, Balance = 0, TotCatalog = 0, TotManual = 0; decimal TotalAmount = 0;
                        int cnt = dtCatalogMaster.Rows.Count;
                        for (int i = 0; i < dtCatalogMaster.Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(dtCatalogMaster.Rows[i][0].ToString());
                            TotCatalog = sumcatalog(id);
                            TotManual = sumManual(id);
                            TotalOut = TotCatalog + TotManual;
                            Balance = Convert.ToInt32(dtCatalogMaster.Rows[i][2].ToString()) - TotalOut;
                            TotalAmount = Convert.ToDecimal(TotalOut) * Convert.ToDecimal(dtCatalogMaster.Rows[i][3].ToString());                                     
                    %>
                    <tr bgcolor="#FFFFFF" align="center">
                        <td width="25">
                            <%=i+1%>
                        </td>
                        <td width="300"  align="left">
                            <%=dtCatalogMaster.Rows[i][1].ToString()%>
                        </td>
                        <td width="70">
                            <%=dtCatalogMaster.Rows[i][2].ToString()%>
                        </td>
                        <td width="70">
                            <%=TotalOut.ToString()%>
                        </td>
                        <td width="70">
                            <%=Balance%>
                        </td>
                        <td width="100" align="right">
                            <%=dtCatalogMaster.Rows[i][3].ToString()%>&nbsp;
                        </td>
                        <td width="100" align="right">
                            <%=dtCatalogMaster.Rows[i][4].ToString()%>&nbsp;
                        </td>
                        <td width="100" align="right">
                            <%=Math.Round(TotalAmount, 2)%>&nbsp;
                        </td>
                        <td width="100" align="right">
                            <%=Math.Round(Convert.ToDecimal(Balance) * Convert.ToDecimal(dtCatalogMaster.Rows[i][3].ToString()), 2)%>&nbsp;
                        </td>
                    </tr>
                    <%
                        }
                        //if (cnt < 38)
                        //    for (int i = 1; i < (38 - cnt); i++)
                        //    {
                    %>
                   <%-- <tr bgcolor="#FFFFFF" align="center">
                        <td colspan="5">
                            &nbsp;
                        </td>
                    </tr>--%>
                    <%--<%}%>--%>
               <%-- </table>
            </td>
        </tr>--%>
    </table>
</body>
</html>
