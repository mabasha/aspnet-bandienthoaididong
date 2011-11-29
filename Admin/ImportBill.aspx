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
                    <asp:TextBox ID="txtNgaynhap" runat="server" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="style3">
                    Người nhập :</td>
                <td>
                    <asp:DropDownList ID="dNguoiNhap" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="FullName" DataValueField="FullName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [FullName] FROM [Users]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Tên sản phẩm :</td>
                <td>
                    <asp:TextBox ID="txtTenSp" runat="server" Width="190px"></asp:TextBox>
                    <asp:Button ID="btnTenSp" runat="server" Text="Chọn sản phẩm" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Loại sản phẩm :</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Selected="True">Điện thoại</asp:ListItem>
                        <asp:ListItem>Phụ kiện</asp:ListItem>
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
                <td class="style5" align="center">
                    <asp:GridView ID="gridImportBill" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None"                         >
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Mã hóa đơn" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Ngày nhập" />
                            <asp:BoundField DataField="Name" HeaderText="Tên sản phẩm" />
                            <asp:BoundField DataField="IsPhone" HeaderText="Loại sản phẩm" />
                            <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                            <asp:BoundField DataField="Price" HeaderText="Đơn giá nhập" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                                ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
