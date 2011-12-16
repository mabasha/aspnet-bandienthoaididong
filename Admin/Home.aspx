<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Admin_Home" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/Utils.js" type="text/javascript"></script>

<table width=100%>
    <tr>
        <td align=center>
            <div class="styleButtonHome">
                <a href="../Admin/AccessoriesManager.aspx"><image src="../Admin/AdminSite/Template/images/AccessoriesManager.png" width="70%"></image></a>
            </div>
        </td>
       <td align=center>
            <div class="styleButtonHome">
                <a href="../Admin/PhoneManager.aspx"><image src="../Admin/AdminSite/Template/images/PhoneManager.png" width="75%"></image></a>
            </div>
        </td>
       <td align=center>
            <div class="styleButtonHome">
                <a href="../Admin/AcountManager.aspx"><image src="../Admin/AdminSite/Template/images/UserManager.png" width="65%"></image></a>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan=3>
            <br />
        </td>
    </tr>

     <tr>       
        <td align=center>
        <div class="styleButtonHome">
                  
                <a href="../Admin/"><image src="../Admin/AdminSite/Template/images/Report.png" width="65%"></image></a>
            </div>
        </td>
        <td align=center>
        <div class="styleButtonHome">
                
                <a href="../Admin/ImageManager.aspx"><image src="../Admin/AdminSite/Template/images/Picture.png" width="65%"></image></a>
            </div>
        </td>
        <td align=center>
        <div class="styleButtonHome">
                
                <a href="../Admin/NewsManager.aspx"><image src="../Admin/AdminSite/Template/images/News.png" width="65%"></image></a>
            </div>
        </td>
    </tr>

    <tr>
        <td colspan=3>
            <br />
        </td>
    </tr>

     <tr>       
        <td align=center>
        <div class="styleButtonHome">
                
                <a  href="../Admin/Producer.aspx"><image src="../Admin/AdminSite/Template/images/Company.png" width="65%"></image></a>
            </div>
        </td>
        <td align=center>
        <div class="styleButtonHome">
                
                <a  href="../Admin/DistributorManager.aspx"><image src="../Admin/AdminSite/Template/images/Company_1.png" width="65%"></image></a>
            </div>
        </td>
        <td align=center>
        <div class="styleButtonHome">
                
                <a  href="../Admin/WarrantyReceiptManager.aspx"><image src="../Admin/AdminSite/Template/images/Warranty.png" width="65%"></image></a>
            </div>
        </td>
    </tr>
</table>
</asp:Content>

