<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="AccessoryChooser.aspx.cs" Inherits="Admin_AccessoryChooser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
        <table>
        <tr>
        <td align=center><div class="style">CHỌN PHỤ KIỆN</div>  </td>
        </tr>
        </table>
        <br />
        <table width=100%>
        <tr>
        <td align=center>Tên:
        <asp:TextBox ID="tKeyword" runat="server" CssClass="styleText" BorderStyle="None" 
                Width="219px"></asp:TextBox>
            <asp:Button ID="bSearch" runat="server" onclick="bSearch_Click" 
                Text="Tìm tên" CssClass="styleButton" BorderStyle="None"/>
            <br />
        </td>
        </tr>
        <tr>
            <td>
            <br />
            </td>
        </tr>
        <tr>
            <td colspan=2>
            <asp:GridView class="styleGrid" ID="gShow" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                GridLines="None" onpageindexchanging="gShow_PageIndexChanging" 
                onselectedindexchanged="gShow_SelectedIndexChanged" onsorting="gShow_Sorting">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" >
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle CssClass="styleButton" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Tên Phụ Kiện" 
                        SortExpression="Name" >
                    <HeaderStyle CssClass="styleButton" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" SelectText="Chọn" 
                        ShowSelectButton="True" HeaderText="Thao Tác" 
                        SelectImageUrl="~/Admin/AdminSite/Template/images/valid.png" >
                    <HeaderStyle CssClass="styleButton" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:HiddenField ID="hChoosed" runat="server" />
            <br />
            
            </td>
        </tr>
        <tr>
            <td align=right>
            <asp:Button ID="bClose" runat="server" Text="Đóng" CssClass="styleButtonCancle" 
                    BorderStyle="None" Height="36px" Width="87px" />
            </td>
        </tr>
        </table>
</asp:Content>
