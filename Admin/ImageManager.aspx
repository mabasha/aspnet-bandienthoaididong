<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="ImageManager.aspx.cs" Inherits="Admin_ImageManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/zeroclipboard/ZeroClipboard.js" type="text/javascript"></script>

    <script type="text/javascript">
        var clip = null;
        
        $("document").ready(function() {
        $("#<% =bCopyToClipboard.ClientID%>").click(CopyToClipBoard);
        });

        function CopyToClipBoard() {
            if (window.clipboardData) {
                window.clipboardData.setData("Text", $("#<% =hChoosedImage.ClientID%>").val());
            }
            else {
                alert('Chỉ hỗ trợ IE');
            }
            return false;
        }
    </script>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
             <table>
                <tr>
                    <td colspan=2 align=center><div class="style"> QUẢN LÝ HÌNH ẢNH</div></td>
                </tr
            </table>

            <table>
            
            <tr>
                <br />
                <td colspan=2 align="center" class="styleText">
                     Chọn thư mục hình ảnh
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:RadioButton ID="rPhone" runat="server" Checked="True" Text="Điện thoại" 
            GroupName="folder" />
                     <asp:RadioButton ID="rAccessory" runat="server" Text="Phụ kiện" 
            GroupName="folder"/>
                </td>
                <td>
                <br />
                <asp:Button ID="bChangeFolder" runat="server" onclick="bChangeFolder_Click" CssClass="styleButton" 
            Text="Xác nhận" BorderStyle="None" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>

              <tr>
                <br />
                <td colspan=2 align="center" class="styleText">
                     Thêm hình mới
                </td>
            </tr>
            <tr>
                
                <td>
                <br />
                    <asp:FileUpload ID="fileUpload" runat="server"  CssClass="styleButton" 
                        BorderStyle="None" />
                </td>
                <td align=right>
                <br />
                    <asp:Button ID="bUpload" runat="server" Text="Tải lên"  onclick="bUpload_Click"   CssClass="styleButton" BorderStyle="None"/>                    
                </td>
            </tr>
            <tr>
                <td colspan=3>  
                    <br />            
                    <asp:Label ID="lThongBao" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
            <table>
            <tr>
                <br />
                <td colspan=2 align="center" class="style">
                     Danh sách hình
                </td>
            </tr>
            
             <tr>
                <br />
                <td colspan=2 align="center">
                            <i style="font-size : 11px"><br />
        Để chọn hình, check vào một checkbox, nhấn Chọn, sau 
        đó nhấn Đóng để đóng cửa sổ lại</i><br /> 
                </td>
            </tr>
           </table>

        <br />
        <br />
        <asp:Button ID="bSelect" runat="server" Text="Chọn" onclick="bSelect_Click" CssClass="styleButton" 
            Height="26px" />
        <asp:Button ID="bClose" runat="server" Text="Đóng" CssClass="styleButton"  />
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="bDelete" runat="server" 
                Text="Xóa" onclick="bDelete_Click" CssClass="styleButton" />
        <asp:Button ID="bRename" runat="server" Text="Đổi tên" CssClass="styleButton" 
            onclick="bRename_Click" />
        &nbsp;<asp:Button ID="bCopyToClipboard" runat="server" CssClass="styleButton" 
            Text="Chép vào Clipboard (chỉ IE)" />
        <br />
        <asp:TextBox ID="tNewName" runat="server" Visible="False"></asp:TextBox>
        <asp:Button ID="bDone" runat="server" onclick="bDone_Click" Text="Đồng ý" 
            Visible="False" />
        <asp:HiddenField ID="hChoosedImage" runat="server" />
        </b>
        <i style="font-size : 11px">
        <asp:Panel ID="pImage" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;
        </asp:Panel></i>

</asp:Content>