<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="WarrantyReceipt.aspx.cs" Inherits="Admin_WarrantyReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>
    <title></title>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.js"></script>
    
</head>
     <table>
                <tr>
                    <td colspan=2 align=center><div class="style">LẬP PHIẾU BẢO HÀNH</div></td>
                </tr
     </table>
     <table width=100%>
            <tr>
                <br />
                <td>
                    Loại sản phẩm* :</td>
                <td>
                    <asp:RadioButton ID="rDienthoai" runat="server" AutoPostBack="True" 
                        Checked="True" GroupName="isphone" Text="Điện thoại" CssClass="styleText" />
                    <asp:RadioButton ID="rPhukien" runat="server" AutoPostBack="True" 
                        GroupName="isphone" Text="Phụ kiện" CssClass="styleText" />
                </td>
            </tr>
            <tr>
                <td >
                    Tên sản phẩm * :</td>
                <td>
                    <asp:TextBox ID="txtMasp" runat="server" Width="64px"></asp:TextBox>
                    <asp:Button ID="btnChonSp" runat="server" Text="Chọn sản phẩm" 
                        CssClass="styleButton" BorderStyle="None"  />
                </td>
            </tr>
            <tr>
                <td class="">
                    IMEI :</td>
                <td>
                    <asp:TextBox ID="txtIMEI" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="">
                    Tên khách hàng*:</td>
                <td>
                    <asp:TextBox ID="txtTenKH" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="">
                    Số điện thoại *:</td>
                <td>
                    <asp:TextBox ID="txtSoDt" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="">
                    Lý do :</td>
                <td>
                    <asp:TextBox ID="txtReason" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="">
                    Mô tả :</td>
                <td>
                    <asp:TextBox ID="txtMota" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="" colspan="2">
                    <asp:Button ID="btnLapphieu" runat="server" Height="38px" Text="Lập phiếu" CssClass="styleButton"
                        Width="101px" onclick="btnLapphieu_Click" BorderStyle="None" />
                </td>
            </tr>
            <tr>
                <td align="center" class="" colspan="2">
                    <asp:Label ID="lbThongbao" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
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
                    <asp:Button ID="btnAdd" runat="server" Height="55px" onclick="btnAdd_Click" CssClass="styleButton" 
                        Text="DONE" Visible="False" Width="110px" />
                </td>
            </tr>
        </table>
</asp:Content>