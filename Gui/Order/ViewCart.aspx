<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="Gui_Order_ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Giỏ hàng của bạn</title>
    <style type="text/css">
        .show
        {
        	margin-top:25px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
<div id="view-card-wrapper" style="width:800px;">
    <div id="acc" class="show">
        <asp:GridView ID="gAcc" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" 
                    SortExpression="Name" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
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
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>

