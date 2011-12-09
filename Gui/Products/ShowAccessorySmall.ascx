<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowAccessorySmall.ascx.cs" Inherits="Gui_Products_ShowAccessorySmall" %>
<asp:DataList ID="gShow" runat="server" RepeatColumns="4">
    <ItemTemplate>
        <div style="padding: 5px; margin: 5px; border: 2px solid #C0C0C0; text-align: center; width: 150px; height: 150px; overflow: hidden;">
            <asp:Image ID="iAcc" runat="server" Height="80px" 
                ImageUrl='<%# "~/Images/Accessory/"+Eval("Image") %>' />
            <br />
            <asp:HyperLink ID="hName" runat="server" 
                NavigateUrl='<%# "~/Gui/Products/AccessoryDetail.aspx?id="+Eval("ID") %>' 
                Text='<%# Eval("Name") %>'></asp:HyperLink>
            <br />
            <asp:Label ID="lPrice" runat="server" ForeColor="#FF3300" 
                Text='<%# Eval("Price", "{0:#,##0}")+" đồng" %>'></asp:Label>
        </div>
    </ItemTemplate>
</asp:DataList>
