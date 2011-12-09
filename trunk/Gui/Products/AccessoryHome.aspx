<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="AccessoryHome.aspx.cs" Inherits="Gui_Products_AccessoryHome" %>

<%@ Register src="ShowAccessorySmall.ascx" tagname="ShowAccessorySmall" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../CSS/HomePage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <div id="products">
    
        <div class="border-top">
            <div class="border-top-left"></div>
            <div class="border-top-center"></div>
            <div class="border-top-right"></div>
        </div>
        <div class="border-left">
        <div class="border-right">
            <div id="search">Tìm kiếm :
                <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
    &nbsp;<asp:DropDownList ID="dProducer" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="dPriceFrom" runat="server">
                    <asp:ListItem>Giá từ ...</asp:ListItem>
                    <asp:ListItem>50.000</asp:ListItem>
                    <asp:ListItem>200.000</asp:ListItem>
                    <asp:ListItem>500.000</asp:ListItem>
                    <asp:ListItem>1.000.000</asp:ListItem>
                    <asp:ListItem>2.000.000</asp:ListItem>
                    <asp:ListItem>5.000.000</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="dPriceTo" runat="server">
                    <asp:ListItem>Giá đến ...</asp:ListItem>
                    <asp:ListItem>50.000</asp:ListItem>
                    <asp:ListItem>200.000</asp:ListItem>
                    <asp:ListItem>500.000</asp:ListItem>
                    <asp:ListItem>1.000.000</asp:ListItem>
                    <asp:ListItem>5.000.000</asp:ListItem>
                    <asp:ListItem>2.000.000</asp:ListItem>
                </asp:DropDownList>
    &nbsp;<asp:ImageButton ID="bSearch" runat="server" 
                    ImageUrl="~/Images/Apps/Front/b-search.png" onclick="bSearch_Click" />
            </div>
            
            <div id="filter" class="filter">
                Số sản phẩm
                <asp:DropDownList ID="dNumberShow" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="dNumberShow_SelectedIndexChanged" Width="31px">
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
                    <div class="list-title-left">Phụ kiện cao cấp</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail"> <center>
                    <uc1:ShowAccessorySmall ID="saHigh" runat="server" PriceFrom="2000000" />
                    </center>
                </div>
            </div>
            
            <div class="list-product">
                <div class="list-title">
                    <div class="list-title-left">Phụ kiện thông thường</div>
                    <div class="list-title-right"></div>
                </div>
                <div class="list-detail">
                    <center>
                        <uc1:ShowAccessorySmall ID="saNormal" runat="server" PriceTo="2000000" />
                        </center>
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

