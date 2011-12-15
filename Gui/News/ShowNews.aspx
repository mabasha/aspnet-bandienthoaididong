<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="ShowNews.aspx.cs" Inherits="Gui_News_ShowNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style2
        {
            width: 89%;
            height: 148px;
        }
        .style5
        {
            height: 23px;
        }
        .style3
        {
            width: 160px;
        }
        .style4
        {
            height: 28px;
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
        &nbsp;</p>
    <table __designer:mapid="b5" class="style2">
            <tr __designer:mapid="b6">
                <td __designer:mapid="b7" class="style5" colspan="2">
                    <asp:HyperLink ID="hlCategory" runat="server" 
                        NavigateUrl="San_pham.aspx" Font-Size="15pt" ForeColor="#33CCFF">Sản phẩm</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="b9">
                <td __designer:mapid="ba" align="center" class="style3" rowspan="2">
                    <asp:Image ID="imgSp" runat="server" />
                </td>
                <td __designer:mapid="bb" class="style4">
                    <asp:HyperLink ID="hlTitleSp" runat="server" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="Black">[hlTitleSp]</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="bc">
                <td __designer:mapid="cc">
                    <asp:Label ID="lbIntroSp" runat="server"></asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="bf">
                <td __designer:mapid="c0" colspan="2">
                    <asp:HyperLink ID="hlSp1" runat="server">[hlSp1]</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hlSp3" runat="server">[hlSp3]</asp:HyperLink>
                    <br />
                </td>
            </tr>
        </table>
        <table __designer:mapid="b5" class="style2">
            <tr __designer:mapid="b6">
                <td __designer:mapid="b7" class="style5" colspan="2">
                    <asp:HyperLink ID="hlCongnghe" runat="server" 
                        NavigateUrl="Cong_nghe.aspx" Font-Size="15pt" ForeColor="#33CCFF">Công nghệ</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="b9">
                <td __designer:mapid="ba" align="center" class="style3" rowspan="2">
                    <asp:Image ID="imgCn" runat="server" />
                </td>
                <td __designer:mapid="bb" class="style4">
                    <asp:HyperLink ID="hlTitleCn" runat="server" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="Black">[hlTitleCn]</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="bc">
                <td __designer:mapid="cc">
                    <asp:Label ID="lbIntroCn" runat="server" Font-Bold="False"></asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="bf">
                <td __designer:mapid="c0" colspan="2">
                    <asp:HyperLink ID="hlCn2" runat="server">[hlCn2]</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hlCn3" runat="server">[hlCn3]</asp:HyperLink>
                </td>
            </tr>
        </table>
        <table __designer:mapid="b5" class="style2">
            <tr __designer:mapid="b6">
                <td __designer:mapid="b7" class="style5" colspan="2">
                    <asp:HyperLink ID="hlThuthuat" runat="server" 
                        NavigateUrl="Thu_thuat.aspx" Font-Size="15pt" ForeColor="#33CCFF">Thủ thuật</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="b9">
                <td __designer:mapid="ba" align="center" class="style3" rowspan="2">
                    <asp:Image ID="imgTt" runat="server" />
                </td>
                <td __designer:mapid="bb" class="style4">
                    <asp:HyperLink ID="hlTitleTt" runat="server" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="Black">[hlTitleTt]</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="bc">
                <td __designer:mapid="cc">
                    <asp:Label ID="lbIntroTt" runat="server"></asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="bf">
                <td __designer:mapid="c0" colspan="2">
                    <asp:HyperLink ID="hlTt2" runat="server">[hlTt2]</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hlTt3" runat="server">[hlTt3]</asp:HyperLink>
                </td>
            </tr>
        </table>
        <table __designer:mapid="b5" class="style2">
            <tr __designer:mapid="b6">
                <td __designer:mapid="b7" class="style5" colspan="2">
                    <asp:HyperLink ID="hlNhanvat" runat="server" 
                        NavigateUrl="Nhan_vat.aspx" Font-Size="15pt" ForeColor="#33CCFF">Nhân vật</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="b9">
                <td __designer:mapid="ba" align="center" class="style3" rowspan="2">
                    <asp:Image ID="imgNv" runat="server" />
                </td>
                <td __designer:mapid="bb" class="style4">
                    <asp:HyperLink ID="hlTitleNv" runat="server" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="Black">[hlTitleNv]</asp:HyperLink>
                </td>
            </tr>
            <tr __designer:mapid="bc">
                <td __designer:mapid="cc">
                    <asp:Label ID="lbIntroNv" runat="server"></asp:Label>
                </td>
            </tr>
            <tr __designer:mapid="bf">
                <td __designer:mapid="c0" colspan="2">
                    <asp:HyperLink ID="hlNv2" runat="server">[hlNv2]</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hlNv3" runat="server">[hlNv3]</asp:HyperLink>
                </td>
            </tr>
        </table>
</asp:Content>

