<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="EmployeeReport.aspx.cs" Inherits="Admin_EmployeeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jqueryui/jquery-1.6.4.min.js" type="text/javascript"></script>

    <script src="../Scripts/jqueryui/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="../Scripts/jqueryui/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jqueryui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>

    <script>
        $(function() {
            $("#tFrom").datepicker();/*{dateFormat: 'yy-mm-dd' }*/
        });

        $(function() {
            $("#tTo").datepicker();
        });

    </script>
    <title>Báo cáo nhân viên</title>
</head>

    <div class=wrapper>
        <div class="header">
            Báo cáo kết quả bán của nhân viên</div>
        <div class="list">
            <div style="width:300px; float: left;">Từ ngày
            <asp:TextBox ID="tFrom" runat="server"></asp:TextBox></div> 
            
            <div style="margin-left:40px; width: 300px; float: left;">Đến ngày
                <asp:TextBox ID="tTo" runat="server"></asp:TextBox>
            </div>
            <div style="float:left; clear:left">Nhân viên<asp:TextBox ID="tKeyword" runat="server"></asp:TextBox></div>
&nbsp;
<div class=clearboth></div>
            <asp:Button ID="bView" runat="server" Text="Xem" onclick="bView_Click" />
            <br />
            <br />
            <asp:GridView ID="gShow" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3">
                <RowStyle ForeColor="#000066" />
                <Columns>
                    <asp:BoundField DataField="FullName" HeaderText="Tên nhân viên" 
                        SortExpression="FullName" />
                    <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" 
                        SortExpression="Username" />
                    <asp:BoundField DataField="NumberSold" HeaderText="Số mặt hàng đã bán" 
                        SortExpression="NumberSold" />
                    <asp:BoundField DataField="ValueSold" HeaderText="Giá trị đã bán (đ)" 
                        SortExpression="ValueSold" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
 </asp:Content>