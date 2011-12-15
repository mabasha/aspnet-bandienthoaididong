<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Thu_thuat.aspx.cs" Inherits="Gui_News_Thu_thuat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            NavigateUrl="~/Gui/HomePage.aspx">Trang chủ</asp:HyperLink>
        &nbsp;&gt;
        <asp:HyperLink ID="hlTintuc" runat="server" ForeColor="#666666" 
            NavigateUrl="~/Gui/News/ShowNews.aspx">Tin tức</asp:HyperLink>
        &nbsp;&gt;
        <asp:HyperLink ID="hlCategory" runat="server" ForeColor="#666666" 
            NavigateUrl="Thu_thuat.aspx">Thủ thuật</asp:HyperLink>
    </p>
    <p>
    </p>
    <asp:GridView ID="gridShow" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" onpageindexchanging="gridShow_PageIndexChanging" 
        PageSize="5" ShowHeader="False" Width="762px">
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
                                    NavigateUrl='<%# "NewsDetails.aspx?id=" + Eval("ID") %>' 
                                    Text='<%# Eval("Title") %>' Font-Bold="True" ForeColor="#33CCFF"></asp:HyperLink>
                                <%--<a href="<%#"NewsDetails.aspx?id="+DataBinder.Eval(Container.DataItem,"ID")%>"><strong>
                                                <%#DataBinder.Eval(Container.DataItem, "Title")%></strong></a>--%>
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
    </asp:GridView>
</asp:Content>

