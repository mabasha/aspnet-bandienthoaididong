<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OrderManager.aspx.cs" Inherits="Admin_OrderManager" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Quản lý đơn đặt hàng trực tuyến</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <div class="order-title">
        Quản lý đơn đặt hàng</div>
    <div class="step-first">
        Chọn đơn đặt hàng cần xử lý:
        <div class="choose">
            <asp:Label ID="lInfo" runat="server" Text=""></asp:Label>
            <div class="order-search">
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
            <asp:GridView ID="gShowPhone" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
                AllowSorting="True" onpageindexchanging="gShowPhone_PageIndexChanging" 
                onsorting="gShowPhone_Sorting" onrowcommand="gShowPhone_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="bAction" runat="server" CommandName="bAction"
                                Text='<%# Eval("Status").Equals(0) ?"Lập hóa đơn":(Eval("Status").Equals(1) ?"Xác nhận đã nhận":"3") %>' 
                                Visible='<%# Eval("Status").Equals(2)?false:true %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username KH" 
                        SortExpression="Username" />
                    <asp:BoundField DataField="Fullname" HeaderText="Tên khách hàng" 
                        SortExpression="Fullname" />
                    <asp:BoundField DataField="ProductID" HeaderText="Mã SP" 
                        SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Tên điện thoại" 
                        SortExpression="ProductName" />
                    <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                        SortExpression="ProducerName" />
                    <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                        SortExpression="Number" />
                    <asp:BoundField DataField="Price" DataFormatString="{0:#,###}" HeaderText="Giá" 
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
            </asp:GridView>
            <asp:GridView ID="gShowAcc" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
                AllowSorting="True" onpageindexchanging="gShowAcc_PageIndexChanging" 
                onsorting="gShowAcc_Sorting" onrowcommand="gShowAcc_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="bAction" runat="server" CommandName="bAction" 
                                Text='<%# Eval("Status").Equals(0) ?"Lập hóa đơn":(Eval("Status").Equals(1) ?"Xác nhận đã nhận":"") %>' 
                                Visible='<%# Eval("Status").Equals(2)?false:true %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username KH" 
                        SortExpression="Username" />
                    <asp:BoundField DataField="Fullname" HeaderText="Tên khách hàng" 
                        SortExpression="Fullname" />
                    <asp:BoundField DataField="ProductID" HeaderText="Mã SP" 
                        SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Tên phụ kiện" 
                        SortExpression="ProductName" />
                    <asp:BoundField DataField="ProducerName" HeaderText="NSX" 
                        SortExpression="ProducerName" />
                    <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                        SortExpression="Number" />
                    <asp:BoundField DataField="Price" DataFormatString="{0:#,###}" HeaderText="Giá" 
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
            </asp:GridView>
        </div>
    </div>
</asp:Content>

