<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsAdd.aspx.cs" Inherits="Admin_NewsAdd" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script>
        $('document').ready(OnPageReady);
        function OnPageReady() {
            $('#bAdd').click(OnAddClick);
        }

        function OnAddClick() {
            if ($('#tTitle').val() == "" || $('#tAuthor').val() == "" || $('#tIntro').val() == "") {
                alert('Bạn chưa nhập đầy đủ thông tin');
                return false;
            }
        }
    </script>
    <title>Thêm tin tức</title>
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
        <div class="header">
            <asp:Label ID="lTitle" runat="server" Text="Thêm tin tức"></asp:Label>
        </div>
        <div class="add">
            <br />
            <asp:Label ID="tInfo" runat="server"></asp:Label>
            <table class="style1">
                <tr>
                    <td class="left-add">
                        Tiêu đề *</td>
                    <td>
                        <asp:TextBox ID="tTitle" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Chuyên mục *</td>
                    <td>
                        <asp:DropDownList ID="dCategory" runat="server">
                            <asp:ListItem>Khác</asp:ListItem>
                            <asp:ListItem>Sản phẩm</asp:ListItem>
                            <asp:ListItem>Công nghệ</asp:ListItem>
                            <asp:ListItem>Nhân vật</asp:ListItem>
                            <asp:ListItem>Thủ thuật</asp:ListItem>
                            <asp:ListItem>Khuyến mại</asp:ListItem>
                            <asp:ListItem>Công ty</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Tác giả *</td>
                    <td>
                        <asp:TextBox ID="tAuthor" runat="server" Width="128px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mở đầu *</td>
                    <td>
                        <asp:TextBox ID="tIntro" runat="server" Height="60px" TextMode="MultiLine" 
                            Width="360px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nội dung *</td>
                    <td>
                        <CKEditor:CKEditorControl ID="ckContent" runat="server" ToolbarFull="Source|-|Save|NewPage|Preview|-|Templates
Cut|Copy|Paste|PasteText|PasteFromWord|-|Print|SpellChecker|Scayt
Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat
Form|Checkbox|Radio|TextField|Textarea|Select|Button|ImageButton|HiddenField
/
Bold|Italic|Underline|Strike|-|Subscript|Superscript
Link|Unlink|Anchor
Image|
/
Styles|Format|Font|FontSize
TextColor|BGColor">
                        </CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="bAdd" runat="server" onclick="bAdd_Click" Text="Thêm" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
