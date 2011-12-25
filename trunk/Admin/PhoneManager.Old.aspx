<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneManager.Old.aspx.cs" Inherits="Admin_PhoneManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
            font-weight: bold;
            color: #993366;
            background-color: #669999;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table border="2" class="style1">
            <tr>
                <td class="style2">
                    <h2>
                        Quản lý điện thoại</h2>
                </td>
            </tr>
            <tr>
                <td>
    <div align="center">
    
        <asp:GridView ID="grid_Phone" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_PhoneView" EnableModelValidation="True" 
            AllowPaging="True" AllowSorting="True" style="text-align: left" 
            Width="100%" onrowcommand="grid_Phone_RowCommand" 
            onrowdatabound="grid_Phone_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lb_ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình ảnh">
                    <ItemTemplate>
                        <asp:Image ID="img_Phone" runat="server" Height="100px" 
                            ImageUrl='<%# "~/Images/Phone/" + Eval("Image") + ".jpg" %>' Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giới thiệu chung">
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td align="left">
                                    <b>Tên điện thoại</b> <b>:</b>
                                    <asp:HyperLink ID="url_PhoneName" runat="server" ForeColor="Blue" 
                                        NavigateUrl='<%# "~/Gui/PhoneDetail.aspx?id=" + Eval("id") %>' 
                                        Text='<%# Eval("Name") %>'></asp:HyperLink>
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
                                        Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tính năng nổi bật">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/delete.png" 
                    DeleteText="Xóa" HeaderText="Xóa" ShowDeleteButton="True" />
                <asp:ButtonField ButtonType="Image" CommandName="Edit" 
                    ImageUrl="~/Images/Apps/edit.png" Text="Chỉnh sửa" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_PhoneView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
            SelectCommand="SELECT Phone.ID, Phone.Name, Phone.ProducerID, Phone.Image, Phone.Price, Phone.SpecialFeature, Phone.Camera, Phone.VideoCall, Phone.RecorderCamera, Phone.SubCamera, Phone.VideoPlayer, Phone.MusicPlayer, Phone.FM, Phone.TV, Phone.Recorder, Phone.CallingRecorder, Phone.FMRecorder, Phone.Java, Phone.Game, Phone.TVConnection, Phone.OfficeApps, Phone.Screen, Phone.Resolution, Phone.SizeScreen, Phone.Sensor, Phone.OS, Phone.Style, Phone.QwertyKeyboard, Phone.Size, Phone.Weight, Phone.Warranty, Phone.Language, Phone.Battery, Phone.CapabilityBattery, Phone.CallingTime, Phone.WaittingTime, cd.Name AS Expr1 FROM Phone INNER JOIN Producer AS cd ON Phone.ProducerID = cd.ID">
        </asp:SqlDataSource>
    
    </div>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
