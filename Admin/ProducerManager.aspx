﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProducerManager.aspx.cs" Inherits="Admin_ProducerManager" %>

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
        <div class="header">Quản lý nhà sản xuất</div>
        <div class="add">
            <asp:Label ID="lThongBao" runat="server" Text="ThongBao"></asp:Label>
            <table class="style1">
                <tr>
                    <td class="left-add">
                        Tên nhà sản xuất</td>
                    <td class="right-add">
                        <asp:TextBox ID="tName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
            </table>
            <asp:Button ID="bAdd" runat="server" Text="Add" onclick="bAdd_Click" 
                style="height: 26px" />
        </div>
        <div class="list">
            <asp:GridView ID="gProducer" runat="server" AutoGenerateColumns="False" 
                onrowdatabound="gProducer_RowDataBound" 
                onselectedindexchanged="gProducer_SelectedIndexChanged" 
                onrowdeleting="gProducer_RowDeleting" 
                onrowcancelingedit="gProducer_RowCancelingEdit" 
                onrowediting="gProducer_RowEditing" onrowupdating="gProducer_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Mã NSX" />
                    <asp:BoundField DataField="Name" HeaderText="Tên NSX" />
                    <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                        ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
                        ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                        UpdateText="Cập nhật" />
                </Columns>
                <SelectedRowStyle BackColor="#66CCFF" />
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>