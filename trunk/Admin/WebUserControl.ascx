<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="Admin_WebUserControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(OnPageReady);

        function OnPageReady() {
            $("#bAdd").bind("click", OnAddClick);
        }

        function OnAddClick() {
            if ($("#tName").val() == "" || $("tAddress").val() == "") {
                alert("Bạn chưa nhập đầy đủ thông tin");
                return false;
            }
        }
    </script>

    <title></title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
    </style>
    </head>
<body>
        <div class="">Quản lý nhà phân phối</div>
        <div class="add">
            <table width="300px">
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

        </div>
       
        
</body>
</html>
