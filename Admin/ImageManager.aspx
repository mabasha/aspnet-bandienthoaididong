<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageManager.aspx.cs" Inherits="Admin_ImageManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(function() {
        $("#bClose").bind("click", GetValue);
        });

        function GetValue() {
            window.opener.$("#tImageName").val($("#hChoosedImage").val());
            self.close();
        }
    </script>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class=header>
        Quản lý hình ảnh
        </div>
    <div style="padding: 20px" class="round">
        Chọn thư mục hình ảnh :<br />
        <asp:RadioButton ID="rPhone" runat="server" Checked="True" Text="Điện thoại" 
            GroupName="folder" />
        <asp:RadioButton ID="rAccessory" runat="server" Text="Phụ kiện" 
            GroupName="folder"/>
    &nbsp;
        <asp:Button ID="bChangeFolder" runat="server" onclick="bChangeFolder_Click" 
            Text="Xác nhận" />
    </div>
    
    <div class="round">
        <b>Thêm hình mới</b>
        <p id="fileUpload">
            <asp:FileUpload ID="fileUpload" runat="server" />
&nbsp;<asp:Button ID="bUpload" runat="server" Text="Tải lên" onclick="bUpload_Click" />
        </p>
        <p>
            <asp:Label ID="lThongBao" runat="server"></asp:Label>
        </p>
    </div>
    
    <div id = "dImage" class="round">
        <i style="font-size : 11px">Để chọn hình, check vào một checkbox, nhấn Chọn, sau 
        đó nhấn Đóng để đóng cửa sổ lại</i><b><br />
        Danh sách hình :<br />
        <br />
            <asp:Button ID="bSelect" runat="server" Text="Chọn" onclick="bSelect_Click" 
            Height="26px" />
            <asp:Button ID="bClose" runat="server" Text="Đóng" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="bDelete" runat="server" 
                Text="Xóa" onclick="bDelete_Click" />
            <asp:Button ID="bRename" runat="server" Text="Đổi tên" 
            onclick="bRename_Click" />
            <br />
        <asp:TextBox ID="tNewName" runat="server" Visible="False"></asp:TextBox>
        <asp:Button ID="bDone" runat="server" onclick="bDone_Click" Text="Đồng ý" 
            Visible="False" />
            <asp:HiddenField ID="hChoosedImage" runat="server" />
        </b>
        <asp:Panel ID="pImage" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;
        </asp:Panel>
    </div>
    </form>
    
</body>
</html>
