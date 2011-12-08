<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="AccountChooser.aspx.cs" Inherits="Admin_AccountChooser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <title></title>
</head>
    <table>
    <tr>
    <td align=center><div class="style">ACCOUNT CHOOSER</div>   </td>
    </tr>
    </table>
    <br />
    <table width=100%>
    <tr>
        <td>Phân quyền :
        <asp:DropDownList ID="dDecentralize" runat="server">
            <asp:ListItem>Tất cả</asp:ListItem>
            <asp:ListItem>Administrator</asp:ListItem>
            <asp:ListItem>Manager</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>User</asp:ListItem>
        </asp:DropDownList>
        <br />
        Tìm kiếm :
        <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
        <asp:Button ID="bRefresh" runat="server" onclick="bRefresh_Click" 
            Text="Tìm kiếm" />
            </td>
            </tr>
        <tr>
            <td>
        <asp:GridView ID="gShow" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onpageindexchanging="gShow_PageIndexChanging" 
            onselectedindexchanged="gShow_SelectedIndexChanged" 
            onselectedindexchanging="gShow_SelectedIndexChanging" onsorting="gShow_Sorting">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" 
                    SortExpression="Username" />
                <asp:BoundField DataField="Decentralize" HeaderText="Phân quyền" 
                    SortExpression="Decentralize" />
                <asp:BoundField DataField="FullName" HeaderText="Họ và tên" 
                    SortExpression="FullName" />
                <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                    ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
        <asp:Button ID="bClose" runat="server" CssClass="right-float" Text="Đóng" />
        <asp:HiddenField ID="hChoosed" runat="server" Value="test" />
            </td>
        </tr>
        </table>
</asp:Content>