<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportBill.aspx.cs" Inherits="Admin_ImportBill" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<head> <%--runat="server">--%>
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../Scripts/Utils.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(OnPageReady);
        function OnPageReady() {
            $("#<% =btnAddViewstate.ClientID%>").click(AddViewstate);
            $("#<% =txtNumber.ClientID%>").keydown(OnKeyDownCheckNumber);
            $("#<% =txtPrice.ClientID%>").keydown(OnKeyDownCheckNumber);
        }
        function AddViewstate() {
            if ($('#<% =txtTenSp.ClientID%>').val() == "" || $('#<% =txtNumber.ClientID%>').val() == "" || $('#<% =txtPrice.ClientID%>').val() == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return false;
            }
        }
    </script>
    <style type="text/css">
        .style25
        {
            width: 100%;
            height: 181px;
            margin-left: 0px;
        }
        .style26
        {
            width: 241px;
        }
        .style30
        {
            width: 636px;
        }
        .style32
        {
            width: 616px;
        }
        .style35
        {
            height: 35px;
        }
        .style36
        {
            height: 52px;
        }
        .style39
        {
            width: 616px;
            height: 13px;
        }
        .style40
        {
            width: 581px;
            }
        .style41
        {
            width: 242px;
        }
        .style42
        {
            width: 376px;
            height: 50px;
        }
        .style43
        {
            width: 119px;
            height: 50px;
        }
        .style44
        {
            width: 242px;
            height: 13px;
        }
        .style45
        {
            width: 616px;
            height: 23px;
        }
        .style46
        {
            width: 242px;
            height: 23px;
        }
        .style47
        {
            width: 616px;
            height: 21px;
        }
        .style48
        {
            width: 242px;
            height: 21px;
        }
        .style49
        {
            width: 616px;
            height: 50px;
        }
        </style>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%--<form id="form1" runat="server">--%>
     <table width=100%>
            <tr>
                <td align=center>
                    <div class="style">LẬP HÓA ĐƠN NHẬP</div>      
                </td>
            </tr>
        </table>
         <br />
    <div class="Add" style="height: 335px; width: 1011px;">
        <table style="width:92%; height: 296px; margin-left: 0px;" align="center">
            <tr>
                <td class="style39">
                    Người Nhập :</td>
                <td class="style41" colspan="2">
                    <asp:DropDownList ID="dNguoiNhap" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="FullName" DataValueField="Username" CssClass="styleText" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [FullName], [Username] FROM [Users]"></asp:SqlDataSource>
                </td>
                <td class="style40" rowspan="8">
    
    <asp:GridView CssClass="styleGrid" ID="gridViewState" runat="server" AutoGenerateColumns="False" 
                    onrowdeleting="gridViewState_RowDeleting" Width="533px" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="Mã sản Phẩm" />
            <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
            <asp:BoundField DataField="IsPhone" HeaderText="Là điện thoại" />
            <asp:BoundField DataField="Number" HeaderText="Số lượng" />
            <asp:BoundField DataField="Price" HeaderText="Giá" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" class="style35">
                </td>
            </tr>
            <tr>
                <td class="style45">
                    Loại sản phẩm *:</td>
                <td class="style46" colspan="2">
                    <asp:RadioButton ID="rDienthoai" runat="server" AutoPostBack="True" 
                        Checked="True" GroupName="chooser" Text="Điện thoại" />
                    <asp:RadioButton ID="rPhukien" runat="server" AutoPostBack="True" 
                        GroupName="chooser" Text="Phụ kiện" />
                </td>
            </tr>
            <tr>
                <td class="style49">
                    Mã sản phẩm *:</td>
                <td class="style43">
                    <asp:TextBox ID="txtTenSp" runat="server" Width="52px" CssClass="styleText" ></asp:TextBox>
                </td>
                <td class="style42">
                    <asp:Button ID="btnTenSp" runat="server" Text="Chọn sản phẩm"   CssClass="styleButton"/>
                </td>
            </tr>
            <tr>
                <td class="style47">
                    Số lượng *:</td>
                <td class="style48" colspan="2">
                    <asp:TextBox ID="txtNumber" runat="server" Width="190px"  CssClass="styleText" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style32">
                    Đơn giá nhập* :</td>
                <td class="style41" colspan="2">
                    <asp:TextBox ID="txtPrice" runat="server" Width="190px"  CssClass="styleText" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" class="style36">
    
    <asp:Button ID="btnAddViewstate" runat="server" onclick="btnAddViewstate_Click" 
        Text="Thêm sản phẩm"  CssClass="styleButton" />
            
                    <asp:Button ID="btnCapnhat" runat="server" onclick="btnCapnhat_Click" 
                        Text="Cập nhật" Visible="False" />
                    <asp:Button ID="btnHuy" runat="server" onclick="btnHuy_Click" Text="Hủy" 
                        Visible="False" />
            
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
    
    <asp:Button ID="btnThemHD" runat="server"  Text="THÊM HÓA ĐƠN" Height="66px" 
            onclick="btnThemHD_Click" Width="135px" Visible="False"  CssClass="styleButton" 
                        BorderStyle="Dotted"/>
    
                </td>
            </tr>
        </table>
    </div>
    <div style=" width: 1127px; margin-bottom: 0px;" class="list">
      
            <table width=100%>
                <tr>
                    <td>
                        <asp:Label ID="lbThongbaoHD" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbThongbaoCTHD" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <asp:GridView ID="gridImportBill" runat="server" AutoGenerateColumns="False" 
                            CellPadding="3"                                      
                            onrowdatabound="gridImportBill_RowDataBound"                                     
                            onrowdeleting="gridImportBill_RowDeleting" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="410px" 
                            AllowPaging="True" AllowSorting="True" 
                            onpageindexchanging="gridImportBill_PageIndexChanging" 
                            onselectedindexchanged="gridImportBill_SelectedIndexChanged" 
                            onsorting="gridImportBill_Sorting">
                            <RowStyle ForeColor="#000066" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="ID" />
                                <asp:BoundField DataField="Username" HeaderText="Người nhập" 
                                    SortExpression="Username" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="Ngày nhập" 
                                    DataFormatString="{0:dd/MM/yyyy}" SortExpression="CreatedDate" />
                                <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                                    ShowSelectButton="True" />
                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                                    ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                    <td class="style30" valign="top">
            <asp:GridView ID="gridImportBillDt" runat="server" AutoGenerateColumns="False" 
                CellPadding="3"                                     
                            onrowdatabound="gridImportBillDt_RowDataBound1" 
                            onrowdeleting="gridImportBillDt_RowDeleting"                                    
                            onrowcommand="gridImportBillDt_RowCommand" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            onselectedindexchanged="gridImportBillDt_SelectedIndexChanged" 
                            AllowPaging="True" AllowSorting="True" 
                            onpageindexchanging="gridImportBillDt_PageIndexChanging" 
                            onsorting="gridImportBillDt_Sorting"  >
                <RowStyle ForeColor="#000066" />
                <Columns>
                    <asp:BoundField DataField="ImportBillID" HeaderText="Mã HĐ" ReadOnly="True" 
                        SortExpression="ImportBillID" />
                    <asp:BoundField DataField="ID" HeaderText="Mã CTHĐ" ReadOnly="True" 
                        SortExpression="ID" />
                    <asp:TemplateField HeaderText="Mã Sp" SortExpression="ProductID">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMaSpTemp" runat="server" style="margin-left: 2px" 
                                Width="50px"></asp:TextBox>
                            <asp:Button ID="btnChonDtTemp" runat="server"
                                Text="Chọn ĐT" CommandName="btnDt" />
                            <asp:Button ID="btnChonPkTemp" runat="server" Text="Chọn PK" 
                                CommandName="btnPk"  />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbProductID" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loại sản phẩm">
                        <EditItemTemplate>
                            <asp:RadioButton ID="rDtTemp" runat="server" Checked="True" 
                                GroupName="rtemplate" Text="Điện thoại" Enabled="False" />
                            <asp:RadioButton ID="rPkTemp" runat="server" GroupName="rtemplate" 
                                Text="Phụ kiện" Enabled="False" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbIsPhone" runat="server" Text='<%# Eval("IsPhone").ToString()=="True" ?"Điện thoại":"Phụ kiện" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="ProductID" HeaderText="Mã sản phẩm" />--%>
                    <%--<asp:BoundField DataField="IsPhone" HeaderText="Là điện thoại" />--%>
                    <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                        SortExpression="Number" />
                    <asp:BoundField DataField="Price" HeaderText="Đơn giá nhập" 
                        SortExpression="Price" DataFormatString="{0:#,##0}" />
                    <asp:CommandField ButtonType="Image" 
                        SelectImageUrl="~/Images/Apps/edit-icon.jpg" ShowSelectButton="True" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                        ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                    </td>
                </tr>
            </table>                    
      
    </div>
</asp:Content>
<%--</form>
</body>
</html>--%>
