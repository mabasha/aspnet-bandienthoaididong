﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleBillManager.aspx.cs" Inherits="Admin_SaleBillManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class=wrapper>
        <div class=header>Quản lý hóa đơn bán</div>
        <div class=add>
            <b>Thông tin hóa đơn</b><br />
            <table class="style1" style="border-style: solid; border-width: 1px">
                <tr>
                    <td class="left-add">
                        Người bán</td>
                    <td>
                        <asp:DropDownList ID="dSaler" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:RadioButton ID="rRegisted" runat="server" Checked="True" 
                            GroupName="CustomType" Text="Đã đăng ký" AutoPostBack="True" />
                        <asp:RadioButton ID="rUnregisted" runat="server" GroupName="CustomType" 
                            Text="Chưa đăng ký" AutoPostBack="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tên khách hàng</td>
                    <td>
                        <asp:TextBox ID="tCustomerName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseCustomer" runat="server" Text="Chọn khách hàng" />
                        <asp:Button ID="bShowCustomerInfo" runat="server" 
                            onclick="bShowCustomerInfo_Click" Text="Hiện thông tin khác" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="tAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Điện thoại</td>
                    <td>
                        <asp:TextBox ID="tPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                </table>
            <br />
            <br />
            <b>Chi tiết hóa đơn<br />
            </b>
            <asp:Label ID="lInfoDt" runat="server" Text="Label"></asp:Label>
            <br />
            <table class="style2" width="50%" 
                style="border-style: solid; border-width: 1px">
                <tr>
                    <td width="50%" class="left-add">
                        Loại hàng</td>
                    <td>
                        <asp:RadioButton ID="rPhone" runat="server" Text="Điện thoại" Checked="True" 
                            GroupName="ProductType" AutoPostBack="True" />
&nbsp;<asp:RadioButton ID="rAccessory" runat="server" Text="Phụ kiện" GroupName="ProductType" 
                            AutoPostBack="True" />
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="bChooseProduct" runat="server" CssClass="margin-left" 
                            Text="Chọn mặt hàng" />
                        <asp:Button ID="bShowName" runat="server" onclick="bShowName_Click" 
                            Text="Lấy thông tin sản phẩm" />
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Mã mặt hàng</td>
                    <td>
                        <asp:TextBox ID="tProductID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Tên mặt hàng</td>
                    <td>
                        <asp:Label ID="lProductName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Đơn giá</td>
                    <td>
                        <asp:Label ID="lPrice" runat="server"></asp:Label>
&nbsp;đ</td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Số IMEI</td>
                    <td>
                        <asp:TextBox ID="tIMEI" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Số lượng</td>
                    <td>
                        <asp:TextBox ID="tNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="bAddBillDt" runat="server" CssClass="margin" 
                            Text="Thêm mặt hàng" onclick="bAddBillDt_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gAddDetail" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Mã sản phẩm" />
                    <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="ProductIMEI" HeaderText="Số IMEI" />
                    <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                    <asp:BoundField DataField="Price" HeaderText="Đơn giá" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            <asp:Button ID="bAdd" runat="server" Text="Thêm hóa đơn" onclick="bAdd_Click" />
            <div class=clearboth></div>
        </div>
        
        <div class=list></div>
    </div>
    </form>
</body>
</html>
