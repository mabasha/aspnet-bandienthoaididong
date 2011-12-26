<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleBillPrint.aspx.cs" Inherits="Admin_SaleBillPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Xuất hóa đơn bán</title>
    <style type="text/css">
        .style1
        {
            width: 99%;
            height: 71px;
            
        }
        .style5
        {
            width: 624px;
        }
        .style6
        {
            width: 187px;
        }
        .bill-wrapper
        {
        	border:solid 1px;
        	width:17cm;
        	margin:2cm;
        	padding:1cm;
        }
        .style7
        {
            width: 176px;
            font-style: italic;
        }
        .title
        {
        	text-align:center;
        }
                
        .common
        {
        	border:dotted 1px;
        	padding:3px;
        	margin-top:50px;
        }
        
        .list
        {
        	border:dotted 1px;
        	padding:3px;
        	margin-top:50px;
        }
        
        .company-info
        {
        	font-size:12px;
        	float:left;
        }
        
        .footer
        {
        	margin-top:30px;
        }
        .footer-left
        {
        	float:left;
        	text-align:center;
        }
        .footer-right
        {
        	float:right;
        	text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class = "bill-wrapper">
    <div class="company-info">Công ty TNHH mua bán điện thoại T2H3</br>
           Đường Cách mạng tháng tám, Phường 5, Quận 10, TP.HCM</br>
           Điện thoại : 08.52016800</div>
    <div class="title">
    CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
                Độc Lập - Tự Do - Hạnh Phúc<br />
                --------oOo--------<br />
                <b>
        <br />
        HÓA ĐƠN BÁN HÀNG</b></div>
    
    <div class="common"><table class="style1">
        <tr>
            <td class="style7">
                Người nhập:</td>
            <td>
                <asp:Label ID="lSaler" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Ngày nhập :</td>
            <td>
                <asp:Label ID="lbCreatedDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Khách hàng:</td>
            <td>
                <asp:Label ID="lCustomerName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Địa chỉ</td>
            <td>
                <asp:Label ID="lAddress" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Số điện thoại</td>
            <td>
                <asp:Label ID="lTel" runat="server"></asp:Label>
            </td>
        </tr>
        </table></div>

    <div class="list">
    <table class="style5">
        <tr>
            <td class="style6">
                <br />
                <asp:Label ID="lPhone" runat="server" Text="Danh sách điện thoại&lt;/br&gt;"></asp:Label>
                <center style="width: 631px"><asp:GridView ID="gridPhone" runat="server" 
                        AutoGenerateColumns="False" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" />
                        <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                        <asp:BoundField DataField="Price" HeaderText="Đơn giá nhập" 
                            DataFormatString="{0:0,##0 VND}" />
                    </Columns>
                </asp:GridView></center>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <br />
                <asp:Label ID="lAcc" runat="server" Text="Danh sách phụ kiện&lt;/br&gt;"></asp:Label>
                <center style="width: 630px"><asp:GridView ID="gridAccessory" runat="server" 
                        AutoGenerateColumns="False" Width="400px">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Tên phụ kiện" />
                        <asp:BoundField DataField="Number" HeaderText="Số lượng" />
                        <asp:BoundField DataField="Price" HeaderText="Đơn giá nhập" 
                            DataFormatString="{0:0,##0 VND}" />
                    </Columns>
                </asp:GridView></center>
            </td>
        </tr>
    </table>
        <br />Tổng tiền :&nbsp;
        <asp:Label ID="lSum" runat="server" Font-Bold="True"></asp:Label>
    </div>
    <div class="footer">
        <div class="footer-left"><b>Chữ ký khách hàng</b><br />
        (Chữ ký, họ tên)</div>
        <div class="footer-right">
            TP.HCM,
            <asp:Label ID="lDayFooter" runat="server"></asp:Label><br />
            <b>Người thu tiền</b><br />
            (Chữ ký, họ tên)</div>
    </div>
    <div style="clear:both"></div>
    </div>
    </form>
</body>
</html>
