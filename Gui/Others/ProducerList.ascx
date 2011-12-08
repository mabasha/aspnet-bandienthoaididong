<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProducerList.ascx.cs" Inherits="Gui_Others_ProducerList" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<div style="border:dotted 1px; margin-top: 10px;">
    <table class="style1">
        <tr>
            <td style="color: #FFFFFF; background-color: #000000; font-weight: bold; text-align:center">
                CÁC HÃNG ĐIỆN THOẠI</td>
        </tr>
        <tr>
            <td bgcolor="#FFFFCC">
                <asp:DataList ID="dShow" runat="server" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                    Width="195px">
                    <FooterStyle BackColor="Tan" />
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                        <div>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Image ID="iArrow" runat="server" 
                                            ImageUrl="~/Images/Apps/Front/arrow.gif" />
                                        <asp:HyperLink ID="hName" runat="server" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</div>