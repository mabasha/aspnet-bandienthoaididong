<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style4
        {
            width: 97%;
            height: 135px;
        }
        .style5
        {
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
        .style30
        {
            width: 636px;
        }
        .style31
        {
            width: 549px;
        }
        .style32
        {
            width: 271px;
        }
        .style33
        {
            height: 53px;
        }
        .style34
        {
            height: 62px;
        }
        .style35
        {
            height: 55px;
        }
        .style36
        {
            height: 52px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header" align="center" 
        style="font-size: large; height: 62px; width: 1000px;">
        LẬP HÓA ĐƠN NHẬP</div>
    <div class="Add" style="height: 540px; width: 1011px;">
        <table style="width:62%; height: 434px;" align="center">
            <tr>
                <td align="center" colspan="2" class="style34">
                    HÓA ĐƠN NHẬP</td>
            </tr>
            <tr>
                <td class="style32">
                    Người Nhập :</td>
                <td class="style31">
                    <asp:DropDownList ID="dNguoiNhap" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="FullName" DataValueField="Username" 
                        onselectedindexchanged="dNguoiNhap_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [FullName], [Username] FROM [Users]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Ngày nhập :</td>
                <td class="style31">
                    Ngày : 
                    <asp:DropDownList ID="dNgay" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    Tháng : 
                    <asp:DropDownList ID="dThang" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    Năm : <asp:TextBox ID="txtNam" runat="server" Width="60px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style35">
                    <asp:Button ID="btnAddHD" runat="server" Text="Thêm" Width="73px" 
                        onclick="btnAddHD_Click" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style33">
                    CHI TIẾT HÓA ĐƠN NHẬP</td>
            </tr>
            <tr>
                <td class="style32">
                    Mã hóa đơn:</td>
                <td class="style31">
                    <asp:DropDownList ID="dMaHD" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="ID" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        
                        SelectCommand="SELECT [ID], [ImporterUsername], [CreatedDate] FROM [ImportBill]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Tên sản phẩm :</td>
                <td class="style31">
                    <asp:TextBox ID="txtTenSp" runat="server" Width="190px" ></asp:TextBox>
                    <asp:Button ID="btnTenSp" runat="server" Text="Chọn sản phẩm" />
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Loại sản phẩm :</td>
                <td class="style31">
                    <asp:RadioButtonList ID="rLoaiSp" runat="server" Width="124px" >
                        <asp:ListItem Selected="True">Điện thoại</asp:ListItem>
                        <asp:ListItem>Phụ kiện</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Số lượng :</td>
                <td class="style31">
                    <asp:TextBox ID="txtNumber" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Đơn giá nhập :</td>
                <td class="style31">
                    <asp:TextBox ID="txtPrice" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style36">
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
                                    onrowediting="gridImportBill_RowEditing" 
                                    onrowdeleting="gridImportBill_RowDeleting">
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
                            <asp:BoundField DataField="ID" HeaderText="Mã CTHĐ" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Mã HĐ" SortExpression="ImportBillID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ImportBillID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="ID" DataValueField="ID">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
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
