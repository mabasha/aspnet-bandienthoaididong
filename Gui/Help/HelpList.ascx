<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HelpList.ascx.cs" Inherits="Gui_Help_WebUserControl" %>

<style type="text/css">
    .style1
    {
    	margin-top:10px;
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

<table class="style1" border=0>
        <tr>
            <td class="title" align=center>
                Hỗ trợ trực tuyến</td>
        </tr>
        <tr>
            <td>
                    <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Apps/Front/dot.jpg" />
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "~/Gui/News/NewsDetails.aspx?id="+Eval("ID") %>' 
                        Text='<%# Eval("Title") %>'></asp:HyperLink>
                        </ItemTemplate>
                        </asp:DataList>
            </td>
        </tr>
</table>
    
