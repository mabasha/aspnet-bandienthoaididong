<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="DistributorManager.aspx.cs" Inherits="Admin_DistributorManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />

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

</head>

        <div class="add">
            <table>
                <tr>
                    <td colspan=2 align=center><div class="style">QUẢN LÝ NHÀ PHÂN PHỐI</div></td>
                </tr
            </table>

            <table>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="left-add" >
                        Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server" Width="236px" CssClass="styleButton" 
                            BorderStyle="None" Height="28px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="tAddress" runat="server" Width="234px" CssClass="styleButton" 
                            BorderStyle="None" Height="27px"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td colspan=2 align=center>
            <asp:Button ID="bAdd" runat="server" onclick="bAdd_Click" Text="Thêm" 
                        CssClass="styleButtonAdd" Height="43px" Width="87px" BorderStyle="None" />
                </td>
            </tr>
            <tr>
                <td colspan=2>
                    <br />
                    <asp:Label ID="lThongBao"  runat="server" Text="tThongBao"></asp:Label>
                </td>
            </tr>
        </div>

            <tr>
               <td colspan=2>

            <asp:GridView class="styleGrid" ID="gShow" runat="server" AutoGenerateColumns="False" 
                onrowcancelingedit="gShow_RowCancelingEdit" onrowdatabound="gShow_RowDataBound" 
                onrowdeleting="gShow_RowDeleting" onrowediting="gShow_RowEditing" 
                onrowupdating="gShow_RowUpdating" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AllowPaging="True" AllowSorting="True" 
                onpageindexchanging="gShow_PageIndexChanging" onsorting="gShow_Sorting" 
                onselectedindexchanged="gShow_SelectedIndexChanged" >
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Tên" SortExpression="Name" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Địa chỉ" 
                        SortExpression="Address" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                        ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Admin/AdminSite/Template/images/error.png" 
                        ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                        UpdateText="Cập nhật" ButtonType="Image" 
                        CancelImageUrl="~/Admin/AdminSite/Template/images/error.png" 
                        EditImageUrl="~/Admin/AdminSite/Template/images/user_edit.png" 
                        UpdateImageUrl="~/Admin/AdminSite/Template/images/valid.png" />
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