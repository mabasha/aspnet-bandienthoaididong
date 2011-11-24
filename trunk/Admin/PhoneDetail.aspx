<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneDetail.aspx.cs" Inherits="Admin_PhoneDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 274px;
        }
        .style3
        {
            height: 274px;
            width: 200px;
        }
        .style4
        {
            height: 274px;
            width: 551px;
        }
        .style5
        {
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style3">
                    <asp:Image ID="img_Phone" runat="server" Height="200px" ImageAlign="Middle" 
                        Width="200px" />
                </td>
                <td class="style4">
                    <span class="style5">ĐIỆN THOẠI DI ĐỘNG : </span>
                    <asp:Label ID="lb_PhoneName" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    Giá bán : 
                    <asp:Label ID="lb_Price" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style2">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
