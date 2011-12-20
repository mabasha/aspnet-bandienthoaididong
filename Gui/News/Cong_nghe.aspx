﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Cong_nghe.aspx.cs" Inherits="Gui_News_Cong_nghe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../CSS/News.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 104px;
        }
        .style4
        {
            width: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <p>
                <asp:HyperLink ID="hlTrangchu" runat="server" ForeColor="#666666" 
                    NavigateUrl="~/Gui/HomePage.aspx" CssClass="hyperlink" Target="_blank">Trang chủ</asp:HyperLink>
&nbsp;&gt;
                <asp:HyperLink ID="hlTintuc" runat="server" ForeColor="#666666" 
                    NavigateUrl="~/Gui/News/ShowNews.aspx" CssClass="hyperlink" 
                    Target="_blank">Tin tức</asp:HyperLink>
&nbsp;&gt;
                <asp:HyperLink ID="hlCategory" runat="server" ForeColor="#666666" 
            NavigateUrl="Cong_nghe.aspx" CssClass="hyperlink" Target="_blank">Công nghệ</asp:HyperLink>
    </p>
    <p></p>
    <asp:GridView ID="gridShow" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" onpageindexchanging="gridShow_PageIndexChanging" 
        PageSize="5" ShowHeader="False" Width="762px" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <table class="style2">
                        <tr>
                            <td align="center" class="style4" rowspan="3">
                                <asp:Image ID="imgAvatar" runat="server" 
                                    ImageUrl='<%# "~/Images/News/" + Eval("ImageUrl") %>' />
                            </td>
                            <td>
                                <asp:HyperLink ID="hlTitle" runat="server" 
                                     Text='<%# Eval("Title") %>' 
                                    NavigateUrl='<%# "NewsDetails.aspx?id=" + Eval("ID") %>' Font-Bold="True" 
                                    ForeColor="#33CCFF" CssClass="hyperlink" Target="_blank"></asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbCreatedDate" runat="server" Font-Size="Small" 
                                    ForeColor="#666666" Text='<%# Eval("CreatedDate") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:Label ID="lbGioithieu" runat="server" Text='<%# Eval("IntroContent") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
</asp:Content>

