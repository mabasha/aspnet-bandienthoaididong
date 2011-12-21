<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="Gui_Order_ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Giỏ hàng của bạn</title>
    <style type="text/css">
        .show
        {
        	margin-top:10px;
        	margin-bottom:10px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
<div id="view-card-wrapper" style="width:800px;">
    <div id="buy-confirm">
        
        <asp:FormView ID="fBuyConfirm" runat="server" 
            onitemcommand="fBuyConfirm_ItemCommand" >
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
                </div>
                <div id="buy" style="padding: 5px; width:150px; height:140px; float:right;">
                    <center>Giá :
                    <asp:Label ID="lPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text='<%# Eval("Price","{0:#,##0}") %>'> đ</asp:Label>
                        <br />
                        <br />
                        <b>Số lượng</b>
                        <asp:TextBox ID="tNum" runat="server" Height="27px" Width="35px">1</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="bAdd" runat="server" Height="26px" Text="Thêm vào giỏ hàng" 
                            Width="130px" CommandName="bAdd" />
                        </center>
                </div>
                <div style="clear:both"></div>
            </div>
                
            </ItemTemplate>
        </asp:FormView>
        
    </div>
    <div id="acc" class="show">
        <asp:GridView ID="gAcc" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" 
                    SortExpression="Name" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>

    <div id="phone" class="show">
        <asp:GridView ID="gPhone" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" 
                    SortExpression="Name" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button ID="bOrder" runat="server" Text="Đặt hàng" onclick="bOrder_Click" />

</div>
</asp:Content>

