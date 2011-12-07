<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="ResidualReport.aspx.cs" Inherits="Admin_ResidualReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title>Báo cáo tồn</title>
</head>

    <div class="wrapper">
        <div class="header">Báo cáo tồn</div>
        <div class="list">Tên sản phẩm
            <asp:TextBox ID="tProductName" runat="server"></asp:TextBox>
            <asp:Button ID="bView" runat="server" onclick="bView_Click" 
                style="height: 26px" Text="Xem" />
            <div style="margin-top: 20px;">
                <b>Điện thoại</b><br />
                <asp:GridView ID="gShowPhone" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" >
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" 
                            SortExpression="ResidualAmount" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <div style="margin-top: 20px;">
                <b>Phụ kiện<br />
                <asp:GridView ID="gShowAccessory" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" 
                            SortExpression="ResidualAmount" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                </b>
            </div>
        </div>
    </div>


</asp:Content>