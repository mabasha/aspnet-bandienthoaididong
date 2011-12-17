<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="AccessoryDetail.aspx.cs" Inherits="Gui_Products_AccessoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../CSS/HomePage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">

  <div class="wrapper" style="width:800px;">
        <div class="border-top">
            <div class="border-top-left"></div>
            <div class="border-top-center"></div>
            <div class="border-top-right"></div>
        </div>
        <div class="border-left">
        <div class="border-right">
            <asp:FormView ID="fShow" runat="server" 
              onpageindexchanging="fShow_PageIndexChanging" Width="700px">
              <ItemTemplate>
                  <div style="padding: 10px; width=220px; float:left">
                      <asp:Image ID="Image1" runat="server" 
                          ImageUrl='<%# "~/Images/Accessory/"+Eval("Image") %>' Width="200px" />
                  </div>
                  <div style="float: left">
                      <asp:Label ID="lName" runat="server" Font-Bold="True" Font-Size="Larger" 
                          Text='<%# Eval("Name") %>'></asp:Label>
                      <br />
                      <br />
                      Nhà sản xuất :<asp:HyperLink ID="lProducerName" runat="server" 
                          Text='<%# Eval("ProducerName") %>'></asp:HyperLink>
                      <br />
                      Giá bán :&nbsp;
                      <asp:Label ID="lPrice" runat="server" ForeColor="Red" 
                          Text='<%# Eval("Price") %>'></asp:Label>
                      <br />
                      <br />
                      Mô tả :
                      <asp:Label ID="lDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                  </div>
              </ItemTemplate>
          </asp:FormView>
      </div>   <!-- border left end-->
       </div>   <!-- border right end -->
       
       <div class="border-bottom">
            <div class="border-bottom-left"></div>
            <div class="border-bottom-center"></div>
            <div class="border-bottom-right"></div>
       </div>
    </div>

</asp:Content>

