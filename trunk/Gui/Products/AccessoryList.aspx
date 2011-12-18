<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="AccessoryList.aspx.cs" Inherits="Gui_Products_AccessoryList" %>

<%@ Register src="AccessoryListCtrl.ascx" tagname="AccessoryListCtrl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Danh sách các phụ kiện</title>
<link href="../../CSS/HomePage.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">

<div class="border-top">
    <div class="border-top-left"></div>
    <div class="border-top-center"></div>
    <div class="border-top-right"></div>
</div>
<div class="border-left">
<div class="border-right">
        <uc1:AccessoryListCtrl ID="accList" runat="server" />
</div>
</div>
<div class="border-bottom">
    <div class="border-bottom-left"></div>
    <div class="border-bottom-center"></div>
    <div class="border-bottom-right"></div>
</div>




</asp:Content>

