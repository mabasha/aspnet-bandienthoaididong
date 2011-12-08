<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Gui_HomePage" %>

<%@ Register src="Products/ShowPhoneSmall.ascx" tagname="ShowPhoneSmall" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/HomePage.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script>
        $('document').ready(OnPageReady);
        function OnPageReady() {
            $('#news-detail').load('News/NewsTitleList.aspx');
        }
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <div id="products">
        <div class="border-top"></div>
            <div class="border-left">
            <div class="border-right">
                <div id="search">Tìm kiếm :
                    <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
        &nbsp;<asp:DropDownList ID="dProducer" runat="server">
                    </asp:DropDownList>
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
        &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Images/Apps/Front/b-search.png" />
                </div>
                <div>Sản phẩm cao cấp<br />
                    <center><uc1:ShowPhoneSmall ID="ShowPhoneSmall1" runat="server" /></center>
                </div>
                <div>Sản phẩm trung cấp</div>
                <div>Sản phẩm phổ thông</div>
           </div>   <!-- border left -->
           </div>   <!-- border right -->
    </div>
    
</asp:Content>

