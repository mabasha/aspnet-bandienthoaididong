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
        color:Red;
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

<div style=" margin-top: 10px">
    <table class="style1" border=0>
        <tr>
            <td class="title" align=center>
                Hãng điện thoại</td>
        </tr>
        <tr>
            <td >
                <asp:DataList ID="dShow" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                    Width="195px" BorderStyle="None" GridLines="Horizontal" CssClass="style2">
                    <ItemTemplate>

                                        <asp:Image ID="iArrow" runat="server" 
                                            ImageUrl="~/Images/Apps/Front/arrow.gif" />
                                        <asp:HyperLink CssClass="" ID="hName" runat="server" Text='<%# Eval("Name") %>' 
                                            
                                            NavigateUrl='<%# "~/Gui/Products/PhoneList.aspx?ProducerName="+Eval("Name") %>'></asp:HyperLink>
 
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</div>