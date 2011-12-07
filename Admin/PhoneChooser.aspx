<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="PhoneChooser.aspx.cs" Inherits="Admin_PhoneChooser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <title></title>
</head>

    <div>
    <div class="header">Chọn điện thoại</div>
        <div class="list">Tên:
            <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
            <asp:Button ID="bSearch" runat="server" onclick="bSearch_Click" 
                Text="Tìm tên" />
            <br />
            <asp:GridView ID="gShow" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                GridLines="None" onpageindexchanging="gShow_PageIndexChanging" 
                onselectedindexchanged="gShow_SelectedIndexChanged" onsorting="gShow_Sorting">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" 
                        SortExpression="Name" />
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
            <asp:HiddenField ID="hChoosed" runat="server" />
            <asp:Button ID="bClose" runat="server" CssClass="right-float" Text="Đóng" />
        </div>
    </div>
</asp:Content>