<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessoriesManager.aspx.cs" Inherits="Admin_AccessoriesManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">

        $("document").ready(function() {
        $("#bChooseImage").bind("click", OpenPopup);
        });

        function OpenPopup() {
            window.open("ImageManager.aspx", 'mypopup', 'width=600, height=400, toolbar=no, scrollbars=no, resizable=yes, status=no, toolbar=no, menubar=no, location=no');
            self.close();
        }
    </script>
    <title>Quản lý phụ kiện</title>
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
        
        <div class="header"> Quản lý phụ kiện</div>
        <div class="add">
            <table class="style1">
                <tr>
                    <td class="left-add">
                        Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nhà sản xuất</td>
                    <td>
                        <asp:DropDownList ID="cProducer" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Giá</td>
                    <td>
                        <asp:TextBox ID="tPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mô tả</td>
                    <td>
                        <asp:TextBox ID="tDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td id="tDes">
                        Hình ảnh</td>
                    <td>
                        <asp:TextBox ID="tImageName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseImage" runat="server" Text="..." />
                        <asp:Button ID="bShowImage" runat="server" onclick="bShowImage_Click" 
                            Text="Hiện hình ảnh" />
                    </td>
                </tr>
                <tr>
                    <td id="tDes">
                        &nbsp;</td>
                    <td>
                        <asp:Image ID="iAdd" runat="server" />
                    </td>
                </tr>
                </table>
            <asp:Button ID="bAdd" runat="server" Text="Thêm" />
        </div>
        <div class="list">
        </div>
    </div>
    </form>
    </body>
</html>
