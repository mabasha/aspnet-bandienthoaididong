<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Producer.aspx.cs" Inherits="Admin_Producer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 45%;
            height: 200px;
        }
        .style2
        {
            height: 3px;
        }
        .header
        {
            height: 52px;
        }
        .style3
        {
            height: 27px;
        }
        .style4
        {
            height: 29px;
        }
    </style>
     <%--<input id="Button1" type="button" value="button" onclick="return Button1_onclick()" />--%>

    <%--<script language="javascript" type="text/javascript">
// <!CDATA[

        function IsNumeric(sText) {
            var ValidChars = "0123456789.,";
            var IsNumber = true;
            var Char;

            for (i = 0; i < sText.length && IsNumber == true; i++) {
                Char = sText.charAt(i);
                if (ValidChars.indexOf(Char) == -1) {
                    alert('Mã nhà sản xuất chỉ bao gồm số!');
                    IsNumber = false;
                }
            }
            return IsNumber;
        }

// ]]>
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="header">
            <div align="center" class="header">
                CẬP NHẬT NHÀ SẢN XUẤT</div>
        </div>
        <div align="center" class="add">
    
        <table class="style1" align="center">
            <tr>
                <td align="center">
                    Tên nhà sản xuất:
                    <asp:TextBox ID="txtTenNsx" runat="server" Width="221px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td align="center" class="style3">
                    <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" 
                        Width="73px"/>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4">
                    <asp:Label ID="lbThongbao" runat="server"></asp:Label>
                    </td>
            </tr>
            </table>
    
        </div>
        <div align="center" class="list">
                    <asp:GridView ID="gridNsx" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None"                                                 
                        ShowFooter="True" Width="327px" PageSize="5" 
                        onrowdatabound="gridNsx_RowDataBound" 
                onrowcancelingedit="gridNsx_RowCancelingEdit" 
                onrowdeleting="gridNsx_RowDeleting" onrowediting="gridNsx_RowEditing" 
                onrowupdating="gridNsx_RowUpdating">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                                ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Nhà sản xuất" 
                                SortExpression="Name" />
                            <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                                ShowSelectButton="True" />
                            <asp:CommandField ButtonType="Image" ShowDeleteButton="True" 
                                DeleteImageUrl="~/Images/Apps/Delete.jpg" />
                            <asp:CommandField CancelText="Không" EditText="Sửa" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    </div>
    
    </form>
</body>
</html>
