<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="NewsAdd.aspx.cs" Inherits="Admin_NewsAdd" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(OnPageReady);
        function OnPageReady() {
            $('#<% =bAdd.ClientID %>').click(OnAddClick);
        }

        function OnAddClick() {
            if ($('#<% =tTitle.ClientID %>').val() == "" || $('#<% =tAuthor.ClientID %>').val() == "" || $('#<% =tIntro.ClientID %>').val() == "") {
                alert('Bạn chưa nhập đầy đủ thông tin');
                return false;
            }
        }
    </script>
    <title>Thêm tin tức</title>
</head>

        <table>
            <tr>
                <td align="center">
                    <div class="style">Thêm tin tức</div>
                </td>
            </tr>
        </table>

        <table width=100% >
            <tr>
                <td colspan=2>
                    <asp:Label ID="tInfo" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                     Tiêu đề *
                </td> 
                <td>
                        <asp:TextBox ID="tTitle" runat="server" Width="300px" ></asp:TextBox>
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
                            <asp:ListItem Value="Khuyến mãi">Khuyến mãi</asp:ListItem>
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
                        Hình ảnh</td>
                    <td align=right>
                        <asp:TextBox ID="tImageName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseImage" runat="server" Text="Chọn hình ảnh" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align=right>
                        <asp:Button ID="bAdd" runat="server" onclick="bAdd_Click" Text="Thêm" 
                            CssClass="styleButtonAdd" BorderStyle="None" Height="41px" Width="76px" />
                    </td>
                </tr>
        </table>
 </asp:Content>