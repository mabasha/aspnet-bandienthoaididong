<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="CartHistory.aspx.cs" Inherits="Gui_Order_CartHistory" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Lịch sử mua bán</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
<div class="wrapper-history" style="width:800px;">
    <div class="search">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        Từ khóa
        <asp:TextBox ID="tKeyword" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Từ ngày
        <asp:TextBox ID="tFrom" runat="server" Width="83px"></asp:TextBox>
        <asp:CalendarExtender ID="tFrom_CalendarExtender" runat="server" 
            TargetControlID="tFrom">
        </asp:CalendarExtender>
&nbsp;đến ngày
        <asp:TextBox ID="tTo" runat="server" Width="75px"></asp:TextBox>
        <asp:CalendarExtender ID="tTo_CalendarExtender" runat="server" 
            TargetControlID="tTo">
        </asp:CalendarExtender>
&nbsp;&nbsp;&nbsp;&nbsp; Trạng thái
        <asp:DropDownList ID="dStatus" runat="server" Width="87px">
            <asp:ListItem>Tất cả</asp:ListItem>
            <asp:ListItem>Đang chờ</asp:ListItem>
            <asp:ListItem>Đã đặt hàng</asp:ListItem>
            <asp:ListItem>Đã nhận</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="bSearch" runat="server" 
            ImageUrl="~/Images/Apps/Front/b-search.png" onclick="bSearch_Click" />
    </div>
    <div class="list">
        <asp:GridView ID="gShowPhone" runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" GridLines="Vertical" AllowPaging="True" 
            AllowSorting="True" onpageindexchanging="gShowPhone_PageIndexChanging" 
            onsorting="gShowPhone_Sorting">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Tên điện thoại" 
                    SortExpression="ProductName" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:BoundField DataField="Price" DataFormatString="{0:#,### đ}" HeaderText="Giá" 
                    SortExpression="Price" />
                <asp:TemplateField HeaderText="Trạng thái" SortExpression="Status">
                    <ItemTemplate>
                        <asp:Label ID="lStatus" runat="server" 
                            Text='<%# Eval("Status").Equals(0) ?"Đang chờ":(Eval("Status").Equals(1) ?"Đã đặt hàng":"Đã nhận") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CreatedDate" HeaderText="Ngày đặt hàng" 
                    SortExpression="CreatedDate" DataFormatString="{0:d}" />
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
        <asp:GridView ID="gShowAcc" runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" GridLines="Vertical" AllowPaging="True" 
            AllowSorting="True" onpageindexchanging="gShowAcc_PageIndexChanging" 
            onsorting="gShowAcc_Sorting">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Tên phụ kiện" 
                    SortExpression="ProductName" />
                <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                    SortExpression="ProducerName" />
                <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                    SortExpression="Number" />
                <asp:BoundField DataField="Price" DataFormatString="{0:#,### đ}" HeaderText="Giá" 
                    SortExpression="Price" />
                <asp:TemplateField HeaderText="Trạng thái" SortExpression="Status">
                    <ItemTemplate>
                        <asp:Label ID="lStatus" runat="server" 
                            Text='<%# Eval("Status").Equals(0) ?"Đang chờ":(Eval("Status").Equals(1) ?"Đã đặt hàng":"Đã nhận") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CreatedDate" HeaderText="Ngày đặt hàng" 
                    SortExpression="CreatedDate" DataFormatString="{0:d}" />
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
    </div>
</div>
</asp:Content>

