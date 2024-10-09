<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvoiceReport.aspx.cs" Inherits="web_InvoiceReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="shortcut icon" href="Images/Slogo.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Invoice</title>
</head>
<body>
    <br />
    <font face="Cambria Math">
        <table align="center" cellpadding="2" cellspacing="2" bgcolor="#000000" width="900">
            <tr bgcolor="#FFFFFF">
                <td rowspan="4" width="600" colspan="4">
                    <table>
                        <tr valign="top">
                            <td>
                                <img src="images/logo.png" alt="" />
                            </td>
                            <td>
                                <font size="+1"><b>Silver Star Fish Trading</b></font>
                                <%--<font size="1">(919896-A)</font>--%><br />
                                <font size="2">No 160, A4 , First floor, Retaj building<br />
                                    Near by Vegetable Market.<br />
                                    Doha, Qatar<br />
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                Tel
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;+974 33332768, &nbsp;+974 33381484
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Email
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;Ssfishtrading@gmail.com
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Website
                                            </td>
                                            <td>
                                                :
                                            </td>
                                            <td>
                                                &nbsp;www.fishmarket.com.qa
                                            </td>
                                        </tr>
                                    </table>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="150">
                    <font size="2">TAX INVOICE NO</font>
                </td>
                <td width="150" align="right">
                    <%= dtreport.Rows[0][0].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">DATE</font>
                </td>
                <td align="right">
                    <%= dtreport.Rows[0][1].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">ORDER NO</font>
                </td>
                <td align="right">
                    <%= dtreport.Rows[0][2].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td>
                    <font size="2">PAYMENT METHOD</font>
                </td>
                <td align="right">
                    <%= dtreport.Rows[0][19].ToString()%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="6" align="center">
                    <b><font size="+2">
                        <asp:Label ID="lbltitle" runat="server" Text="Label"></asp:Label></font></b>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="6">
                    <font size="2">&nbsp;<b>SHIPPING TO :</b></font><br />
                    <br />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                &nbsp; &nbsp; &nbsp;
                            </td>
                            <td>
                                <b>
                                    <%= dtreport.Rows[0][3].ToString()%>&nbsp;</b><br />
                                <%= dtreport.Rows[0][4].ToString()%><br />
                                <%= dtreport.Rows[0][5].ToString()%><br />
                                <%= dtreport.Rows[0][6].ToString()%>
                                &nbsp;<%= dtreport.Rows[0][7].ToString()%><br />
                                <%= dtreport.Rows[0][8].ToString()%>&nbsp;<%= dtreport.Rows[0][9].ToString()%><br />
                                <br />
                                Phone:&nbsp;<%= dtreport.Rows[0][10].ToString()%><br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td width="100">
                    <b>ITEM</b>
                </td>
                <td width="400">
                    <b>DESCRIPTION</b>
                </td>
                <td width="50">
                    <b>CUTTING</b>
                </td>
                <td width="100">
                    <b>QUANTITY</b>
                </td>
                <td width="150">
                    <b>UNIT PRICE</b>
                </td>
                <td width="150">
                    <b>AMOUNT (QAR)</b>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td colspan="6">
                    <table cellpadding="5" cellspacing="5">
                        <%
                            int cnt = 1; decimal tot = 0, grndtot = 0;

                            cnt = dtreport.Rows.Count;

                            for (int i = 0; i < dtreport.Rows.Count; i++)
                            {
                                tot = Convert.ToDecimal(dtreport.Rows[i][15].ToString());
                                grndtot = grndtot + tot;
                                string cutting = string.Empty;
                                if (dtreport.Rows[i][20].ToString() == "False")
                                {
                                    cutting = "✘";
                                }
                                else
                                {
                                    cutting = "✔";
                                }
                                                      
                        %>
                        <tr bgcolor="#FFFFFF" align="center">
                            <td width="100">
                                <%=i+1%>
                            </td>
                            <td width="400">
                                <%=dtreport.Rows[i][11].ToString()%>
                                &nbsp;
                                <%=dtreport.Rows[i][12].ToString()%>
                            </td>
                            <td width="50" align="right">
                                <%=cutting%>
                            </td>
                            <td width="100" align="right">
                                <%=dtreport.Rows[i][13].ToString()%>
                                kg
                            </td>
                            <td width="150" align="right">
                                <%=Convert.ToDecimal(dtreport.Rows[i][14]).ToString("#0.00")%>&nbsp;
                            </td>
                            <td width="150" align="right">
                                <%=Convert.ToDecimal(dtreport.Rows[i][15]).ToString("#0.00")%>&nbsp;
                            </td>
                        </tr>
                        <%
                            }
                            if (cnt < 15)
                                for (int i = 1; i < (15 - cnt); i++)
                                {
                        %>
                        <tr bgcolor="#FFFFFF" align="center">
                            <td colspan="5">
                                &nbsp;
                            </td>
                        </tr>
                        <% }
                        %>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td colspan="4" align="left" valign="top">
                    Customer Copy
                </td>
                <td>
                    <b>GRAND TOTAL</b>
                </td>
                <td align="right">
                    <%=Math.Round(grndtot,2)%>&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center">
                <td colspan="6">
                    <font size="+4"><b>www.fishmarket.com.qa</b></font>
                </td>
            </tr>
        </table>
        <br />
        <font size="2">
            <table align="center" cellpadding="2" cellspacing="2" width="900">
                <tr>
                    <td width="450" align="left">
                        This is a computer generated invoice. No signature is required.<br />
                        <br />
                    </td>
                </tr>
            </table>
        </font>
</body>
</html>
