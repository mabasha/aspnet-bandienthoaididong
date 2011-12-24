<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="PhoneList.aspx.cs" Inherits="Gui_Products_PhoneList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <asp:GridView ID="grid_Phone" runat="server" AutoGenerateColumns="False" 
            AllowPaging="True" AllowSorting="True" style="text-align: left" 
            Width="100%" onrowcommand="grid_Phone_RowCommand" 
            onpageindexchanging="grid_Phone_PageIndexChanging" CellPadding="4" 
        ForeColor="#333333" GridLines="None" PageSize="7">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ImageField DataImageUrlField="Image" 
                    DataImageUrlFormatString="~/Images/Phone/{0}" HeaderText="Hình ảnh">
            </asp:ImageField>
            <asp:TemplateField HeaderText="Giới thiệu chung">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td align="left">
                                <b>Tên điện thoại</b> <b>:</b>
                                <asp:HyperLink ID="url_PhoneName" runat="server" ForeColor="Blue" 
                                        NavigateUrl='<%# "~/Gui/PhoneDetail.aspx?id=" + Eval("id") %>' 
                                        Text='<%# Eval("Name") %>'></asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <b>Hãng sản xuất</b> <b>:</b>
                                <asp:Label ID="lb_Producer" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <b>Giá :</b>
                                <asp:Label ID="lb_Price" runat="server" 
                                        Text='<%# Eval("Price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="text-align: right">
                                <asp:HyperLink ID="url_PhoneDetail" runat="server" 
                                        NavigateUrl='<%# "~/Gui/PhoneDetail.aspx?id=" + Eval("id") %>'>Chi tiết ...</asp:HyperLink>
                                    .</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tính năng nổi bật">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Image" CommandName="Chon_mua" ItemStyle-HorizontalAlign="Center" HeaderText="Đặt mua" 
                    ImageUrl="~/Images/Apps/xeHang.png">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ButtonField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

