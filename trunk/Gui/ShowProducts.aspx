<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowProducts.aspx.cs" Inherits="Gui_ShowProducts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grid_Phone" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_PhoneView" EnableModelValidation="True">
            <Columns>
                <asp:ImageField DataImageUrlField="Image" 
                    DataImageUrlFormatString="~/Images/Phone/{0}.jpg" HeaderText="Hình ảnh">
                </asp:ImageField>
                <asp:TemplateField HeaderText="Giới thiệu chung">
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td align="left">
                                    <b>Tên điện thoại</b> <b>:</b>
                                    <asp:LinkButton ID="lbtn_PhoneName" runat="server" 
                                        CommandArgument='<%# Eval("ID") %>' Text='<%# Eval("Name") %>'></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <b>Hãng sản xuất</b> <b>:</b>
                                    <asp:Label ID="lb_Producer" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <b>Giá :</b>
                                    <asp:Label ID="lb_Price" runat="server" 
                                        Text='<%# Eval("Price", "{0:#,##0} VND") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_PhoneView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
            SelectCommand="SELECT Phone.ID, Phone.Name, Phone.ProducerID, Phone.Image, Phone.Price, Phone.SpecialFeature, Phone.Camera, Phone.VideoCall, Phone.RecorderCamera, Phone.SubCamera, Phone.VideoPlayer, Phone.MusicPlayer, Phone.FM, Phone.TV, Phone.Recorder, Phone.CallingRecorder, Phone.FMRecorder, Phone.Java, Phone.Game, Phone.TVConnection, Phone.OfficeApps, Phone.Screen, Phone.Resolution, Phone.SizeScreen, Phone.Sensor, Phone.OS, Phone.Style, Phone.QwertyKeyboard, Phone.Size, Phone.Weight, Phone.Warranty, Phone.Language, Phone.Battery, Phone.CapabilityBattery, Phone.CallingTime, Phone.WattingTime, cd.Name AS Expr1 FROM Phone INNER JOIN Producer AS cd ON Phone.ProducerID = cd.ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Phone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
            SelectCommand="SELECT * FROM [Phone]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
