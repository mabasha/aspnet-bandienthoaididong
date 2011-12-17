<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="Gui_News_NewsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            height: 331px;
        }
        .style3
        {
            height: 6px;
        }
        .style4
        {
            height: 11px;
        }
        .style5
        {
            height: 4px;
        }
        .style6
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <table class="style2">
        <tr>
            <td class="style3">
                <asp:HyperLink ID="hlTrangchu" runat="server" ForeColor="#666666" 
                    NavigateUrl="~/Gui/HomePage.aspx">Trang chủ</asp:HyperLink>
&nbsp;&gt;
                <asp:HyperLink ID="hlTintuc" runat="server" ForeColor="#666666" 
                    NavigateUrl="~/Gui/News/ShowNews.aspx">Tin tức</asp:HyperLink>
&nbsp;&gt;
                <asp:HyperLink ID="hlCategory" runat="server" ForeColor="#666666">[hlCategory]</asp:HyperLink>
&nbsp;&gt;
            </td>
        </tr>
        <tr>
            <td class="style4" align="left">
                <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Size="16pt" 
                    ForeColor="#00CCFF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4" align="right">
                <asp:Label ID="lbDate" runat="server" Font-Italic="True" ForeColor="Gray"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lbIntro" runat="server" Font-Italic="False" Font-Size="Large" 
                    ForeColor="Black" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <div runat="server" id="divContents">
                </div>
                <p align="right">
                    <asp:Label ID="lbAuthor" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </p>
            </td>
        </tr>
    </table>
</asp:Content>

