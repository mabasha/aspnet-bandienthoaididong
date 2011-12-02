<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneManager.aspx.cs" Inherits="Admin_PhoneManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
            font-size: x-large;
            font-weight: bold;
        }
        .style3
        {
            width: 297px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2" colspan="2" 
                    style="color: #3333CC; background-color: #CCCC00" width="300px">
                    QUẢN LÝ ĐIỆN THOẠI</td>
            </tr>
            <tr>
                <td class="style3" valign="top" width="300px">
                    <asp:GridView ID="grid_Phone" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" 
                        ForeColor="#333333" GridLines="None" PageSize="20" DataKeyNames="ID" 
                        onpageindexchanging="grid_Phone_PageIndexChanging" 
                        onrowcommand="grid_Phone_RowCommand" Width="100%" AllowSorting="True" 
                        onsorting="grid_Phone_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                            <asp:ButtonField CommandName="ChoosePhone" DataTextField="Name" HeaderText="Tên điện thoại" 
                                Text="Tên điện thoại" SortExpression="Name" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
                <td>
                    <asp:DetailsView ID="dtview_Phone" runat="server" AutoGenerateRows="False" 
                        CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                        GridLines="None" Height="50px" Width="100%" 
                        HeaderText="CHI TIẾT ĐIỆN THOẠI" ondatabound="dtview_Phone_DataBound" 
                        onitemdeleting="dtview_Phone_ItemDeleting" 
                        onitemcommand="dtview_Phone_ItemCommand" 
                        onitemupdating="dtview_Phone_ItemUpdating" 
                        onmodechanging="dtview_Phone_ModeChanging">
                        <AlternatingRowStyle BackColor="White" Width="150px" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:CommandField ButtonType="Image" CancelText="Hủy" 
                                DeleteImageUrl="~/Images/Apps/delete.png" DeleteText="Xóa" 
                                EditImageUrl="~/Images/Apps/edit.png" EditText="Sửa" InsertVisible="False" 
                                NewImageUrl="~/Images/Apps/new.png" NewText="Thêm mới" ShowDeleteButton="True" 
                                ShowEditButton="True" ShowInsertButton="True" 
                                UpdateImageUrl="~/Images/Apps/update.jpg" UpdateText="Cập nhật" />
                            <asp:BoundField DataField="ID" HeaderText="Mã" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Nhà sản xuất">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_Producer" runat="server" 
                                        DataSourceID="SqlDataSource_Producer" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource_Producer" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddl_Producer" runat="server" 
                                        DataSourceID="SqlDataSource_Producer" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_Producer" runat="server" Text='<%# Eval("ProducerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nhà phân phối">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_Distributor" runat="server" 
                                        DataSourceID="SqlDataSource_Distributor" DataTextField="Name" 
                                        DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource_Distributor" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Distributor]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddl_Distributor" runat="server" 
                                        DataSourceID="SqlDataSource_Distributor" DataTextField="Name" 
                                        DataValueField="ID">
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_Distributor" runat="server" 
                                        Text='<%# Eval("DistributorName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Hình ảnh">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" Enabled="False" 
                                        Text='<%# "~/Images/Phone/" + Eval("Image") %>' Width="450px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" Enabled="False" 
                                        Text='<%# "~/Images/Phone/" + Eval("Image") %>' Width="450px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl='<%# "~/Images/Phone/" + Eval("Image") + ".jpg" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Price" DataFormatString="{0:#,##0 VNĐ}" 
                                HeaderText="Giá bán" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Tính năng nổi bật">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>' TextMode="MultiLine" Width="500px" 
                                        Height="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>' TextMode="MultiLine" Width="500px" 
                                        Height="100px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Camera" HeaderText="Máy ảnh" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VideoCall" HeaderText="VideoCall" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RecorderCamera" HeaderText="Quay phim" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SubCamera" HeaderText="Máy ảnh phụ" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VideoPlayer" HeaderText="Xem phim" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MusicPlayer" HeaderText="Nghe nhạc" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FM" HeaderText="FM Radio" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TV" HeaderText="Xem Tivi" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Recorder" HeaderText="Ghi âm" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CallingRecorder" HeaderText="Ghi âm cuộc gọi" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FMRecorder" HeaderText="Ghi âm FM" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Java" HeaderText="Java" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Game" HeaderText="Trò chơi" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TVConnection" HeaderText="Kết nối TV" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ứng dụng văn phòng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" 
                                        Text='<%# Eval("OfficeApps") %>' Height="100px" TextMode="MultiLine" 
                                        Width="500px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" 
                                        Text='<%# Eval("OfficeApps") %>' Height="100px" TextMode="MultiLine" 
                                        Width="500px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OfficeApps" runat="server" Text='<%# Eval("OfficeApps") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ứng dụng khác">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>' 
                                        Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>' 
                                        Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Ringtone" HeaderText="Nhạc chuông" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DownloadRingtone" HeaderText="Tải nhạc chuông" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SpeakerPhone" HeaderText="Loa ngoài" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Vibrate" HeaderText="Báo rung" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="JackPhone" HeaderText="Tai nghe" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="InternalStore" HeaderText="Bộ nhớ trong" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ram" HeaderText="Ram" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CPU" HeaderText="Vi xử lý CPU" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MemoryCard" HeaderText="Thẻ nhớ ngoài" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MaximumMemoryCapacity" 
                                HeaderText="Hỗ trợ thẻ tối đa" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Contact" HeaderText="Danh bạ" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Message" HeaderText="Tin nhắn" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="2Gband" HeaderText="2Gband" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3Gband" HeaderText="3Gband" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MutilSimcard" HeaderText="Hỗ trợ đa sim" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GPRS" HeaderText="GPRS" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EDGE" HeaderText="EDGE" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3G" HeaderText="3G" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Wifi" HeaderText="Wifi" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Browser" HeaderText="Trình duyệt" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GPS" HeaderText="GPS" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Bluetooth" HeaderText="Bluetooth" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ultrared" HeaderText="Hồng ngoại" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USB" HeaderText="USB" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Screen" HeaderText="Màn hình" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Resolution" HeaderText="Độ phân giải" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SizeScreen" HeaderText="Kích thước màn hình" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Sensor" HeaderText="Cảm ứng" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OS" HeaderText="Hệ điều hành" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Style" HeaderText="Kiểu dáng" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="QwertyKeyboard" HeaderText="Bàn phím Qwerty" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Size" HeaderText="Kích thước" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Weight" HeaderText="Trọng lượng" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Warranty" HeaderText="Bảo hành" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Language" HeaderText="Ngôn ngữ" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Battery" HeaderText="Loại Pin" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CapabilityBattery" HeaderText="Dung lượng Pin" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CallingTime" HeaderText="Thời gian đàm thoại" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="WaittingTime" HeaderText="Thời gian chờ" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StandarBox" HeaderText="Bộ bán hàng chuẩn" >
                            <ControlStyle Width="450px" />
                            </asp:BoundField>
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource_PhoneDetail" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT Phone.ID, Phone.Name, Phone.ProducerID, Phone.DistributorID, Phone.Image, Phone.Price, Phone.SpecialFeature, Phone.Camera, Phone.VideoCall, Phone.RecorderCamera, Phone.SubCamera, Phone.VideoPlayer, Phone.MusicPlayer, Phone.FM, Phone.TV, Phone.Recorder, Phone.CallingRecorder, Phone.FMRecorder, Phone.Java, Phone.Game, Phone.TVConnection, Phone.OfficeApps, Phone.OtherApp, Phone.Ringtone, Phone.DownloadRingtone, Phone.SpeakerPhone, Phone.Vibrate, Phone.JackPhone, Phone.InternalStore, Phone.Ram, Phone.CPU, Phone.MemoryCard, Phone.MaximumMemoryCapacity, Phone.Contact, Phone.Message, Phone.Email, Phone.[2Gband], Phone.[3Gband], Phone.MutilSimcard, Phone.GPRS, Phone.EDGE, Phone.[3G], Phone.Wifi, Phone.Browser, Phone.GPS, Phone.Bluetooth, Phone.Ultrared, Phone.USB, Phone.Screen, Phone.Resolution, Phone.SizeScreen, Phone.Sensor, Phone.OS, Phone.Style, Phone.QwertyKeyboard, Phone.Size, Phone.Weight, Phone.Warranty, Phone.Language, Phone.Battery, Phone.CapabilityBattery, Phone.CallingTime, Phone.WaittingTime, Phone.StandarBox, Phone.ResidualAmount, Distributor.ID AS Expr1, Distributor.Name AS Expr2, Distributor.Address, Producer.ID AS Expr3, Producer.Name AS Expr4, Distributor.Name AS Expr5, Producer.Name AS Expr6 FROM Phone INNER JOIN Distributor ON Phone.DistributorID = Distributor.ID INNER JOIN Producer ON Phone.ProducerID = Producer.ID WHERE (Phone.ID = @ID)" 
                        DeleteCommand="DELETE FROM Phone WHERE ID=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="grid_Phone" Name="ID" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
