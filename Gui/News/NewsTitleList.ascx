<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsTitleList.ascx.cs" Inherits="Gui_News_NewsTitleList" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<div style="border:dotted 1px;">
<div style="background-color: #000000; color: #FFFFFF; text-align: center;">
                    <b>TIN TỨC</b></div>
<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
    <table class="style1">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Apps/dot.jpg" />
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "News/NewsDetail.aspx?id="+Eval("ID") %>' 
                        Text='<%# Eval("Title") %>'></asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
</div>