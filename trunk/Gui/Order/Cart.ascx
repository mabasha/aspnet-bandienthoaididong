<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cart.ascx.cs" Inherits="Gui_Order_Cart" %>
    <table>
        <tr>
            <td>
                <asp:ImageButton ID="iCart" runat="server" 
            ImageUrl="~/Images/Apps/xeHang.png" onclick="iCart_Click" />
            </td>
            <td>
               Giỏ hàng của bạn hiện tại :
            </td>
            <td>
                <asp:Label ID="lNumber" runat="server"></asp:Label></center>
            </td>
        </tr>
    </table>
        
  
           

    <div style="clear:both"></div>

