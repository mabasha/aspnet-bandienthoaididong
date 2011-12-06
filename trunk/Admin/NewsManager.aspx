<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsManager.aspx.cs" Inherits="Admin_NewsManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title>Quản lý tin tức</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="header">Quản lý tin tức</div>
        <div class="list">
            <div>
                <div style="float: right; width: 20px;">
                    <asp:ImageButton ID="bAdd" runat="server" ImageUrl="~/Images/Apps/add.png" 
                        onclick="bAdd_Click" />
                </div>
                <div style="float: left; ">
                Từ khóa<asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
                    <asp:Button ID="bSearch" runat="server" onclick="bSearch_Click" Text="Tìm kiếm" />
                </div>
                <div style="clear:both"></div>
            </div>
            <div style="margin-top: 20px; clear: both;">
                <asp:GridView ID="gShow" runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    onpageindexchanging="gShow_PageIndexChanging" onrowcommand="gShow_RowCommand" 
                    onrowdatabound="gShow_RowDataBound" onrowdeleting="gShow_RowDeleting" 
                    onsorting="gShow_Sorting">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Tiêu đề" SortExpression="Title" />
                        <asp:BoundField DataField="Author" HeaderText="Tác giả" 
                            SortExpression="Author" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Ngày tạo" 
                            SortExpression="CreatedDate" />
                        <asp:BoundField DataField="Views" HeaderText="Số lượt xem" 
                            SortExpression="Views" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
                            ShowDeleteButton="True" />
                        <asp:ButtonField ButtonType="Image" CommandName="Edit" 
                            ImageUrl="~/Images/Apps/edit-icon.jpg" Text="Sửa" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
