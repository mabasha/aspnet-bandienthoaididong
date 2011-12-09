<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WarrantyReceiptManager.aspx.cs" Inherits="Admin_WarrantyReceiptManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="height: 52px">
    
        QUẢN LÝ PHIẾU BẢO HÀNH
    
    </div>
    <div style="height: 300px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
