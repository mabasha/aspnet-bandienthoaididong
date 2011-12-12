<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WarrantyReceiptManager.aspx.cs" Inherits="Admin_WarrantyReceiptManager" %>

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
            width: 280px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="height: 52px">
    
        QUẢN LÝ PHIẾU BẢO HÀNH
    
    </div>
    <div style="height: 242px; width: 1187px">
        <table class="style1">
            <tr>
                <td class="style2">
                    Tình trạng :
                </td>
                <td>
                    <asp:RadioButton ID="rChua" runat="server" Checked="True" 
                        GroupName="RTinhtrang" Text="Chưa đổi" Enabled="False" />
                    <asp:RadioButton ID="rTra" runat="server" GroupName="rTinhtrang" 
                        Text="Đã đổi" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Lý do :</td>
                <td>
                    <asp:TextBox ID="txtLydo" runat="server" Height="80px" TextMode="MultiLine" 
                        Width="250px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Mô tả :</td>
                <td>
                    <asp:TextBox ID="txtMota" runat="server" Height="80px" TextMode="MultiLine" 
                        Width="250px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" Enabled="False" 
                        onclick="btnCapnhat_Click" />
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" Enabled="False" 
                        onclick="btnHuy_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="height: 158px">
        <asp:GridView ID="gridPBH" runat="server" AutoGenerateColumns="False" 
            Width="1182px" onrowdatabound="gridPBH_RowDataBound" 
            onrowdeleting="gridPBH_RowDeleting" 
            onselectedindexchanged="gridPBH_SelectedIndexChanged" AllowPaging="True" 
            AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" CellPadding="3" 
            onpageindexchanging="gridPBH_PageIndexChanging" onsorting="gridPBH_Sorting" >
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:TemplateField HeaderText="Loại sản phẩm">
                    <ItemTemplate>
                        <asp:Label ID="lbIsPhone" runat="server" 
                            Text='<%# Eval("IsPhone").ToString()=="True" ?"Điện thoại":"Phụ kiện" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên sản phẩm">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProID" runat="server"></asp:TextBox>
                        <asp:Button ID="btnDt" runat="server" Text="chọn ĐT" />
                        <asp:Button ID="btnPk" runat="server" Text="Chọn PK" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbProName" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IMEI" HeaderText="IMEI" />
                <asp:BoundField DataField="CreatedDate" HeaderText="Ngày lập" 
                    SortExpression="CreatedDate" />
                <asp:BoundField DataField="OutOfDate" HeaderText="Hạn bảo hành" />
                <asp:TemplateField HeaderText="Lý do ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtReason" runat="server" Height="80px" TextMode="MultiLine" 
                            Width="250px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbReason" runat="server" Text='<%# Eval("Reason") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CustomerName" HeaderText="Tên khách hàng " 
                    SortExpression="CustomerName" />
                <asp:BoundField DataField="Tel" HeaderText="Số điện thoại" 
                    SortExpression="Tel" />
                <asp:TemplateField HeaderText="Tình trạng">
                    <EditItemTemplate>
                        <asp:RadioButton ID="rDoi" runat="server" GroupName="rTinhtrang" 
                            Text="Đã đổi" />
                        <asp:RadioButton ID="rChua" runat="server" Checked="True" 
                            GroupName="rTinhtrang" Text="Chưa đổi" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbIsRe" runat="server" 
                            Text='<%# Eval("IsReturned").ToString()=="True" ?"Đã đổi":"Chưa đổi" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày đổi">
                    <ItemTemplate>
                        <asp:Label ID="lReDate" runat="server" Text='<%# Eval("ReturnedDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mô tả">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDes" runat="server" Height="80px" TextMode="MultiLine" 
                            Width="250px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbDes" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" 
                    SelectImageUrl="~/Images/Apps/edit-icon.jpg" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>    
    </form>
</body>
</html>
