<%@ Page Language="C#"  MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AccessoriesManager.aspx.cs" Inherits="Admin_AccessoriesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/Utils.js" type="text/javascript"></script>

    <script type="text/javascript">

        $("document").ready(OnPageReady);

        function OnPageReady() {
            $("#<% =tPrice.ClientID%>").keydown(OnKeyDownCheckNumber);
            $("#<% =bAdd.ClientID%>").click(OnAddClick);
            
        }
        
        function OnAddClick() {
            if ($("#<% =tName.ClientID%>").val() == "" || $("#<% =tPrice.ClientID%>").val() == "" || $("#<% =tImageName.ClientID%>").val() == "") {
                alert("Bạn chưa nhập đầy đủ thông tin");
                return false;
            }
        }

    </script>
    <title>Quản lý phụ kiện</title>
            <table border=0 width=100px>
                <tr>
                    <td colspan=2 align=center>
                    <div class="style">QUẢN LÝ PHỤ KIỆN</div>              
                    </td>
                </tr>
            </table>
            <br />
            <table border=0 width=100px>               
                <tr>
                    <td class="left-add">Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> Nhà sản xuất</td>
                    <td>
                        <asp:DropDownList ID="cProducer" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Giá</td>
                    <td>
                        <asp:TextBox ID="tPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mô tả</td>
                    <td>
                        <asp:TextBox ID="tDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Hình ảnh</td>
                    <td>
                        <asp:TextBox ID="tImageName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseImage" runat="server" Text="..." 
                            onclick="bChooseImage_Click" />
                        <asp:Button ID="bShowImage" runat="server" onclick="bShowImage_Click" 
                            Text="Hiện hình ảnh" />
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:Image ID="iAdd" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                    <asp:Button ID="bAdd" runat="server" Text="Thêm" onclick="bAdd_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:Label ID="lThongBao" runat="server"></asp:Label>
                    </td>
                </tr>
 
                <tr>
                    <td colspan=2>
            <asp:GridView ID="gShow" runat="server" AutoGenerateColumns="False" 
                AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
                GridLines="None" onpageindexchanging="gShow_PageIndexChanging" 
                onsorting="gShow_Sorting" onrowcancelingedit="gShow_RowCancelingEdit" 
                onrowdatabound="gShow_RowDataBound" onrowdeleting="gShow_RowDeleting" 
                onrowediting="gShow_RowEditing" onrowupdating="gShow_RowUpdating">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Tên" SortExpression="Name" />
                    <asp:TemplateField HeaderText="NSX" SortExpression="ProducerName">
                    <ItemTemplate><asp:Label ID="lNSX" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                        
                    </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                    <asp:TemplateField HeaderText="Ảnh" SortExpression="Image">
                        <ItemTemplate>
                            <asp:Image ID="iImageTemplate" runat="server" 
                                ImageUrl='<%# "~/Images/Accessory/"+Eval("Image") %>' Width="60px" />
                            <br />
                            <asp:Label ID="lImageNameTemplate" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tImageNameTemplate" runat="server" Text='<%# Eval("Image") %>'></asp:TextBox>
                            <asp:Button ID="bChooseImageTemplate" runat="server" Text="Button" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Mô tả" 
                        SortExpression="Description" />
                    <asp:CommandField ButtonType="Image" SelectText="Chọn" 
                        ShowSelectButton="True" SelectImageUrl="AdminSite/Template/images/valid.png"/>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="AdminSite/Template/images/error.png" 
                        ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True"
                        UpdateText="Cập nhật" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
                    </td>
                    </tr>
    </table>
</asp:Content>
