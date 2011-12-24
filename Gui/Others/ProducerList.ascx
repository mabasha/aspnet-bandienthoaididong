<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProducerList.ascx.cs" Inherits="Gui_Others_ProducerList" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        box-shadow: 0px 0px 0px 0px #818181;
    -webkit-box-shadow: 0px 0px 1px 1px #818181;
    -moz-box-shadow: 1px 1px 1px 1px #818181;
    }
    
    .style2
    {
        text-decoration:none;
        color:Black;
    }

    .title
    {
         background: -moz-linear-gradient(bottom, #ffffff, #E1E1E1);
        background: -webkit-gradient(linear, center bottom, center top, from(#ffffff), to(#E1E1E1));
        font-size:small;
        font-weight:bold;
        height:30px;
    }
</style>
<div style=" margin-top: 10px;">
    <table class="style1" border=0>
        <tr>
            <td class="title" align=center>
                Hãng điện thoại</td>
        </tr>
        <tr>
            <td bgcolor="White">
                <asp:DataList ID="dShow" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                    Width="195px" BorderStyle="None" GridLines="Horizontal">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Image ID="iArrow" runat="server" 
                                            ImageUrl="~/Images/Apps/Front/arrow.gif" />
                                        <asp:HyperLink CssClass="style2" ID="hName" runat="server" Text='<%# Eval("Name") %>' 
                                            NavigateUrl='<%# "~/Gui/Products/ShowProducts.aspx?ProducerName="+Eval("Name") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </td>
        </tr>
    </table>
</div>