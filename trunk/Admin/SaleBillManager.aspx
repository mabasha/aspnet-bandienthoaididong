<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleBillManager.aspx.cs" Inherits="Admin_SaleBillManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="../Scripts/Utils.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(OnPageReady);
        function OnPageReady() {
            $("#bAddBillDt").click(OnAddBillDetail);
            $("#bAdd").click(OnAddBill);
            $("#tIMEI").keydown(OnKeyDownCheckNumber);
            $("#tNumber").keydown(OnKeyDownCheckNumber);
            $("#tProductID").keydown(OnKeyDownCheckNumber);
        }

        function OnAddBillDetail() {
            var ok = true;
            if ($('#tProductID').val() == "" || $('#tNumber').val() == "") {
                ok = false;
            }
            if ($("#rPhone").attr("checked") == "checked") {
                if ($('tIMEI').val() == '')
                    ok = false;
            }

            if (ok == false) {
                alert('Thiếu thông tin chi tiết hóa đơn');
                return false;
            }
        }

        function OnAddBill() {
            if ($("#rRegisted").attr("checked") == "checked")
            {
                if($('#tCustomerName').val() == "")
                {
                    alert('Thiếu thông tin hóa đơn');
                    return false;
                }
            }
            else if($("#rUnregisted").attr("checked") == "checked")
            {
                if($('#tCustomerName').val() == "" || $('#tAddress').val() == "" ||$('#tPhone').val() == "")
                {
                    alert('Thiếu thông tin hóa đơn');
                    return false;
                }
            }
        }
    </script>
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class=wrapper>
        <div class=header>Quản lý hóa đơn bán</div>
        <div class=add>
            <b>Thông tin hóa đơn</b><br />
            <table class="style1" style="border-style: solid; border-width: 1px">
                <tr>
                    <td class="left-add">
                        Người bán</td>
                    <td>
                        <asp:DropDownList ID="dSaler" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:RadioButton ID="rRegisted" runat="server" Checked="True" 
                            GroupName="CustomType" Text="Đã đăng ký" AutoPostBack="True" 
                            oncheckedchanged="rRegisted_CheckedChanged" />
                        <asp:RadioButton ID="rUnregisted" runat="server" GroupName="CustomType" 
                            Text="Chưa đăng ký" AutoPostBack="True" 
                            oncheckedchanged="rUnregisted_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tên khách hàng</td>
                    <td>
                        <asp:TextBox ID="tCustomerName" runat="server"></asp:TextBox>
                        <asp:Button ID="bChooseCustomer" runat="server" Text="Chọn khách hàng" />
                        <asp:Button ID="bShowCustomerInfo" runat="server" 
                            onclick="bShowCustomerInfo_Click" Text="Hiện thông tin khác" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="tAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Điện thoại</td>
                    <td>
                        <asp:TextBox ID="tPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                </table>
            <br />
            <br />
            <b>Chi tiết hóa đơn<br />
            </b>
            <asp:Label ID="lInfoDt" runat="server" Text="Label"></asp:Label>
            <br />
            <table class="style2" width="50%" 
                style="border-style: solid; border-width: 1px">
                <tr>
                    <td width="50%" class="left-add">
                        Loại hàng</td>
                    <td>
                        <asp:RadioButton ID="rPhone" runat="server" Text="Điện thoại" Checked="True" 
                            GroupName="ProductType" AutoPostBack="True" 
                            oncheckedchanged="rPhone_CheckedChanged" />
&nbsp;<asp:RadioButton ID="rAccessory" runat="server" Text="Phụ kiện" GroupName="ProductType" 
                            AutoPostBack="True" oncheckedchanged="rAccessory_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="bChooseProduct" runat="server" CssClass="margin-left" 
                            Text="Chọn mặt hàng" />
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Mã mặt hàng</td>
                    <td>
                        <asp:TextBox ID="tProductID" runat="server"></asp:TextBox>
                        <asp:Button ID="bShowName" runat="server" onclick="bShowName_Click" 
                            Text="Lấy thông tin sản phẩm" />
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Tên mặt hàng</td>
                    <td>
                        <asp:Label ID="lProductName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Đơn giá</td>
                    <td>
                        <asp:Label ID="lPrice" runat="server"></asp:Label>
