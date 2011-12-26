<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="Gui_Order_ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Giỏ hàng của bạn</title>
     <link href="../../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .show
        {
        	margin-top:10px;
        	margin-bottom:10px;
        	
        }
        
           .styleViewCart
    {        
    	margin-top:15px;
        width: 70%;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        box-shadow: 0px 0px 0px 0px #818181;
        -webkit-box-shadow: 0px 0px 1px 1px #818181;
        -moz-box-shadow: 1px 1px 1px 1px #818181;
        background: -moz-linear-gradient(bottom, #E1E1E1, #ffffff);
        background: -webkit-gradient(linear, center bottom, center top, from(#E1E1E1), to(#ffffff));

    }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
<table class="styleViewCart">
    <tr>
    <td>
<div id="view-card-wrapper" style=" width:780px ;margin-top:15px">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Gui/Order/CartHistory.aspx">Xem lịch sử đặt hàng</asp:HyperLink>
        </td>
     </tr>

    
            <tr>
                <td>
        <!-- hien thi dien thoai -->
        <asp:FormView ID="fBuyConfirmAcc" runat="server" 
            onitemcommand="fBuyConfirm_ItemCommand" >
            <ItemTemplate>
            <div class="wrapper-confirm" style="width:750px; margin-top:10px;">
                <div id="image" 
                    style="border: 2px solid #C0C0C0; padding: 5px; width:140px; float:left">
                    <asp:Image ID="img" runat="server" Height="134px" 
                        ImageUrl='<%# "~/Images/Accessory/"+Eval("Image") %>' Width="128px" />
                </div>
                <div id="info" style="padding: 5px; float:left; width:400px;">
                    <asp:Label ID="lName" runat="server" Font-Bold="True" 
                        Text='<%# Eval("Name") %>'></asp:Label>
                    <br />
                    Nhà sản xuất :
                    <asp:Label ID="lProductName" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lDescription" runat="server" Font-Italic="True" 
                        Text='<%# Eval("Description") %>'></asp:Label>
                    <br />
                </div>
                <div id="buy" style="padding: 5px; width:150px; float:right;">
                    <center>Giá :
                    <asp:Label ID="lPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text='<%# Eval("Price","{0:#,##0}") %>'> đ</asp:Label>
                        <br />
                        <br />
                        <b>Số lượng</b>
                        <asp:TextBox ID="tNum" runat="server" Width="35px">1</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="bAdd" runat="server"  Text="Thêm vào giỏ hàng" CssClass="styleButton" BorderStyle="None"
                            Width="130px" CommandName="bAdd" />
                        </center>
                </div>
                <div style="clear:both"></div>
            </div>
                
            </ItemTemplate>
        </asp:FormView>
        </td>
        </tr>
<!------------------------------------------------------------->

<!------------------------- hien thi phu kien ---------------------------->
        <tr>
        <td>
        <asp:FormView ID="fBuyConfirmPhone" runat="server" 
            onitemcommand="fBuyConfirmPhone_ItemCommand">
        <ItemTemplate>
            <div class="wrapper-confirm" style="width:750px; margin-top:10px;">
                <div id="image" 
                    style="border: 2px solid #C0C0C0; padding: 5px; width:140px; float:left">
                    <asp:Image ID="img" runat="server" Height="134px" 
                        ImageUrl='<%# "~/Images/Phone/"+Eval("Image") %>' Width="128px" />
                </div>
                <div id="info" style="padding: 5px; float:left; width:400px;">
                    <asp:Label ID="lName" runat="server" Font-Bold="True" 
                        Text='<%# Eval("Name") %>'></asp:Label>
                    <br />
                    Nhà sản xuất :
                    <asp:Label ID="lProductName" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lSpecialFeature" runat="server" Font-Italic="True" 
                        Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                    <br />
                </div>
                <div id="buy" style="padding: 5px; width:150px; float:right;">
                    <center>Giá :
                    <asp:Label ID="lPrice" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text='<%# Eval("Price","{0:#,##0}") %>'> đ</asp:Label>
                        <br />
                        <br />
                        <b>Số lượng</b>
                        <asp:TextBox ID="tNum" runat="server" Height="27px" Width="35px">1</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="bAdd" runat="server" Height="26px" Text="Thêm vào giỏ hàng" CssClass="styleButton" BorderStyle="None"
                            Width="130px" CommandName="bAdd" />
                        </center>
                </div>
                <div style="clear:both"></div>
            </div>
                
            </ItemTemplate>
        </asp:FormView>
         <asp:Label ID="lInfo" runat="server" Text=""></asp:Label>
    <br />
        </td>
        </tr>

<!--------------------------------------------------->

   
          
<!--------------- data dien thoai-------------------->
        <tr>
        <td>
        <asp:GridView  CssClass="styleGrid" ID="gPhone" runat="server" AutoGenerateColumns="False" 
            AllowSorting="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" 
            onrowdatabound="gPhone_RowDataBound" onrowdeleting="gPhone_RowDeleting" 
            onsorting="gPhone_Sorting">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã sản phẩm" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" 
                    SortExpression="Name" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        </td>
        </tr>
<!-------------------------------------------------------------------------------------------------->


<!------------------------------------data phu kien----------------------------------------->
        <tr>
        <td>
     
        <asp:GridView CssClass="styleGrid" ID="gAcc" runat="server" AutoGenerateColumns="False" 
            AllowSorting="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" 
            onrowdatabound="gAcc_RowDataBound" onrowdeleting="gAcc_RowDeleting" 
            onsorting="gAcc_Sorting">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã sản phẩm" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" 
                    SortExpression="Name" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                    ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
        </td>
        </tr>
        <!-------------------------------------------------------------------------------------------------->

        <tr>
        <td>
             Tổng giá trị giỏ hàng :
 <asp:Label ID="lSumPrice" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
&nbsp;đ<br />
<br />
        </td>
        </tr>
        <tr>
        <td>
    <asp:Button ID="bOrder" runat="server" Text="Đặt hàng" onclick="bOrder_Click" 
                CssClass="styleButton" BorderStyle="None" /> 

    <asp:Button ID="bDeleteAll" runat="server" onclick="bDeleteAll_Click" CssClass="styleButton"
        Text="Xóa hết" BorderStyle="None" />
        </td>
        </tr>
        </table>
   

</div>


</asp:Content>

