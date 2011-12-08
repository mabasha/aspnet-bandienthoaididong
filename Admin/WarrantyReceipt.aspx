<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WarrantyReceipt.aspx.cs" Inherits="Admin_WarrantyReceipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.js"></script>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 409px;
        }
        .style2
        {
        }
        .style3
        {
            width: 87%;
            height: 341px;
        }
        .style4
        {
            width: 602px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" class="header" style="height: 60px">
    
        LẬP PHIẾU BẢO HÀNH</div>
    <div style="height: 427px">
        <table class="style1">
            <tr>
                <td class="style2">
                    Loại sản phẩm* :</td>
                <td>
                    <asp:RadioButton ID="rDienthoai" runat="server" AutoPostBack="True" 
                        Checked="True" GroupName="isphone" Text="Điện thoại" />
                    <asp:RadioButton ID="rPhukien" runat="server" AutoPostBack="True" 
                        GroupName="isphone" Text="Phụ kiện" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Tên sản phẩm * :</td>
                <td>
                    <asp:TextBox ID="txtMasp" runat="server" Width="64px"></asp:TextBox>
                    <asp:Button ID="btnChonSp" runat="server" Text="Chọn sản phẩm" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    IMEI :</td>
                <td>
                    <asp:TextBox ID="txtIMEI" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Tên khách hàng*:</td>
                <td>
                    <asp:TextBox ID="txtTenKH" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Số điện thoại *:</td>
                <td>
                    <asp:TextBox ID="txtSoDt" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Lý do :</td>
                <td>
                    <asp:TextBox ID="txtReason" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Mô tả :</td>
                <td>
                    <asp:TextBox ID="txtMota" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style2" colspan="2">
                    <asp:Button ID="btnLapphieu" runat="server" Height="38px" Text="Lập phiếu" 
                        Width="101px" onclick="btnLapphieu_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 356px; margin-top: 0px">
        <table class="style3">
            <tr>
                <td class="style4">
        <asp:Label ID="lbLapphieuBh" runat="server"></asp:Label>
        <p><asp:Label ID="lbLoaiSp" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbTenSp" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbIMEI" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbNgay" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbTenKH" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbSoDt" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbLydo" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbMota" runat="server"></asp:Label>  </p>
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Height="55px" onclick="btnAdd_Click" 
                        Text="DONE" Visible="False" Width="110px" />
                </td>
            </tr>
        </table>
    </div>
    </form>
    </body>
</html>
