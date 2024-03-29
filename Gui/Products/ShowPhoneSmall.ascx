﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowPhoneSmall.ascx.cs" Inherits="Gui_Products_ShowPhoneSmall" %>



<asp:DataList ID="gShow" runat="server" RepeatColumns="4">
    <ItemTemplate>
        <div style="padding: 5px; margin: 5px; border: 2px solid #C0C0C0; text-align: center; width: 150px; height: 150px; overflow: hidden">
            <asp:Image ID="iPhone" runat="server" Height="80px" 
                ImageUrl='<%# "~/Images/Phone/"+Eval("Image") %>' />
            <br />
            <asp:HyperLink ID="hName" runat="server"
                NavigateUrl='<%# "~/Gui/Products/PhoneDetail.aspx?id="+Eval("ID") %>' style="color:Gray"
                Text='<%# Eval("Name") %>'></asp:HyperLink>
            <br />
            <asp:Label ID="lPrice" runat="server" ForeColor="#FF3300" 
                Text='<%# Eval("Price", "{0:#,##0}")+" đồng" %>'></asp:Label>
        </div>
    </ItemTemplate>
</asp:DataList>
