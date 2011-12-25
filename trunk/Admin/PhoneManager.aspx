<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.master" CodeFile="PhoneManager.aspx.cs" Inherits="Admin_PhoneManager" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head >
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="AdminSite/Template/style.css" />
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.js" type="text/javascript"></script>
    <title>Validate cho phần nhập Phone</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#form1").validate({
                rules: {
                    txt_Name: {
                        minlength: 5,
                        required: true
                    }
                }, messages: {}
            });
        });
    </script>
    <style type="text/css">
        .style3
        {
            background-color: #996600;
            text-align: center;
        }
        .style4
        {
            background-color: #002952;
            width: 1100px;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            font-size: x-large;
            color: White;
            font-family: Cambria;
            font-weight: bold;
        }
    </style>
</head>

       <table>
            <tr>
                <td colspan=2 align=center><div class="style4">
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                    QUẢN LÝ ĐIỆN THOẠI</div></td>
            </tr>
        </table>
        <table width=100%>
            <tr>
                <br />
                <td  valign="middle" width="300px" align="center" height="50" class="styleText">
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="Large" 
                       Text="DANH SÁCH ĐIỆN THOẠI"></asp:Label>
                </td>
                <td align="center" height="50"  class="styleText"
                    valign="middle">
                    <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="Large" 
                         Text="CHI TIẾT ĐIỆN THOẠI"></asp:Label>
                    <br />
                    <asp:Label ID="lb_Note" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="" valign="middle" align="center" height="50" colspan="2" 
                    id="btn_Search">
                    <asp:TextBox ID="txt_PhoneName" runat="server" Width="200px" CssClass="styleText"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddl_Producer" runat="server" Width="150px">
                        <asp:ListItem Value="0">None</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_Producer1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
