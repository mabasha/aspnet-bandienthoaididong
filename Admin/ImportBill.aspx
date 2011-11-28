<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 60%;
            height: 141px;
        }
        .style2
        {
        }
        .style3
        {
            width: 167px;
        }
        .style4
        {
            width: 100%;
            height: 135px;
        }
        .style5
        {
            width: 373px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header" align="center" 
        style="font-size: large; height: 62px; width: 1187px;">
        LẬP HÓA ĐƠN NHẬP</div>
    <div class="Add" style="height: 267px">
        <table align="center" class="style1">
            <tr>
                <td align="left" class="style3">
                    Ngày nhập :</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="style3">
                    Người nhập :</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Tên sản phẩm :</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Is Phone :</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Số lượng :</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Đơn giá nhập :</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style2" colspan="2">
                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="73px" />
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 140px; width: 993px">
        <table class="style4">
            <tr>
                <td class="style5">
                    <asp:GridView ID="gridImportBill" runat="server">
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="gridImportBillDt" runat="server" 
                        onselectedindexchanged="Grid_SelectedIndexChanged" Width="365px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
