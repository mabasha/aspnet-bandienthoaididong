<%@ Page Language="C#"  MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AccessoriesManager.aspx.cs" Inherits="Admin_AccessoriesManager" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <table>
                <tr>
                    <td colspan=2 align=center>
                    <div class="style">QUẢN LÝ PHỤ KIỆN</div>              
                    </td>
                </tr>
            </table>
            <br />
            <table>               
                <tr>
                    <td class="left-add">Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server" Width="180px" CssClass="styleText" 
                            BorderStyle="None" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> Nhà sản xuất</td>
                    <td>
                        <asp:DropDownList ID="cProducer" runat="server" CssClass="styleText">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Giá</td>
                    <td>
                        <asp:TextBox ID="tPrice" runat="server" Width="180px" CssClass="styleText" 
                            BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mô tả</td>
                    <td>
                        <asp:TextBox ID="tDescription" runat="server" TextMode="MultiLine" 
                            Width="318px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Hình ảnh</td>
                    <td>
                        <asp:TextBox ID="tImageName" runat="server" Width="180px" CssClass="styleText" 
                            BorderStyle="None"></asp:TextBox>
                        <asp:Button ID="bChooseImage" runat="server" Text="..." 
                            onclick="bChooseImage_Click" CssClass="styleButton" BorderStyle="None" />
                        <asp:Button ID="bShowImage" runat="server" onclick="bShowImage_Click" 
                            Text="Hiện hình ảnh"  CssClass="styleButton" BorderStyle="None"/>
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                        <asp:Image ID="iAdd" runat="server"/>
                    </td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td colspan=2 align=center>
                    <asp:Button  ID="bAdd" runat="server" Text="Thêm" onclick="bAdd_Click" Height="36px" 
                            Width="105px" CssClass="styleButtonAdd" BorderStyle="None" />
                    <asp:Button  ID="Button1" runat="server" Text="Xóa" onclick="bAdd_Click" Height="36px" 
                            Width="105px" CssClass="styleButtonCancle" BorderStyle="None" />
                            <br />
                    </td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td colspan=2>
                        <asp:Label ID="lThongBao" runat="server"></asp:Label>
                    </td>
                </tr>
 
                <tr>
                    <td colspan="2">Tìm kiếm
                        <asp:TextBox ID="tInput" runat="server"></asp:TextBox>
                        <asp:Button ID="bSearch" runat="server" onclick="bSearch_Click" Text="Tìm" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:GridView class="styleGrid" ID="gShow" runat="server" AutoGenerateColumns="False" 
                AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
                GridLines="None" onpageindexchanging="gShow_PageIndexChanging" 
                onsorting="gShow_Sorting" onrowcancelingedit="gShow_RowCancelingEdit" 
                onrowdatabound="gShow_RowDataBound" onrowdeleting="gShow_RowDeleting" 
                onrowediting="gShow_RowEditing" onrowupdating="gShow_RowUpdating">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Tên" SortExpression="Name" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="NSX" SortExpression="ProducerName">
                    <ItemTemplate><asp:Label ID="lNSX" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                        
                    </ItemTemplate>
                        
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        
                    </asp:TemplateField>
                    <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
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
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Mô tả" 
                        SortExpression="Description" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" SelectText="Chọn" 
                        ShowSelectButton="True" 
                        SelectImageUrl="AdminSite/Template/images/valid.png" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="AdminSite/Template/images/error.png" 
                        ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                    <asp:CommandField CancelText="Hủy" ShowEditButton="True" SelectImageUrl="AdminSite/Template/images/valid.png"
                        UpdateText="Cập nhật" 
                        EditImageUrl="~/Admin/AdminSite/Template/images/user_edit.png" 
                        ButtonType="Image" 
                        CancelImageUrl="~/Images/Apps/cancel-icon.png" 
                        UpdateImageUrl="~/Admin/AdminSite/Template/images/valid.png" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </EmptyDataTemplate>
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
                    <tr>
                        <td></td>
                    </tr>
    </table>
</asp:Content>
