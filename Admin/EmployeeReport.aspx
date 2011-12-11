<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="EmployeeReport.aspx.cs" Inherits="Admin_EmployeeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head>
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
             <table>
                <tr>
                    <td colspan=2 align=center><div class="style">BÁO CÁO KẾT QUẢ BÁN HÀNG</div></td>
                </tr
            </table
            <br />
            <table>
            <tr>
                <td class="left-add">
                Từ ngày
                </td>
                <td>
                        <asp:TextBox ID="tFrom" runat="server" CssClass="styleText" BorderStyle="None" 
                            Height="33px" Width="214px"></asp:TextBox></div> 
                </td>
            </tr>
            <tr>
                <td>
                    Đến ngày
                </td>
                <td>
                        <asp:TextBox ID="tTo" runat="server" CssClass="styleText" BorderStyle="None" 
                            Height="28px" Width="213px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Nhân viên
                </td>
                <td>
                    <asp:TextBox ID="tKeyword" runat="server" CssClass="styleText" 
                        BorderStyle="None" Height="31px" Width="213px"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td align="center" colspan=2>
                    <br />
                    <asp:Button ID="bView" runat="server" Text="Xem" onclick="bView_Click" 
                        CssClass="styleButtonAdd" BorderStyle="None" Height="41px" Width="71px" />
                </td>
            </tr>
           

           
            <br />
            <br />
            <tr>
                <td colspan=2>
            <asp:GridView class="styleGrid" ID="gShow" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <AlternatingRowStyle BackColor="White" />
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
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </td>
            </tr>
        </table>
 </asp:Content>