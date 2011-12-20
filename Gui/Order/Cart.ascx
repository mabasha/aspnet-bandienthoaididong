<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cart.ascx.cs" Inherits="Gui_Order_Cart" %>

<div id="cart-wrapper" style="height:auto; width:auto; float:left;border: solid 2px blue;">
    <div id="cart" style="float:left; padding:5px;">
        <asp:ImageButton ID="iCart" runat="server" 
            ImageUrl="~/Images/Apps/xeHang.png" onclick="iCart_Click" />
    </div>
    <div id="number" style="background-color:Blue; color:Red; float:left; font-weight:bold; padding:5px; width:24px;">
        <center>
            <asp:Label ID="lNumber" runat="server"></asp:Label></center>
    </div>
    <div style="clear:both"></div>
</div>

