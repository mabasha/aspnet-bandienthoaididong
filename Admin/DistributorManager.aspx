<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DistributorManager.aspx.cs" Inherits="Admin_DistributorManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="header">Quản lý nhà phân phối</div>
        <div class="add">
            <table class="style1">
                <tr>
                    <td class="left-add" >
                        Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server" Width="221px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="tAddress" runat="server" Width="222px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="bAdd" runat="server" onclick="bAdd_Click" Text="Add" />
            <br />
            <asp:Label ID="lThongBao" runat="server" Text="tThongBao"></asp:Label>
        </div>
        <div class="list">
            <asp:GridView ID="gShow" runat="server" AutoGenerateColumns="False" 
                onrowcancelingedit="gShow_RowCancelingEdit" onrowdatabound="gShow_RowDataBound" 
                onrowdeleting="gShow_RowDeleting" onrowediting="gShow_RowEditing" 
                onrowupdating="gShow_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Tên" />
                    <asp:BoundField DataField="Address" HeaderText="Địa chỉ" />
                    <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                        ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
                        ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                        UpdateText="Cập nhật" />
                </Columns>
                <SelectedRowStyle BackColor="#99CCFF" />
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
