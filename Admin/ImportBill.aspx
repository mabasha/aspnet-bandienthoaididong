<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 98%;
            height: 343px;
            margin-left: 0px;
        }
        .style2
        {
        }
        .style3
        {
        }
        .style4
        {
            width: 97%;
            height: 135px;
        }
        .style5
        {
        }
        .style6
        {
            width: 5px;
        }
        .style8
        {
        }
        .style10
        {
            width: 268435344px;
            height: 52px;
        }
        .style13
        {
            width: 5px;
            height: 26px;
        }
        .style14
        {
            width: 370px;
            height: 52px;
        }
        .style18
        {
            width: 370px;
            height: 26px;
        }
        .style19
        {
        }
        .style20
        {
            height: 20px;
        }
        .style21
        {
            height: 24px;
        }
        .style23
        {
            width: 268435344px;
            height: 26px;
        }
        .style24
        {
            width: 268435344px;
        }
        .style25
        {
            width: 98%;
            height: 181px;
        }
        .style26
        {
            width: 337px;
        }
        .style27
        {
            width: 370px;
        }
        .style28
        {
            width: 148px;
        }
        .style29
        {
            width: 148px;
            height: 26px;
        }
        .style30
        {
            width: 636px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header" align="center" 
        style="font-size: large; height: 62px; width: 1000px;">
        LẬP HÓA ĐƠN NHẬP</div>
    <div class="Add" style="height: 496px; width: 999px;">
        <table align="center" class="style1">
            <tr>
                <td align="center" class="style3" colspan="2" width="400">
                    HÓA ĐƠN NHẬP</td>
                <td align="center" class="style8" colspan="2" width="500">
                    CHI TIẾT HÓA ĐƠN NHẬP</td>
            </tr>
            <tr>
                <td align="left" class="style20" colspan="2" width="400">
                    </td>
                <td class="style20" colspan="2" width="500">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style28" width="400">
                    Người nhập :</td>
                <td class="style6">
                    <asp:DropDownList ID="dNguoiNhap" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="FullName" DataValueField="FullName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [FullName] FROM [Users]"></asp:SqlDataSource>
                </td>
                <td class="style14" width="500">
                    Mã hóa đơn :</td>
                <td class="style10" width="500">
                    <asp:DropDownList ID="dMaHD" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="ID" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [ID] FROM [ImportBill]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style29" width="400">
                    Ngày nhập :</td>
                <td class="style13">
                    <asp:TextBox ID="txtNgaynhap" runat="server" Width="190px"></asp:TextBox>
                </td>
                <td class="style18" width="500">
                    Tên sản phẩm :</td>
                <td class="style23" width="500">
                    <asp:TextBox ID="txtTenSp" runat="server" Width="190px" ></asp:TextBox>
                    <asp:Button ID="btnTenSp" runat="server" Text="Chọn sản phẩm" />
                </td>
            </tr>
            <tr>
                <td class="style21" colspan="2" width="400">
                    </td>
                <td class="style27" rowspan="2" width="500">
                    Loại sản phẩm :</td>
                <td class="style24" rowspan="2" width="500">
                    <asp:RadioButtonList ID="rLoaiSp" runat="server" Width="124px" >
                        <asp:ListItem Selected="True">Điện thoại</asp:ListItem>
                        <asp:ListItem>Phụ kiện</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style3" align="center" colspan="2" width="400">
                    <asp:Button ID="btnAddHD" runat="server" Text="Thêm" Width="73px" />
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2" width="400">
                    &nbsp;</td>
                <td class="style27" width="500">
                    Số lượng :</td>
                <td class="style24" width="500">
                    <asp:TextBox ID="txtNumber" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2" width="400">
                    &nbsp;</td>
                <td class="style27" width="500">
                    Đơn giá nhập :</td>
                <td class="style24" width="500">
                    <asp:TextBox ID="txtPrice" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" class="style2" colspan="2" width="400">
                    &nbsp;</td>
                <td align="center" class="style19" colspan="2" width="500">
                    <asp:Button ID="btnAddCTHD" runat="server" Text="Thêm" Width="74px" 
                        onclick="btnAddCTHD_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 268px; width: 1000px; margin-bottom: 0px;" class="list">
        <table class="style4">
            <tr>
                <td class="style5" align="center">
                    <table class="style25">
                        <tr>
                            <td class="style26">
                                <asp:Label ID="lbThongbaoHD" runat="server"></asp:Label>
                            </td>
                            <td class="style30">
                                <asp:Label ID="lbThongbaoCTHD" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style26">
                                <asp:GridView ID="gridImportBill" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    onrowcancelingedit="gridImportBill_RowCancelingEdit" 
                                    onrowdatabound="gridImportBill_RowDataBound" 
                                    onrowediting="gridImportBill_RowEditing">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                                        <asp:BoundField DataField="FullName" HeaderText="Người nhập" />
                                        <asp:BoundField DataField="CreatedDate" HeaderText="Ngày nhập" />
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
                            <td class="style30">
                    <asp:GridView ID="gridImportBillDt" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                                    onrowcancelingedit="gridImportBillDt_RowCancelingEdit" 
                                    onrowediting="gridImportBillDt_RowEditing" 
                                    onrowdatabound="gridImportBillDt_RowDataBound1" 
                                    onrowdeleting="gridImportBillDt_RowDeleting"                         >
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Mã CTHĐ" />
                            <asp:BoundField DataField="ImportBillID" HeaderText="Mã HĐ" />
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
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
