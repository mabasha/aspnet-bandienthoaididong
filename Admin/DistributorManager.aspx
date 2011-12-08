<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="DistributorManager.aspx.cs" Inherits="Admin_DistributorManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head runat="server">
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
            <table class="style1" border= width=870px>
                <tr>
                    <td colspan=2 align=center><font color=maroon size=+4 >QUẢN LÝ NHÀ PHÂN PHỐI</font></td>
                </tr>
                <tr>
                    <td class="left-add" >
                        Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server" Width="221px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="tAddress" runat="server" Width="222px"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td colspan=2>
            <asp:Button ID="bAdd" runat="server" onclick="bAdd_Click" Text="Add" />
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
        <div class="list">
            <asp:GridView ID="gShow" runat="server" AutoGenerateColumns="False" 
                onrowcancelingedit="gShow_RowCancelingEdit" onrowdatabound="gShow_RowDataBound" 
                onrowdeleting="gShow_RowDeleting" onrowediting="gShow_RowEditing" 
                onrowupdating="gShow_RowUpdating" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AllowPaging="True" AllowSorting="True" 
                onpageindexchanging="gShow_PageIndexChanging" onsorting="gShow_Sorting" 
                onselectedindexchanged="gShow_SelectedIndexChanged">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Tên" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Địa chỉ" 
                        SortExpression="Address" />
                    <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                        ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
                        ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                        UpdateText="Cập nhật" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        </div>
        </td>
        </tr>
     </table>
</asp:Content>