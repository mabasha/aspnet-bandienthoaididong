<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessoriesManager.aspx.cs" Inherits="Admin_AccessoriesManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>

    <script src="../Scripts/Utils.js" type="text/javascript"></script>

    <script type="text/javascript">

        $("document").ready(OnPageReady);

        function OnPageReady() {
            //$("#bChooseImage").click(OpenPopup);
            $("#tPrice").keydown(OnKeyDownCheckNumber);
            $("#bAdd").click(OnAddClick);
            
        }

        /*function OpenPopup() {
            window.open("ImageManager.aspx", 'mypopup', 'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no');
            self.close();
        }*/
        
        function OnAddClick() {
            if ($("#tName").val() == "" || $("#tPrice").val() == "" || $("#tImageName").val() == "") {
                alert("Bạn chưa nhập đầy đủ thông tin");
                return false;
            }
        }

    </script>
    <title>Quản lý phụ kiện</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <div class="header"> Quản lý phụ kiện</div>
        <div class="add">
            <table class="style1">
                <tr>
                    <td class="left-add">
                        Tên</td>
                    <td>
                        <asp:TextBox ID="tName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nhà sản xuất</td>
                    <td>
                        <asp:DropDownList ID="cProducer" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Giá</td>
                    <td>
                        <asp:TextBox ID="tPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mô tả</td>
                    <td>
                        <asp:TextBox ID="tDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td id="tDes">
                        Hình ảnh</td>
                    <td>
                        <asp:TextBox ID="tImageName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseImage" runat="server" Text="..." 
                            onclick="bChooseImage_Click" />
                        <asp:Button ID="bShowImage" runat="server" onclick="bShowImage_Click" 
                            Text="Hiện hình ảnh" />
                    </td>
                </tr>
                <tr>
                    <td id="tDes">
                        &nbsp;</td>
                    <td>
                        <asp:Image ID="iAdd" runat="server" />
                    </td>
                </tr>
                </table>
            <asp:Button ID="bAdd" runat="server" Text="Thêm" onclick="bAdd_Click" />
            <br />
            <asp:Label ID="lThongBao" runat="server"></asp:Label>
        </div>
        
        <div class="list">
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
                        <EditItemTemplate>
                            <asp:DropDownList ID="dProducerName" runat="server" 
                                DataSourceID="dsProducerName" DataTextField="Name" DataValueField="ID" 
                                SelectedValue='<%# Eval("ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsProducerName" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                SelectCommand="SELECT [ID], [Name] FROM [Producer]"></asp:SqlDataSource>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                    <asp:TemplateField HeaderText="Ảnh" SortExpression="Image"></asp:TemplateField>
                    <asp:BoundField DataField="Description" HeaderText="Mô tả" 
                        SortExpression="Description" />
                    <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                        ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
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
        </div>
    </div>
    </form>
    </body>
</html>
