<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="WarrantyReceipt.aspx.cs" Inherits="Admin_WarrantyReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>
    <title></title>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.js"></script>
    <script src="../Scripts/Utils.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(OnPageReady);
        function OnPageReady() {
            $("#<% =btnLapphieu.ClientID%>").click(Lapphieu);
            $("#<% =txtHanBH.ClientID%>").keydown(OnKeyDownCheckNumber);
            $("#<% =txtSoDt.ClientID%>").keydown(OnKeyDownCheckNumber);
        }
        function Lapphieu() {
            if ($("#<% =txtMasp.ClientID%>").val() == "" || $("#<% =txtHanBH.ClientID%>").val() == "" || $("#<% =txtTenKH.ClientID%>").val() == "" || $("#<% =txtSoDt.ClientID%>").val() == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }
        }
    </script>
    
</head>
     <table>
                <tr>
                    <td colspan=2 align=center><div class="style">LẬP PHIẾU BẢO HÀNH</div></td>
                </tr
     </table>
     <table width=100%>
            <tr>
                <br />
                <td style="width: 132px">
                    Loại sản phẩm* :</td>
                <td style="width: 44px">
                    <asp:RadioButton ID="rDienthoai" runat="server" AutoPostBack="True" 
                        Checked="True" GroupName="isphone" Text="Điện thoại" CssClass="styleText" />
                    <asp:RadioButton ID="rPhukien" runat="server" AutoPostBack="True" 
                        GroupName="isphone" Text="Phụ kiện" CssClass="styleText" />
                </td>
                <td align="center" style="width: 404px">
        <asp:Label ID="lbLapphieuBh" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 132px" >
                    Tên sản phẩm * :</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtMasp" runat="server" Width="60px"></asp:TextBox>
                    <asp:Button ID="btnChonSp" runat="server" Text="Chọn sản phẩm" 
                        CssClass="styleButton" BorderStyle="None"  />
                </td>
                <td rowspan="7" style="width: 404px">
        <p><asp:Label ID="lbLoaiSp" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbTenSp" runat="server"></asp:Label>  </p>
                    <p><asp:Label ID="lbIMEI" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbNgay" runat="server"></asp:Label>  </p>
        <p>
            <asp:Label ID="lbHanBH" runat="server"></asp:Label>
                    </p>
        <p><asp:Label ID="lbTenKH" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbSoDt" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbLydo" runat="server"></asp:Label>  </p>
        <p><asp:Label ID="lbMota" runat="server"></asp:Label>  </p>
                </td>
            </tr>
            <tr>
                <td style="width: 132px" >
                    IMEI :</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtIMEI" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    Hạn bảo hành :</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtHanBH" runat="server" Width="60px"></asp:TextBox>
&nbsp; (tháng)</td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    Tên khách hàng*:</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtTenKH" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    Số điện thoại *:</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtSoDt" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    Lý do :</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtReason" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    Mô tả :</td>
                <td style="width: 44px">
                    <asp:TextBox ID="txtMota" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="" style="width: 132px">
                    &nbsp;</td>
                <td style="width: 44px">
                    &nbsp;</td>
                <td style="width: 404px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="" colspan="2">
                    <asp:Button ID="btnLapphieu" runat="server" Height="38px" Text="Lập phiếu" CssClass="styleButton"
                        Width="101px" onclick="btnLapphieu_Click" BorderStyle="None" />
                </td>
                <td align="center" style="width: 404px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="" colspan="3">
                    <asp:Label ID="lbThongbao" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="" colspan="3">
                    <asp:Button ID="btnAdd" runat="server" Height="55px" onclick="btnAdd_Click" CssClass="styleButton" 
                        Text="DONE" Visible="False" Width="110px" />
                </td>
            </tr>
        </table>
        </asp:Content>