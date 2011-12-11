<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="ResidualReport.aspx.cs" Inherits="Admin_ResidualReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<head>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <title>Báo cáo tồn</title>
</head>

       <table>
                <tr>
                    <td colspan=2 align=center><div class="style">BÁO CÁO TỒN </div></td>
                </tr
       </table>

       <table  width=100%>
                <BR />
                <tr>
                 <td  align=center>
                    Tên sản phẩm
            <asp:TextBox ID="tProductName" runat="server" CssClass="styleText" BorderStyle="None" 
                         Height="30px" Width="226px"></asp:TextBox>
            <asp:Button ID="bView" runat="server" onclick="bView_Click" Text="Xem" 
                         CssClass="styleButton" BorderStyle="None" Height="28px" Width="46px" /> </div>
                </td>
                </tr

                <tr>
                
                 <td >
                    <BR />
                    <b class="styleText"> Điện thoại   </b><br />
                <asp:GridView CssClass="styleGrid" ID="gShowPhone" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" >
                    <RowStyle BackColor="#EFF3FB" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" 
                            SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" 
                            SortExpression="ResidualAmount" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                </td>
                </tr>

                <tr>
                 <td >
                                     <BR />
                    <b class="styleText"> Phụ kiện  <br />
                <asp:GridView CssClass="styleGrid" ID="gShowAccessory" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#EFF3FB" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" 
                            SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" 
                            SortExpression="ResidualAmount" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                </td>
                </tr>

        </table>

</asp:Content>