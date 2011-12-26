<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Gui_HomePage" %>

<%@ Register src="Products/ShowPhoneSmall.ascx" tagname="ShowPhoneSmall" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/HomePage.css" rel="stylesheet" type="text/css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <div id="producst">
    
        <div class="border-top">
            <div class="border-top-left"></div>
            <div class="border-top-center"></div>
            <div class="border-top-right"></div>
        </div>
        <div class="border-left">
        <div class="border-right">
            <div id="search">
                <table>
                    <tr>
                    <td>Tìm kiếm </td>
                    <td>
                    <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
        &nbsp;<asp:DropDownList ID="dProducer" runat="server">
                    </asp:DropDownList>
                    </td>
                 <td>
                    <asp:DropDownList ID="dPriceFrom" runat="server">
                        <asp:ListItem>Giá từ ...</asp:ListItem>
                        <asp:ListItem>300.000</asp:ListItem>
                        <asp:ListItem>1.000.000</asp:ListItem>
                        <asp:ListItem>2.000.000</asp:ListItem>
                        <asp:ListItem>3.000.000</asp:ListItem>
                        <asp:ListItem>5.000.000</asp:ListItem>
                        <asp:ListItem>7.000.000</asp:ListItem>
                        <asp:ListItem>10.000.000</asp:ListItem>
                        <asp:ListItem>12.000.000</asp:ListItem>
                        <asp:ListItem>15.000.000</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="dPriceTo" runat="server">
                        <asp:ListItem>Giá đến ...</asp:ListItem>
                        <asp:ListItem>300.000</asp:ListItem>
                        <asp:ListItem>1.000.000</asp:ListItem>
                        <asp:ListItem>2.000.000</asp:ListItem>
                        <asp:ListItem>3.000.000</asp:ListItem>
                        <asp:ListItem>5.000.000</asp:ListItem>
                        <asp:ListItem>7.000.000</asp:ListItem>
                        <asp:ListItem>10.000.000</asp:ListItem>
                        <asp:ListItem>12.000.000</asp:ListItem>
                        <asp:ListItem>15.000.000</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                        <asp:ImageButton ID="bSearch" runat="server" 
                            ImageUrl="~/Images/Apps/Front/b-search.png" onclick="bSearch_Click" />
                </td>
                    </tr>
                    </table>
            </div>
            
            <div id="filter" class="filter">
                Số sản phẩm
                <asp:DropDownList ID="dNumberShow" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="dNumberShow_SelectedIndexChanged">
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp; Sắp xếp theo
                <asp:DropDownList ID="dOrderBy" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="dOrderBy_SelectedIndexChanged">
                    <asp:ListItem>A-&gt;Z</asp:ListItem>
                    <asp:ListItem>Z-&gt;A</asp:ListItem>
                    <asp:ListItem>Giá tăng dần</asp:ListItem>
                    <asp:ListItem>Giá giảm dần</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="list-product">
                <div class="list-title">
                    <div class="list-title-left">Điện thoại siêu cấp</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail"> <center>
                    <uc1:ShowPhoneSmall ID="spSuper" runat="server" 
                    PriceFrom="10000000" Number="8"/></center>
                </div>
            </div>
            
            <div class="list-product">
                <div class="list-title">
                    <div class="list-title-left">Điện thoại cao cấp</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail">
                    <center>
                        <uc1:ShowPhoneSmall ID="spHigh" runat="server" 
                        PriceFrom="5000000" PriceTo="10000000" Number="8"/></center>
                </div>
            </div>
            
            <div class="list-product">
                <div class="list-title">
                    <div class="list-title-left">Điện thoại trung cấp</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail">
                    <center>
                        <uc1:ShowPhoneSmall ID="spMedium" runat="server" PriceFrom="2000000" 
                            PriceTo="5000000" Number="8"/></center>
                </div>
            </div>
            
            <div class="list-product">
                <div class="list-title">
                    <div class="list-title-left">Điện thoại phổ thông</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail">
                    <center>
                        <uc1:ShowPhoneSmall ID="spNormal" runat="server" PriceTo="2000000" 
                            Number="8"/></center>
                </div>
            </div>
       </div>   <!-- border left end-->
       </div>   <!-- border right end -->
       
       <div class="border-bottom">
            <div class="border-bottom-left"></div>
            <div class="border-bottom-center"></div>
            <div class="border-bottom-right"></div>
       </div>
    </div>
    
</asp:Content>