&nbsp;&nbsp;
                    <asp:DropDownList ID="ddl_Distributor" runat="server" Width="150px">
                        <asp:ListItem Value="0">None</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_Distributor1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT [Name], [ID] FROM [Distributor]"></asp:SqlDataSource>
                &nbsp;&nbsp;
                    <asp:ImageButton ID="btn_Search" runat="server" 
                        ImageUrl="~/Images/Apps/search.png" ToolTip="Tìm kiếm" 
                        onclick="btn_Search_Click" />
                </td>
            </tr>
            <tr>
                <td class="" valign="top" width="300px">
                    <asp:GridView CssClass="styleGrid" ID="grid_Phone" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" PageSize="20" DataKeyNames="ID" 
                        onpageindexchanging="grid_Phone_PageIndexChanging" 
                        onrowcommand="grid_Phone_RowCommand" Width="100%" AllowSorting="True" 
                        onsorting="grid_Phone_Sorting">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Mã" SortExpression="ID" />
                            <asp:ButtonField CommandName="ChoosePhone" DataTextField="Name" HeaderText="Tên điện thoại" 
                                Text="Tên điện thoại" SortExpression="Name" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>
                    <asp:DetailsView ID="dtview_Phone" runat="server" AutoGenerateRows="False" 
                        CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Height="50px" Width="100%" ondatabound="dtview_Phone_DataBound" 
                        onitemdeleting="dtview_Phone_ItemDeleting" 
                        onitemcommand="dtview_Phone_ItemCommand" 
                        onitemupdating="dtview_Phone_ItemUpdating" 
                        onmodechanging="dtview_Phone_ModeChanging" DataKeyNames="ID" 
                        oniteminserting="dtview_Phone_ItemInserting">
                        <AlternatingRowStyle BackColor="White" Width="200px" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" ImageUrl="~/Images/Apps/update.jpg" Text="Cập nhật" 
                                        ToolTip="Cập nhật" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/Apps/delete.png" Text="Hủy" 
                                        ToolTip="Xóa" />
                                    &nbsp;
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                        CommandName="Insert" ImageUrl="~/Images/Apps/add.png" Text="Ghi" 
                                        ToolTip="Thêm mới" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/Apps/delete.png" Text="Hủy" 
                                        ToolTip="Xóa" />
                                    &nbsp;
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/Apps/edit.png" Text="Sửa" 
                                        ToolTip="Sửa" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="New" ImageUrl="~/Images/Apps/add.png" Text="Thêm" 
                                        ToolTip="Thêm mới" />
                                    &nbsp;<asp:ImageButton ID="imgBtn_Delete" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="~/Images/Apps/delete.png" Text="Xóa" 
                                        ToolTip="Xóa" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="Mã" >
                            <ControlStyle Width="400px" />
                            <HeaderStyle Width="200px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Tên điện thoại *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Name" runat="server" Text='<%# Bind("Name") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txt_Name" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Name" runat="server" 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txt_Name" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>

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
                                    <asp:SqlDataSource ID="SqlDataSource_Producer" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
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
                                    <asp:SqlDataSource ID="SqlDataSource_Distributor" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Distributor]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_Distributor" runat="server" 
                                        Text='<%# Eval("DistributorName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ResidualAmount" HeaderText="Số lượng tồn" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Hình ảnh *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" 
                                        Text='<%# Eval("Image") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txt_Image" ErrorMessage="Vui lòng chọn hình ảnh"></asp:RequiredFieldValidator>
                                    <asp:Button ID="btn_InsertImage" runat="server" 
                                        onclientclick="bChooseImage_Click" Text="..." />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Image" runat="server" Width="400px" 
                                        Height="26px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txt_Image" ErrorMessage="Vui lòng chọn hình ảnh"></asp:RequiredFieldValidator>
                                    <asp:Button ID="btn_InsertImage" runat="server" 
                                        onclientclick="bChooseImage_Click" Text="..." />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl='<%# "~/Images/Phone/" + Eval("Image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Giá bán *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Price" runat="server" Text='<%# Bind("Price") %>' 
                                        Width="100px"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txt_Price_FilteredTextBoxExtender" 
                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_Price">
                                    </asp:FilteredTextBoxExtender>
                                    VNĐ<asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="txt_Price" Display="Dynamic" 
                                        ErrorMessage="Vui lòng nhập giá từ 0-100.000.000 VNĐ" MaximumValue="100000000" 
                                        MinimumValue="0" ToolTip="Vui lòng nhập giá từ 0-100.000.000 VNĐ" Type="Double"></asp:RangeValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Price" runat="server" 
                                        Text='<%# Bind("Price") %>' Width="100px"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txt_Price_FilteredTextBoxExtender" 
                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_Price">
                                    </asp:FilteredTextBoxExtender>
                                    VNĐ<asp:MaskedEditExtender ID="txt_Price_MaskedEditExtender"
                                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                        InputDirection="RightToLeft" Mask="999999999" MaskType="Number" 
                                        TargetControlID="txt_Price"></asp:MaskedEditExtender>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                        ControlToValidate="txt_Price" Display="Dynamic" 
                                        ErrorMessage="Vui lòng nhập giá từ 0-100.000.000 VNĐ" MaximumValue="100000000" 
                                        MinimumValue="0"></asp:RangeValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("Price", "{0:#,##0 VNĐ}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tính năng nổi bật *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" 
                                        TextMode="MultiLine" Width="450px" 
                                        Height="100px" Text='<%# Eval("SpecialFeature") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txt_SpecialFeature" ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_SpecialFeature" runat="server" TextMode="MultiLine" Width="450px" 
                                        Height="100px" Text='<%# Eval("SpecialFeature") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txt_SpecialFeature" ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_SpecialFeature" runat="server" 
                                        
                                        Text='<%# Eval("SpecialFeature") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Camera" 
                                HeaderText="Máy ảnh" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VideoCall" HeaderText="VideoCall" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RecorderCamera" HeaderText="Quay phim" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SubCamera" HeaderText="Máy ảnh phụ" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VideoPlayer" HeaderText="Xem phim" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MusicPlayer" HeaderText="Nghe nhạc" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FM" HeaderText="FM Radio" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TV" HeaderText="Xem Tivi" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Recorder" HeaderText="Ghi âm" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CallingRecorder" HeaderText="Ghi âm cuộc gọi" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FMRecorder" HeaderText="Ghi âm FM" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Java" HeaderText="Java" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Game" HeaderText="Trò chơi" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TVConnection" HeaderText="Kết nối TV" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ứng dụng văn phòng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" Height="100px" TextMode="MultiLine" 
                                        Width="450px" Text='<%# Eval("OfficeApps") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OfficeApps" runat="server" Height="100px" TextMode="MultiLine" 
                                        Width="450px" Text='<%# Eval("OfficeApps") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OfficeApps" runat="server" Text='<%# Eval("OfficeApps") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ứng dụng khác">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" 
                                        Height="100px" TextMode="MultiLine" Width="450px" 
                                        Text='<%# Eval("OtherApp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_OtherApp" runat="server" 
                                        Height="100px" TextMode="MultiLine" Width="450px" 
                                        Text='<%# Eval("OtherApp") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lb_OtherApp" runat="server" Text='<%# Eval("OtherApp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nhạc chuông *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Ringtone" runat="server" Text='<%# Bind("Ringtone") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txt_Ringtone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Ringtone" runat="server" Text='<%# Bind("Ringtone") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txt_Ringtone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ringtone") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DownloadRingtone" HeaderText="Tải nhạc chuông" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Loa ngoài *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_SpeakerPhone" runat="server" 
                                        Text='<%# Bind("SpeakerPhone") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="txt_SpeakerPhone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_SpeakerPhone" runat="server" 
                                        Text='<%# Bind("SpeakerPhone") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="txt_SpeakerPhone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("SpeakerPhone") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Báo rung">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Vibrate" runat="server" Text='<%# Bind("Vibrate") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="txt_Vibrate" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Vibrate" runat="server" Text='<%# Bind("Vibrate") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="txt_Vibrate" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Vibrate") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tai nghe">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_JackPhone" runat="server" Text='<%# Bind("JackPhone") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ControlToValidate="txt_JackPhone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_JackPhone" runat="server" Text='<%# Bind("JackPhone") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ControlToValidate="txt_JackPhone" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("JackPhone") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bộ nhớ trong *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_InternalStore" runat="server" 
                                        Text='<%# Bind("InternalStore") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                        ControlToValidate="txt_InternalStore" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_InternalStore" runat="server" 
                                        Text='<%# Bind("InternalStore") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                        ControlToValidate="txt_InternalStore" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("InternalStore") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Ram" HeaderText="Ram" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CPU" HeaderText="Vi xử lý CPU" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Thẻ nhớ ngoài *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_MemoryCard" runat="server" 
                                        Text='<%# Bind("MemoryCard") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                        ControlToValidate="txt_MemoryCard" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_MemoryCard" runat="server" 
                                        Text='<%# Bind("MemoryCard") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                        ControlToValidate="txt_MemoryCard" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("MemoryCard") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaximumMemoryCapacity" 
                                HeaderText="Hỗ trợ thẻ tối đa" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Danh bạ *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Contact" runat="server" Text='<%# Bind("Contact") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                        ControlToValidate="txt_Contact" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Contact" runat="server" Text='<%# Bind("Contact") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                        ControlToValidate="txt_Contact" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Contact") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tin nhắn *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Message" runat="server" Text='<%# Bind("Message") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                        ControlToValidate="txt_Message" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Message" runat="server" Text='<%# Bind("Message") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                        ControlToValidate="txt_Message" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Email" runat="server" Text='<%# Bind("Email") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                        ControlToValidate="txt_Email" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Email" runat="server" Text='<%# Bind("Email") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                        ControlToValidate="txt_Email" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="2Gband" HeaderText="2Gband" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3Gband" HeaderText="3Gband" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MutilSimcard" HeaderText="Hỗ trợ đa sim" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GPRS" HeaderText="GPRS" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EDGE" HeaderText="EDGE" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3G" HeaderText="3G" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Wifi" HeaderText="Wifi" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Browser" HeaderText="Trình duyệt" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GPS" HeaderText="GPS" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Bluetooth" HeaderText="Bluetooth" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ultrared" HeaderText="Hồng ngoại" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USB" HeaderText="USB" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Màn hình *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Screen" runat="server" Text='<%# Bind("Screen") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                        ControlToValidate="txt_Screen" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Screen" runat="server" Text='<%# Bind("Screen") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                        ControlToValidate="txt_Screen" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Screen") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Độ phân giải *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Resolution" runat="server" 
                                        Text='<%# Bind("Resolution") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                        ControlToValidate="txt_Resolution" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Resolution" runat="server" 
                                        Text='<%# Bind("Resolution") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                        ControlToValidate="txt_Resolution" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("Resolution") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Kích thước màn hình *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_SizeScreen" runat="server" 
                                        Text='<%# Bind("SizeScreen") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                        ControlToValidate="txt_SizeScreen" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_SizeScreen" runat="server" 
                                        Text='<%# Bind("SizeScreen") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                        ControlToValidate="txt_SizeScreen" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("SizeScreen") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sensor" HeaderText="Cảm ứng" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OS" HeaderText="Hệ điều hành" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Style" HeaderText="Kiểu dáng" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="QwertyKeyboard" HeaderText="Bàn phím Qwerty" >
                            <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Kích thước *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Size" runat="server" Text='<%# Bind("Size") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                        ControlToValidate="txt_Size" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Size" runat="server" Text='<%# Bind("Size") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                        ControlToValidate="txt_Size" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trọng lượng *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Weight" runat="server" Text='<%# Bind("Weight") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                        ControlToValidate="txt_Weight" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Weight" runat="server" Text='<%# Bind("Weight") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                        ControlToValidate="txt_Weight" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bảo hành *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Warranty" runat="server" Text='<%# Bind("Warranty") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                        ControlToValidate="txt_Warranty" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Warranty" runat="server" Text='<%# Bind("Warranty") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                        ControlToValidate="txt_Warranty" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Warranty") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngôn ngữ *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Language" runat="server" Text='<%# Bind("Language") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                        ControlToValidate="txt_Language" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Language" runat="server" Text='<%# Bind("Language") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                        ControlToValidate="txt_Language" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Loại Pin *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Battery" runat="server" Text='<%# Bind("Battery") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                        ControlToValidate="txt_Battery" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_Battery" runat="server" Text='<%# Bind("Battery") %>' 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                        ControlToValidate="txt_Battery" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("Battery") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dung lượng Pin *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_CapabilityBattery" runat="server" 
                                        Text='<%# Bind("CapabilityBattery") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                                        ControlToValidate="txt_CapabilityBattery" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_CapabilityBattery" runat="server" 
                                        Text='<%# Bind("CapabilityBattery") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                                        ControlToValidate="txt_CapabilityBattery" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("CapabilityBattery") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thời gian đàm thoại *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_CallingTime" runat="server" 
                                        Text='<%# Bind("CallingTime") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                                        ControlToValidate="txt_CallingTime" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_CallingTime" runat="server" 
                                        Text='<%# Bind("CallingTime") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                        ControlToValidate="txt_CallingTime" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("CallingTime") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thời gian chờ *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_WaittingTime" runat="server" 
                                        Text='<%# Bind("WaittingTime") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                        ControlToValidate="txt_WaittingTime" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_WaittingTime" runat="server" 
                                        Text='<%# Bind("WaittingTime") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                                        ControlToValidate="txt_WaittingTime" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("WaittingTime") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bộ bán hàng chuẩn *">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_StandarBox" runat="server" 
                                        Text='<%# Bind("StandarBox") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                        ControlToValidate="txt_StandarBox" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txt_StandarBox" runat="server" 
                                        Text='<%# Bind("StandarBox") %>' Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                        ControlToValidate="txt_StandarBox" Display="Dynamic" 
                                        ErrorMessage="Ô này không thể để trống"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label23" runat="server" Text='<%# Bind("StandarBox") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phụ kiện tương thích">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Accessory" runat="server" Width="300px"></asp:TextBox>
                                    <asp:Button ID="btn_ChooseAccessory" runat="server" Text="..." />
                                </EditItemTemplate>
                            </asp:TemplateField>
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
</asp:Content>