&nbsp;đ</td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Số IMEI</td>
                    <td>
                        <asp:TextBox ID="tIMEI" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        Số lượng</td>
                    <td>
                        <asp:TextBox ID="tNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" class="left-add">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="bAddBillDt" runat="server" CssClass="margin" 
                            Text="Thêm mặt hàng" onclick="bAddBillDt_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gAddDetail" runat="server" AutoGenerateColumns="False" 
                CellPadding="3" 
                onrowdeleting="gAddDetail_RowDeleting" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <RowStyle ForeColor="#000066" />
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Mã sản phẩm" />
                    <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="ProductIMEI" HeaderText="Số IMEI" />
                    <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                    <asp:BoundField DataField="Price" HeaderText="Đơn giá" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                        ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:Button ID="bAdd" runat="server" Text="Thêm hóa đơn" onclick="bAdd_Click" />
            <div class=clearboth></div>
        </div>
        
        <div class=list>
            <div id="div-bill">
                <asp:GridView ID="gShowBill" runat="server" AutoGenerateColumns="False" 
                    CellPadding="3" AllowPaging="True" AllowSorting="True" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    onpageindexchanging="gShowBill_PageIndexChanging" 
                    onrowcancelingedit="gShowBill_RowCancelingEdit" 
                    onrowdatabound="gShowBill_RowDataBound" onrowdeleting="gShowBill_RowDeleting" 
                    onrowediting="gShowBill_RowEditing" onrowupdating="gShowBill_RowUpdating" 
                    onselectedindexchanged="gShowBill_SelectedIndexChanged" 
                    onsorting="gShowBill_Sorting" SelectedIndex="0">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="SalerUsername" HeaderText="Người bán" 
                            ReadOnly="True" SortExpression="SalerUsername" />
                        <asp:TemplateField HeaderText="Username khách hàng" 
                            SortExpression="CustomUsername">
                            <ItemTemplate>
                                <asp:Label ID="lCustomUsername" runat="server" 
                                    Text='<%# Eval("CustomUsername") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tCustomUsernameTmp" runat="server" 
                                    Text='<%# Eval("CustomUsername") %>'></asp:TextBox>
                                <asp:Button ID="bChooseCustomUsername" runat="server" Text="Chọn" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CustomName" HeaderText="Tên khách hàng" 
                            SortExpression="CustomName" />
                        <asp:BoundField DataField="Address" HeaderText="Địa chỉ" 
                            SortExpression="Address" />
                        <asp:BoundField DataField="Tel" HeaderText="Điện thoại" SortExpression="Tel" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Ngày tạo" 
                            SortExpression="CreatedDate" ReadOnly="True" />
                        <asp:CommandField ButtonType="Button" SelectText="Chọn" 
                            ShowSelectButton="True" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                            ShowDeleteButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                            UpdateText="Cập nhật" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <div id="div-bill-dt" style="margin-top:20px;">
                <asp:GridView ID="gShowBillDt" runat="server" CellPadding="3" 
                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    onpageindexchanging="gShowBillDt_PageIndexChanging" 
                    onrowcancelingedit="gShowBillDt_RowCancelingEdit" 
                    onrowdatabound="gShowBillDt_RowDataBound" 
                    onrowdeleting="gShowBillDt_RowDeleting" onrowediting="gShowBillDt_RowEditing" 
                    onrowupdating="gShowBillDt_RowUpdating" 
                    onselectedindexchanged="gShowBillDt_SelectedIndexChanged" 
                    onsorting="gShowBillDt_Sorting">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="SaleBillID" HeaderText="Mã hóa đơn" ReadOnly="True" 
                            SortExpression="SaleBillID" />
                        <asp:TemplateField HeaderText="Mã sản phẩm" SortExpression="ProductID">
                            <ItemTemplate>
                                <asp:Label ID="lProductIDTmp" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tProductIDTmp" runat="server" Text='<%# Eval("ProductID") %>'></asp:TextBox>
                                <asp:Button ID="bChoosePhoneIDTmp" runat="server" Text="Chọn ĐT" />
                                <asp:Button ID="bChooseAccessoryIDTmp" runat="server" Text="Chọn PK" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductIMEI" HeaderText="Số IMEI" 
                            SortExpression="ProductIMEI" />
                        <asp:TemplateField HeaderText="Là điện thoại ?" SortExpression="IsPhone">
                            <ItemTemplate>
                                <asp:Label ID="lIsPhoneTmp" runat="server" Text='<%# Eval("IsPhone") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RadioButton ID="rPhoneTmp" runat="server" Checked='<%# (bool)Eval("IsPhone") %>' 
                                    GroupName="IsPhone" Text="Điện thoại" />
                                <asp:RadioButton ID="rAccessory" runat="server" 
                                    Checked='<%# (bool)Eval("IsPhone") == true ? false:true %>' GroupName="IsPhone" 
                                    Text="Phụ kiện" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Number" HeaderText="Số lượng" 
                            SortExpression="Number" />
                        <asp:BoundField DataField="Price" HeaderText="Đơn giá" SortExpression="Price" 
                            ReadOnly="True" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.jpg" 
                            ShowDeleteButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" 
                            UpdateText="Cập nhật" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
            <div class=clearboth></div>
        </div>
    </div>
    </form>
</body>
</html>
