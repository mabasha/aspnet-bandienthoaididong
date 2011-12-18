<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccessoryListCtrl.ascx.cs" Inherits="Gui_Products_AccessoryListCtrl" %>
<asp:DataList ID="gShow" runat="server" RepeatColumns="1">
    <ItemTemplate>
            <div class="wrapper" style="width:750px; margin-top:10px;">
                <div id="image" 
                    style="border: 2px solid #C0C0C0; padding: 5px; width:140px; height:140px; float:left">
                    <asp:Image ID="img" runat="server" Height="134px" 
                        ImageUrl='<%# "~/Images/Accessory/"+Eval("Image") %>' Width="128px" />
                </div>
                <div id="info" style="padding: 5px; height:140px; float:left; width:400px;">
                    <asp:Label ID="lName" runat="server" Font-Bold="True" 
                        Text='<%# Eval("Name") %>'></asp:Label>
                    <br />
                    Nhà sản xuất :
                    <asp:Label ID="lProductName" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lDescription" runat="server" Font-Italic="True" 
                        Text='<%# Eval("Description") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:HyperLink ID="hlViewDetail" runat="server" Font-Bold="True" 
                        ForeColor="Blue" 
                        NavigateUrl='<%# "~/Gui/Products/AccessoryDetail.aspx?id="+Eval("ID") %>'>Xem chi tiết</asp:HyperLink>
                </div>
                <div id="buy" style="padding: 5px; width:150px; height:140px; float:right;">
                    <center>Giá :
                    <asp:Label ID="lPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text='<%# Eval("Price","{0:#,##0}") %>'> đ</asp:Label>
                        <br />
                        <br />
                        <asp:ImageButton ID="bBuy" runat="server" 
                            ImageUrl="~/Images/Apps/Front/b-buy.png" />
                        </center>
                </div>
                <div style="clear:both"></div>
                <div class="seperator" style="clear:both; height:1px; background-color:gray; margin:5px;"></div>
            </div>
            </ItemTemplate>
</asp:DataList>

<div id="navigation">
    <center><asp:HyperLink ID="hlFirst" runat="server" Visible="False">Trang đầu</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlPrev" runat="server" Visible="False">Trang trước</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lPage" runat="server" Font-Bold="True" Font-Size="Larger" 
            ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlNext" runat="server">Trang tiếp</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlLast" runat="server">Trang cuối</asp:HyperLink></center>
</div>


