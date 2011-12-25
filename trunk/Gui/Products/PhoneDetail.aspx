<%@ Page Title="" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Gui/Frame.master" CodeFile="PhoneDetail.aspx.cs" Inherits="Admin_PhoneDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
        <style type="text/css">
            .style1
            {
                width: 100%;
                background-color: #FFFFFF;
            }
            .style2
            {
                height: 197px;
                font-weight: 700;
            }
            .style3
            {
                height: 197px;
                width: 200px;
            }
            .style4
            {
                height: 197px;
                width: 290px;
            }
            .style5
            {
                font-size: large;
                font-weight: bold;
            }
            .style7
            {
                width: 201px;
                font-weight: bold;
            }
            .style8
            {
                width: 200px;
                font-style: italic;
                color: #3333CC;
            }
            .style9
            {
                width: 200px;
                height: 23px;
                font-style: italic;
                color: #3333CC;
            }
            .style10
            {
                height: 23px;
            }
            .style12
            {
                width: 200px;
                font-style: italic;
                color: #3333CC;
                background-color: #FFFFFF;
            }
            .style14
            {
                width: 200px;
                color: #3333FF;
                font-style: italic;
            }
            .style15
            {
                width: 201px;
                font-style: italic;
                color: #3333CC;
                background-color: #FFFFFF;
            }
            .style16
            {
                width: 200px;
                font-style: italic;
                background-color: #FFFFFF;
            }
            .style17
            {
                color: #3333FF;
            }
            .style18
            {
                width: 100%;
            }
            .style19
            {
                color: #3333FF;
                font-style: italic;
            }
            .style20
            {
                height: 197px;
                font-weight: 700;
                width: 354px;
            }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <div>
    
        <table class="style1" border="2">
            <tr>
                <td class="style3">
                    <asp:Image ID="img_Phone" runat="server" Height="200px" ImageAlign="Middle" 
                        Width="200px" />
                </td>
                <td class="style4">
                    <span class="style5">ĐIỆN THOẠI DI ĐỘNG : </span>
                    <asp:Label ID="lb_PhoneName" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    <b>Giá bán :</b> 
                    <asp:Label ID="lb_Price" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <center>
                        <asp:ImageButton ID="iBuy" runat="server" 
                        ImageUrl="~/Images/Apps/Front/b-buy.png" onclick="iBuy_Click" /></center>
                </td>
                <td class="style20">
                    <b>Bộ bán hàng chuẩn: </b>
                    <br />
                    <asp:Label ID="lb_StandarBox" runat="server" Font-Bold="False"></asp:Label>
                    <br />
                    <br />
                    Bảo hành
                    <asp:Label ID="lb_Warranty" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="style2" align="left" valign="top">
                    <asp:GridView ID="grid_Accessory" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" 
                        EnableSortingAndPagingCallbacks="True" PageSize="5" Width="100%" 
                        AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                        BorderWidth="1px" CellPadding="4" Font-Bold="False" ForeColor="Black" 
                        GridLines="Horizontal" Height="100%" style="margin-left: 1px" 
                        onpageindexchanging="grid_Accessory_PageIndexChanging">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="id" 
                                DataNavigateUrlFormatString="~/Gui/AccessoryDetail.aspx?id={0}" 
                                DataTextField="Name" HeaderText="Những phụ kiện tương thích" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_PhoneAccessory" runat="server">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
        <br />
        <br />
    
    </div>
    <table border="1" class="style1">
        <tr>
            <td class="style7">
                Tính năng nổi bật :
            </td>
            <td>
                <asp:Label ID="lb_SpecialFeature" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Giải trí :</td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label1" runat="server" Text="Máy ảnh :" 
                                ToolTip="Máy ảnh là chức năng chụp ảnh trên điện thoại di động và lưu lại những hình ảnh vào bộ nhớ máy hoặc thẻ nhớ "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Camera" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            <asp:Label ID="Label2" runat="server" Text="Máy ảnh phụ :" 
                                ToolTip="Máy ảnh phụ là một camera nhỏ thường nằm ở mặt trước điện thoại nhằm hỗ trợ chức năng cuộc gọi có hình ảnh của 3G (video call) hoặc cũng có thể chụp ảnh nhưng độ phân giải không cao bằng máy ảnh chính."></asp:Label>
                        </td>
                        <td class="style10">
                            <asp:Label ID="lb_SubCamera" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label3" runat="server" Text="VideoCall : " 
                                ToolTip="Video call là dịch vụ thoại có kèm hình ảnh, áp dụng cho các thiết bị đầu cuối có gắn camera và màn hình hiển thị, cho phép người sử dụng có thể nghe và thấy hình chuyển động gần như ngay tức thì của nhau. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_VideoCall" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label4" runat="server" Text="Quay Phim" 
                                ToolTip=" Quay phim là chức năng ghi lại hình ảnh dưới dạng video trên điện thoại di động. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_RecorderCamera" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label5" runat="server" Text="Xem phim : " 
                                ToolTip=" Xem phim là chức năng coi video trên điện thoại di động được hỗ trợ dưới nhiều định dạng file khác nhau. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_VideoPlayer" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label6" runat="server" Text="Nghe nhạc : " 
                                ToolTip=" Nghe nhạc là một chức năng được hỗ trợ trên điện thoại di động dùng để nghe nhạc với các định dạng file MP3, ACC, WAV... có thể nghe bằng tai nghe hoặc loa ngoài. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_MusicPlayer" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label7" runat="server" Text="FM radio : " 
                                ToolTip="Một tính năng cho phép người dùng có thể sử dụng điện thoại như một máy phát radio, nhằm mục đích giải trí trong thời gian rỗi. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_FM" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label8" runat="server" Text="Xem TV : " 
                                ToolTip=" Xem Tivi khả năng thu nhận tín hiệu sóng truyền hình, chức năng này hiện đang là kênh giải trí tiện lợi nhất. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_TV" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Ứng dụng &amp; Trò chơi :</td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label9" runat="server" Text="Ghi âm :" 
                                ToolTip="Ghi âm là chức năng thu lại (ghi lại) âm thanh xung quanh và lưu trữ vào bộ nhớ của điện thoại để có thể nghe lại. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Recoder" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label10" runat="server" Text="Ghi âm cuộc gọi:" 
                                ToolTip="Ghi âm cuộc gọi là chức năng ghi lại nội dung đàm thoại của một cuộc gọi. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_CallingRecorder" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label11" runat="server" Text="Ghi âm FM :" 
                                ToolTip="Ghi âm FM là chức năng ghi lại những nội dung yêu thích trên đài FM để nghe lại trong thời gian rảnh rỗi. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_FMRecorder" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label12" runat="server" Text="Java :" 
                                ToolTip=" Java là một ngôn ngữ lập trình hiện đại ngày càng phổ biến trên điện thoại di động với nhiều phiên bản khác nhau. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Java" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label13" runat="server" Text="Trò chơi :" 
                                ToolTip="Trò chơi là một tính năng giải trí, gồm những game có sẵn trong máy hoặc có thể cài đặt thêm, giúp người dùng thư giản và giải trí trên chiếc điện thoại của mình. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Game" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label14" runat="server" Text="Kết nối TV :" 
                                ToolTip="Chức năng kết nối Tivi hay thường được gọi là Out Tivi, là chức năng kết nối điện thoại di động với máy Tivi để truyền tải hình ảnh, game, phim, trình chiếu... ra chiếc Tivi để xem với kích thước màn hình lớn hơn. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_TVConnection" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label15" runat="server" Text="Ứng dụng văn phòng : " 
                                ToolTip="Ứng dụng văn phòng là chức năng xem hoặc soạn thảo văn bản (Word, Excel, PowerPoint, PDF) "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_OfficeApps" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label16" runat="server" Text="Ứng dụng khác :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_OtherApp" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Nhạc chuông : </td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label17" runat="server" Text="Loại : " 
                                ToolTip="Loại nhạc chuông là chức năng điện thoại hỗ trợ đọc những file nhạc chuông mặc định của nhà sản xuất như là MP3, MIDI, WAV... "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Ringtone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label18" runat="server" Text="Tải nhạc :" 
                                ToolTip=" Tải nhạc là chức năng giúp người dùng có thể tải những bài nhạc, phim, hình ảnh...qua thẻ nhớ hay cáp USB "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_DownloadRingtone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label19" runat="server" Text="Loa ngoài :" 
                                ToolTip="Loa ngoài là chức năng dùng để phát âm thanh với công suất lớn khi nghe nhạc, xem phim, hay nhạc chuông... "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_SpeakerPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label20" runat="server" Text="Báo rung :" 
                                ToolTip="Báo rung là chức năng giúp người dùng nhận biết được có cuộc gọi đến khi điện thoại ở chế độ im lặng "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Vibrate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label21" runat="server" Text="Jack Tai nghe : " 
                                ToolTip=" Jack tai nghe là chức năng dùng để kết nối điện thoại với tai nghe khi người dùng sử dụng để nghe nhạc hay đàm thoại. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_JackPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Bộ nhớ : </td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label22" runat="server" Text="Bộ nhớ trong : " 
                                ToolTip="Bộ nhớ là bộ nhớ mặc định của nhà sản xuất dùng để lưu trữ tất cả mọi dữ liệu trên điện thoại di động như: phần mềm hoạt động máy, danh bạ, tin nhắn, hình ảnh, nhạc chuông... "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_InternalStore" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            Ram :
                        </td>
                        <td>
                            <asp:Label ID="lb_Ram" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label23" runat="server" Text="Vi xử lý CPU :" 
                                ToolTip=" CPU (Central Processing Unit) - nếu không được biết đến như một bộ xử lý - là một mạch điện tử có thể thực hiện các chương trình máy tính. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_CPU" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label24" runat="server" Text="Thẻ nhớ ngoài : " 
                                ToolTip="Một khe cắm đặc biệt để chèn một thẻ nhớ. Thẻ nhớ cho phép bạn mở rộng của điện thoại bộ nhớ trong "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_MemoryCard" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label25" runat="server" Text="Hỗ trợ thẻ tối đa :" 
                                ToolTip="Hỗ trợ thẻ tối đa là chức năng điện thoại có thể gắn thẻ nhớ ngoài vào máy với dung lượng lớn ở mức cao nhất"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_MaximumMemoryCapacity" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Danh bạ, tin nhắn, Email : </td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label26" runat="server" Text="Danh bạ :" 
                                ToolTip="Danh bạ là nơi lưu trữ thông tin số điện thoại của bạn bè và người thân "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Contact" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label27" runat="server" Text="Tin nhắn :" 
                                ToolTip="Ngoài các cuộc gọi, tất cả các mạng GSM và CDMA cũng cung cấp dịch vụ nhắn tin và nhắn tin đã được một dịch vụ cốt lõi từ những ngày đầu của điện thoại di động GSM. Điện thoại di động nhắn tin dao động từ tin nhắn SMS, thông qua EMS, để IM và Email. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Message" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label28" runat="server" Text="Email :" 
                                ToolTip="Email ở khắp mọi nơi ngay bây giờ và hầu như mọi người đều có tài khoản riêng, mật khẩu bảo vệ thư điện tử của họ "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Email" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Kết nối dữ liệu : </td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label29" runat="server" Text="Băng tần 2G :" 
                                ToolTip="Băng tần là một đặc điểm quan trọng của điện thoại vì băng tần có ý nghĩa xác định thiết bị hoạt động được trên mạng di động nào. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_2Gband" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label30" runat="server" Text="Băng tần 3G :" 
                                ToolTip="Băng tần là một đặc điểm quan trọng của điện thoại di động vì băng tần có ý nghĩa xác định thiết bị hoạt động được trên mạng di động nào."></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_3Gband" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label31" runat="server" Text="Hỗ trợ đa sim :" 
                                ToolTip="Hỗ trợ đa sim là chức năng điện thoại di động cùng lúc có thể sử dụng nhiều sim khác nhau cùng online trên một điện thoại. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_MutilSimcard" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label32" runat="server" Text="GPRS :" 
                                ToolTip="Dịch vụ vô tuyến gói tổng hợp (tiếng Anh: General Packet Radio Service (GPRS))"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_GPRS" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label33" runat="server" Text="EDGE :" 
                                ToolTip=" EDGE (Enhanced Data Rates for GSM Evolution), đôi khi còn gọi là EGPRS, là một công nghệ di động được nâng cấp từ GPRS "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_EDGE" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label34" runat="server" Text="3G : " 
                                ToolTip="3G, hay 3-G, (viết tắt của third-generation technology) là công nghệ truyền thông thế hệ thứ ba, cho phép truyền cả dữ liệu thoại và dữ liệu ngoài thoại (tải dữ liệu, gửi email, tin nhắn nhanh, hình ảnh...)"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_3G" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label35" runat="server" Text="Wifi :" 
                                ToolTip="Wi-Fi hay mạng 802.11 là hệ thống mạng không dây sử dụng sóng vô tuyến, giống như điện thoại di động, truyền hình và radio."></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Wifi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label36" runat="server" Text="Trình duyệt : " 
                                ToolTip="Trình duyệt web (Web Browser) là phần mềm được sử dụng để truy cập vào những trang web"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Browser" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label37" runat="server" Text="GPS : " 
                                ToolTip="GPS (Global Positioning System – Hệ thống định vị toàn cầu) là hệ thống dựa vào các vệ tinh toàn cầu để xác định vị trí trên trái đất. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_GPS" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label38" runat="server" Text="Bluetooth : " 
                                ToolTip="Bluetooth là một đặc tả công nghiệp cho truyền thông không dây tầm gần giữa các thiết bị điện tử. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Bluetooth" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label39" runat="server" Text="Hồng ngoại : " 
                                ToolTip="Hồng ngoại là giao tiếp dữ liệu hồng ngoại. Nhiệm vụ của IrDA là tạo ra một chuẩn trao đổi dữ liệu thông qua sóng hồng ngoại. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Ultrared" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label40" runat="server" Text="USB :" 
                                ToolTip="Kết nối của điện thoại với máy tính thông qua cáp để truyền tải trao đổi giữ liệu giữa máy tính và điện thoại. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_USB" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Màn hình hiển thị : </td>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label41" runat="server" Text="Loại :" 
                                
                                ToolTip="Loại màn hình: Loại hiển thị của màn hình điên thoại di động, một số dòng hiển thị là màn hình màu, một số thì hiển thị là màn hình đơn sắc. " 
                                CssClass="style17"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Screen" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label42" runat="server" Text="Độ phân giải :" 
                                
                                ToolTip="Độ phân giải màn hình được biểu thị bằng số lượng các điểm ảnh theo chiều ngang và số dòng theo chiều đứng trên màn hình. " 
                                CssClass="style17"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Resolution" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label43" runat="server" Text="Kích thước :" 
                                
                                ToolTip="Kích thước màn hình là biểu hiện độ lớn hay nhỏ của màn hình điện thước tính bằng đơn vị: inch " 
                                CssClass="style17"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_SizeScreen" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:Label ID="Label44" runat="server" Text="Cảm ứng : " 
                                ToolTip="Là chức năng màn hình có thể tương tác trực tiếp trên màn hình. " 
                                CssClass="style17"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Sensor" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Thông tin chung :</td>
            <td>
                <table class="style18">
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label45" runat="server" Text="Hệ điều hành : " 
                                ToolTip="Hệ điều hành là một phần mềm chuyên dụng để điều hành, quản lí chiếc điện thoại của bạn. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_OS" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label46" runat="server" Text="Kiểu dáng : " 
                                ToolTip="Kiểu dáng điện thoại hiện nay đa dạng mang tích chất thời trang đáp ứng được nhu cầu của người sử dụng. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Style" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label47" runat="server" Text="Bàn phím Qwerty : " 
                                ToolTip=" Bàn phím Qwerty trên điện thoại là bàn phím có đầy đủ 26 chữ cái giống bàn phím của máy tính, phù hợp với những ứng dụng văn phòng, soạn thảo văn bản. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_QwertyKeyboard" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label48" runat="server" Text="Kích thước điện thoại : " 
                                ToolTip=" Kích thước điện thoại thể hiện chiều cao, dày, rộng của điện thoại được tính bằng đơn vị (mm) "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Size" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label49" runat="server" Text="Trọng lượng điện thoại : " 
                                ToolTip="Trọng lượng điện thoại biểu hiện độ nặng nhẹ của của sản phẩm được tính bằng đơn vị Gram (g) "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Weight" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label50" runat="server" Text="Ngôn ngữ điện thoại : " 
                                ToolTip="Ngôn ngữ là chức năng điện thoại hỗ trợ nhiều loại ngôn ngữ khác nhau nhằm hỗ trợ người dùng dễ sử dụng. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Language" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label51" runat="server" Text="Bảo hành : "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Warranty2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Nguồn : </td>
            <td>
                <table class="style18">
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label52" runat="server" Text="Loại pin : "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_Battery" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label53" runat="server" Text="Dung lượng pin : " 
                                ToolTip="Dung lượng pin nằm chỉ khả năng hoạt động của pin "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_CapabilityBattery" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label54" runat="server" Text="Thời gian đàm thoại : " 
                                ToolTip="Thời gian đàm thoại là thời gian mà được tính khi cuộc gọi bắt đầu kết nối. "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_CallingTime" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" width="200px">
                            <asp:Label ID="Label55" runat="server" Text="Thời gian chờ : " 
                                ToolTip="Là thời gian máy ở trạng thái nghỉ không sử dụng "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_WaittingTime" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
</asp:Content>

