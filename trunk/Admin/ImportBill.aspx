<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <style type="text/css">
        .style4
        {
            width: 100%;
            height: 135px;
        }
        .style5
        {
        }
        .style25
        {
            width: 82%;
            height: 181px;
        }
        .style26
        {
            width: 337px;
        }
        .style30
        {
            width: 636px;
        }
        .style31
        {
            width: 549px;
        }
        .style32
        {
            width: 271px;
        }
        .style35
        {
            height: 35px;
        }
        .style36
        {
            height: 52px;
        }
        .style37
        {
            width: 68%;
            height: 34px;
        }
        .style38
        {
            width: 427px;
        }
        .style39
        {
            width: 271px;
            height: 81px;
        }
        .style40
        {
            width: 549px;
            height: 81px;
        }
        </style>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
</head>
    <div class="header" align="center" 
        style="font-size: large; height: 62px; width: 1000px;">
        LẬP HÓA ĐƠN NHẬP</div>
    <div class="Add" style="height: 439px; width: 1011px;">
        <table style="width:62%; height: 421px;" align="center">
            <tr>
                <td class="style39">
                    Người Nhập :</td>
                <td class="style40">
                    <asp:DropDownList ID="dNguoiNhap" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="FullName" DataValueField="Username" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [FullName], [Username] FROM [Users]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style35">
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Loại sản phẩm :</td>
                <td class="style31">
                    <asp:RadioButton ID="rDienthoai" runat="server" AutoPostBack="True" 
                        Checked="True" GroupName="chooser" Text="Điện thoại" />
                    <asp:RadioButton ID="rPhukien" runat="server" AutoPostBack="True" 
                        GroupName="chooser" Text="Phụ kiện" />
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Tên sản phẩm :</td>
                <td class="style31">
                    <asp:TextBox ID="txtTenSp" runat="server" Width="52px" ></asp:TextBox>
                    <asp:Button ID="btnTenSp" runat="server" Text="Chọn sản phẩm" />
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Số lượng :</td>
                <td class="style31">
                    <asp:TextBox ID="txtNumber" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Đơn giá nhập :</td>
                <td class="style31">
                    <asp:TextBox ID="txtPrice" runat="server" Width="190px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style36">
    
    <asp:Button ID="btnAddViewstate" runat="server" onclick="btnAddViewstate_Click" 
        Text="Thêm sản phẩm" />
            
                </td>
            </tr>
        </table>
    </div>
    <table align="center" class="style37">
        <tr>
            <td>
    
    <asp:GridView ID="gridViewState" runat="server" AutoGenerateColumns="False" 
                    onrowdeleting="gridViewState_RowDeleting" Width="533px" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="Mã sản Phẩm" />
            <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
            <asp:BoundField DataField="IsPhone" HeaderText="Là điện thoại" />
            <asp:BoundField DataField="Number" HeaderText="Số lượng" />
            <asp:BoundField DataField="Price" HeaderText="Giá" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    
            </td>
            <td align="center" class="style38">
    
    <asp:Button ID="btnThemHD" runat="server"  Text="THÊM HÓA ĐƠN" Height="66px" 
            onclick="btnThemHD_Click" Width="135px" Visible="False" />
    
            </td>
        </tr>
    </table>
    <div style="height: 260px; width: 1284px; margin-bottom: 0px;" class="list">
        <table class="style4">
            <tr>
                <td class="style5" align="center">
                    <table class="style25">
                        <tr>
                            <td class="style26">
                                <asp:Label ID="lbThongbaoHD" runat="server"></asp:Label>
                            </td>
                            <td class="style30">
                                <asp:Label ID="lbThongbaoCTHD" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style26">
                                <asp:GridView ID="gridImportBill" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="3"                                      
                                    onrowdatabound="gridImportBill_RowDataBound"                                     
                                    onrowdeleting="gridImportBill_RowDeleting" BackColor="White" 
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                    <RowStyle ForeColor="#000066" />
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                                        <asp:BoundField DataField="FullName" HeaderText="Người nhập" />
                                        <asp:BoundField DataField="CreatedDate" HeaderText="Ngày nhập" />
                                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                                            ShowDeleteButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                            <td class="style30">
                    <asp:GridView ID="gridImportBillDt" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" 
                                    onrowcancelingedit="gridImportBillDt_RowCancelingEdit" 
                                    onrowediting="gridImportBillDt_RowEditing" 
                                    onrowdatabound="gridImportBillDt_RowDataBound1" 
                                    onrowdeleting="gridImportBillDt_RowDeleting" 
                                    onrowupdating="gridImportBillDt_RowUpdating" 
                                    onrowcommand="gridImportBillDt_RowCommand" BackColor="White" 
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"                                                              
                                    >
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:BoundField DataField="ImportBillID" HeaderText="Mã HĐ" ReadOnly="True" />
                            <asp:BoundField DataField="ID" HeaderText="Mã CTHĐ" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Mã sản phẩm">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMaSpTemp" runat="server" style="margin-left: 2px" 
                                        Width="50px"></asp:TextBox>
                                    <asp:Button ID="btnChonDtTemp" runat="server"
                                        Text="Chọn ĐT" CommandName="btnDt" />
                                    <asp:Button ID="btnChonPkTemp" runat="server" Text="Chọn PK" 
                                        CommandName="btnPk"  />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbProductID" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Loại sản phẩm">
                                <EditItemTemplate>
                                    <asp:RadioButton ID="rDtTemp" runat="server" Checked="True" 
                                        GroupName="rtemplate" Text="Điện thoại" Enabled="False" />
                                    <asp:RadioButton ID="rPkTemp" runat="server" GroupName="rtemplate" 
                                        Text="Phụ kiện" Enabled="False" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbIsPhone" runat="server" Text='<%# Eval("IsPhone").ToString()=="True" ?"Điện thoại":"Phụ kiện" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="ProductID" HeaderText="Mã sản phẩm" />--%>
                            <%--<asp:BoundField DataField="IsPhone" HeaderText="Là điện thoại" />--%>
                            <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                            <asp:BoundField DataField="Price" HeaderText="Đơn giá nhập" />
                            <asp:CommandField ButtonType="Image" 
                                SelectImageUrl="~/Images/Apps/edit-icon.jpg" ShowSelectButton="True" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                                ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                            </td>
                        </tr>
                    </table>                    
                </td>
            </tr>
        </table>
    </div>
    </asp:Content>