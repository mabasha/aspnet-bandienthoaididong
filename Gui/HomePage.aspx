<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Gui_HomePage" %>

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
        <div id="search">tìm kiếm</div>
        <div>Sản phẩm cao cấp</div>
        <div>Sản phẩm trung cấp</div>
        <div>Sản phẩm phổ thông</div>
    </div>
    
</asp:Content>

