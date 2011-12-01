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
                        onrowcommand="grid_Phone_RowCommand" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:ButtonField CommandName="ID" DataTextField="ID" HeaderText="Mã điện thoại" 
                                Text="Mã điện thoại" />
                            <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" />
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
                        HeaderText="CHI TIẾT ĐIỆN THOẠI">
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
                            <ControlStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Tên điện thoại" />
                            <asp:TemplateField HeaderText="Mã Nhà sản xuất">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_ProducerID" runat="server" Enabled="False" 
                                        Text='<%# Eval("ProducerID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_ProducerID" runat="server" Enabled="False" 
                                        Text='<%# Eval("ProducerID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_ProducerID" runat="server" Text='<%# Eval("ProducerID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mã Nhà phân phối">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_DistributorID" runat="server" Enabled="False" 
                                        Text='<%# Eval("DistributorID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_DistributorID" runat="server" Enabled="False" 
                                        Text='<%# Eval("DistributorID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_DistributorID" runat="server" 
                                        Text='<%# Eval("DistributorID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" />
                            <asp:TemplateField HeaderText="Hình ảnh">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" Enabled="False" 
                                        Text='<%# "~/Images/Phone/" + Eval("Image") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" Enabled="False" 
                                        Text='<%# "~/Images/Phone/" + Eval("Image") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl='<%# "~/Images/Phone/" + Eval("Image") + ".jpg" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Price" DataFormatString="{0:#,##0 VNĐ}" 
                                HeaderText="Giá bán" />
                            <asp:TemplateField HeaderText="Tính năng nổi bật">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_SpecialFeature" runat="server" 
                                        Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Camera" HeaderText="Máy ảnh" />
                            <asp:BoundField DataField="VideoCall" HeaderText="VideoCall" />
                            <asp:BoundField DataField="RecorderCamera" HeaderText="Quay phim" />
                            <asp:BoundField DataField="SubCamera" HeaderText="Máy ảnh phụ" />
                            <asp:BoundField DataField="VideoPlayer" HeaderText="Xem phim" />
                            <asp:BoundField DataField="MusicPlayer" HeaderText="Nghe nhạc" />
                            <asp:BoundField DataField="FM" HeaderText="FM Radio" />
                            <asp:BoundField DataField="TV" HeaderText="Xem Tivi" />
                            <asp:BoundField DataField="Recorder" HeaderText="Ghi âm" />
                            <asp:BoundField DataField="CallingRecorder" HeaderText="Ghi âm cuộc gọi" />
                            <asp:BoundField DataField="FMRecorder" HeaderText="Ghi âm FM" />
                            <asp:BoundField DataField="Java" HeaderText="Java" />
                            <asp:BoundField DataField="Game" HeaderText="Trò chơi" />
                            <asp:BoundField DataField="TVConnection" HeaderText="Kết nối TV" />
                            <asp:TemplateField HeaderText="Ứng dụng văn phòng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" 
                                        Text='<%# Eval("OfficeApps") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" 
                                        Text='<%# Eval("OfficeApps") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OfficeApps" runat="server" Text='<%# Eval("OfficeApps") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ứng dụng khác">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Ringtone" HeaderText="Nhạc chuông" />
                            <asp:BoundField DataField="DownloadRingtone" HeaderText="Tải nhạc chuông" />
                            <asp:BoundField DataField="SpeakerPhone" HeaderText="Loa ngoài" />
                            <asp:BoundField DataField="Vibrate" HeaderText="Báo rung" />
                            <asp:BoundField DataField="JackPhone" HeaderText="Tai nghe" />
                            <asp:BoundField DataField="InternalStore" HeaderText="Bộ nhớ trong" />
                            <asp:BoundField DataField="Ram" HeaderText="Ram" />
                            <asp:BoundField DataField="CPU" HeaderText="Vi xử lý CPU" />
                            <asp:BoundField DataField="MemoryCard" HeaderText="Thẻ nhớ ngoài" />
                            <asp:BoundField DataField="MaximumMemoryCapacity" 
                                HeaderText="Hỗ trợ thẻ tối đa" />
                            <asp:BoundField DataField="Contact" HeaderText="Danh bạ" />
                            <asp:BoundField DataField="Message" HeaderText="Tin nhắn" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="2Gband" HeaderText="2Gband" />
                            <asp:BoundField DataField="3Gband" HeaderText="3Gband" />
                            <asp:BoundField DataField="MutilSimcard" HeaderText="Hỗ trợ đa sim" />
                            <asp:BoundField DataField="GPRS" HeaderText="GPRS" />
                            <asp:BoundField DataField="EDGE" HeaderText="EDGE" />
                            <asp:BoundField DataField="3G" HeaderText="3G" />
                            <asp:BoundField DataField="Wifi" HeaderText="Wifi" />
                            <asp:BoundField DataField="Browser" HeaderText="Trình duyệt" />
                            <asp:BoundField DataField="GPS" HeaderText="GPS" />
                            <asp:BoundField DataField="Bluetooth" HeaderText="Bluetooth" />
                            <asp:BoundField DataField="Ultrared" HeaderText="Hồng ngoại" />
                            <asp:BoundField DataField="USB" HeaderText="USB" />
                            <asp:BoundField DataField="Screen" HeaderText="Màn hình" />
                            <asp:BoundField DataField="Resolution" HeaderText="Độ phân giải" />
                            <asp:BoundField DataField="SizeScreen" HeaderText="Kích thước màn hình" />
                            <asp:BoundField DataField="Sensor" HeaderText="Cảm ứng" />
                            <asp:BoundField DataField="OS" HeaderText="Hệ điều hành" />
                            <asp:BoundField DataField="Style" HeaderText="Kiểu dáng" />
                            <asp:BoundField DataField="QwertyKeyboard" HeaderText="Bàn phím Qwerty" />
                            <asp:BoundField DataField="Size" HeaderText="Kích thước" />
                            <asp:BoundField DataField="Weight" HeaderText="Trọng lượng" />
                            <asp:BoundField DataField="Warranty" HeaderText="Bảo hành" />
                            <asp:BoundField DataField="Language" HeaderText="Ngôn ngữ" />
                            <asp:BoundField DataField="Battery" HeaderText="Loại Pin" />
                            <asp:BoundField DataField="CapabilityBattery" HeaderText="Dung lượng Pin" />
                            <asp:BoundField DataField="CallingTime" HeaderText="Thời gian đàm thoại" />
                            <asp:BoundField DataField="WaittingTime" HeaderText="Thời gian chờ" />
                            <asp:BoundField DataField="StandarBox" HeaderText="Bộ bán hàng chuẩn" />
                            <asp:CommandField ButtonType="Image" CancelText="Hủy" 
                                DeleteImageUrl="~/Images/Apps/delete.png" DeleteText="Xóa" 
                                EditImageUrl="~/Images/Apps/edit.png" EditText="Sửa" 
                                NewImageUrl="~/Images/Apps/new.png" NewText="Thêm mới" 
                                UpdateImageUrl="~/Images/Apps/update.jpg" UpdateText="Cập nhật" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource_PhoneDetail" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT * FROM [Phone] WHERE ID=@ID" 
                        DeleteCommand="DELETE FROM Phone WHERE ID=@ID">
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
