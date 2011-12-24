<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="Producer.aspx.cs" Inherits="Admin_Producer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>

    <title></title>
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
     <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />

    <style type="text/css">
        .header
        {
            height: 52px;
        }
    </style>
    <script type="text/javascript">
        $("document").ready(OnPageReady);
        function OnPageReady() {
            $("#<% =btnThem.ClientID%>").click(Them);           
        }
        function Them() {
            if ($("#<% =txtTenNsx.ClientID%>").val() == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }
        }
    </script>
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

    
         <table>
                <tr>
                    <td colspan=2 align=center><div class="style">QUẢN LÝ NHÀ SẢN XUẤT</div></td>
                </tr
         </table>

         <table width=100%>
            <tr>
                <br />
                <td align="center">
                    Tên nhà sản xuất:
                    <asp:TextBox ID="txtTenNsx" runat="server" Width="221px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>

             <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" >
                    <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" CssClass="styleButtonAdd" 
                        Width="88px" BorderStyle="None" Height="38px"/>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" >
                    <asp:Label ID="lbThongbao" runat="server"></asp:Label>
                    </td>
            </tr>

             <tr>
                <td align="center">
                    <asp:GridView CssClass="styleGrid" ID="gridNsx" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None"                                                 
                        ShowFooter="True" 
                        onrowdatabound="gridNsx_RowDataBound" 
                onrowcancelingedit="gridNsx_RowCancelingEdit" 
                onrowdeleting="gridNsx_RowDeleting" onrowediting="gridNsx_RowEditing" 
                onrowupdating="gridNsx_RowUpdating" AllowPaging="True" AllowSorting="True" 
                        onpageindexchanging="gridNsx_PageIndexChanging" onsorting="gridNsx_Sorting">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                                ReadOnly="True" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Nhà sản xuất" 
                                SortExpression="Name" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CommandField CancelText="Không" EditText="Sửa" ShowEditButton="True" 
                                ButtonType="Image" CancelImageUrl="~/Admin/AdminSite/Template/images/error.png" 
                                EditImageUrl="~/Admin/AdminSite/Template/images/user_edit.png" 
                                UpdateImageUrl="~/Admin/AdminSite/Template/images/valid.png" />
                            <asp:CommandField ButtonType="Image" ShowDeleteButton="True" 
                                DeleteImageUrl="~/Images/Apps/Delete.jpg" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    </td>
            </tr>
         </table>

</asp:Content>