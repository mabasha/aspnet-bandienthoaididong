<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportPhone.aspx.cs" Inherits="Admin_ImportPhone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 69%;
            height: 774px;
        }
        .style2
        {
        }
        .style3
        {
        }
        .style4
        {
            width: 331px;
        }
        .style5
        {
            width: 157px;
        }
        .style6
        {
            width: 349px;
        }
        .style7
        {
            width: 346px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td align="center" colspan="4">
                CẬP NHẬT ĐIỆN THOẠI</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Tên điện thoại :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Maximum Memory Capcity:</td>
            <td class="style7">
                <asp:TextBox ID="TextBox19" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Nhà sản xuất :</td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                    SelectCommand="SELECT [Name] FROM [Producer]"></asp:SqlDataSource>
            </td>
            <td class="style6">
                Contact :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox20" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Image :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox48" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Message:</td>
            <td class="style7">
                <asp:TextBox ID="TextBox21" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Giá tiền:</td>
            <td class="style4">
                <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Email :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox22" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Tính năng đặt biệt :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                2G band</td>
            <td class="style7">
                <asp:TextBox ID="TextBox23" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Camera :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                3G band :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox24" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Video Call</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Multil Simcard:</td>
            <td class="style7">
                <asp:RadioButtonList ID="RadioButtonList12" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Recorder Camera :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                GPRS :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox25" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Sub Camera :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                EDGE :</td>
            <td class="style7">
                <asp:RadioButtonList ID="RadioButtonList13" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Video Player :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox49" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                3G :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox26" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Music Player :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Wifi :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox27" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                FM :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Browser :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox28" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                TV :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox8" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                GPS :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox29" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Recorder :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Bluetooth :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox30" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Calling Recorder :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Ultraed :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox31" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                FM Recorder :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList6" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                USB :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox32" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Java :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList7" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Resolution :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox33" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Game :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                SizeScreen :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox34" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                TVConnection :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList8" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Sensor :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox35" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Office Appplication :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox10" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                OS :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox36" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Other Appplication :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox11" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Style :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox37" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Screen :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox12" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Qwerty Keyboard:</td>
            <td class="style7">
                <asp:TextBox ID="TextBox38" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Ringtone :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox13" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Size :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox39" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Download Ringtone :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList9" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Weight</td>
            <td class="style7">
                <asp:TextBox ID="TextBox40" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Speaker Phone :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList10" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Warranty:</td>
            <td class="style7">
                <asp:TextBox ID="TextBox41" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Vibrate :</td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList11" runat="server">
                    <asp:ListItem Selected="True">Có</asp:ListItem>
                    <asp:ListItem>Không</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                Laguage :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox42" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Jack Phone :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox14" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Battery :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox43" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Internal Store :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox15" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Capability Battery :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox44" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Ram :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox16" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Calling Time</td>
            <td class="style7">
                <asp:TextBox ID="TextBox45" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                CPU :</td>
            <td class="style4">
                <asp:TextBox ID="TextBox17" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Waitting Time :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox46" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Memory Card:</td>
            <td class="style4">
                <asp:TextBox ID="TextBox18" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style6">
                Standar Box :</td>
            <td class="style7">
                <asp:TextBox ID="TextBox47" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td align="center" class="style4">
                <asp:Button ID="btnThem" runat="server" Height="26px" Text="Thêm" 
                    Width="64px" />
            </td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        </table>
                <asp:GridView ID="GridPhone" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
        GridLines="None" ShowFooter="True">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Apps/Delete.jpg" 
                            ShowDeleteButton="True" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" 
                            SortExpression="ID" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="ProducerID" HeaderText="ProducerID" 
                            SortExpression="ProducerID" />
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                        <asp:BoundField DataField="Price" HeaderText="Price" 
                            SortExpression="Price" />
                        <asp:BoundField DataField="SpecialFeature" HeaderText="SpecialFeature" 
                            SortExpression="SpecialFeature" />
                        <asp:BoundField DataField="Camera" HeaderText="Camera" 
                            SortExpression="Camera" />
                        <asp:BoundField DataField="VideoCall" HeaderText="VideoCall" 
                            SortExpression="VideoCall" />
                        <asp:BoundField DataField="RecorderCamera" HeaderText="RecorderCamera" 
                            SortExpression="RecorderCamera" />
                        <asp:BoundField DataField="SubCamera" HeaderText="SubCamera" 
                            SortExpression="SubCamera" />
                        <asp:BoundField DataField="VideoPlayer" HeaderText="VideoPlayer" 
                            SortExpression="VideoPlayer" />
                        <asp:BoundField DataField="MusicPlayer" HeaderText="MusicPlayer" 
                            SortExpression="MusicPlayer" />
                        <asp:BoundField DataField="FM" HeaderText="FM" 
                            SortExpression="FM" />
                        <asp:BoundField DataField="TV" HeaderText="TV" 
                            SortExpression="TV" />
                        <asp:BoundField DataField="Recorder" HeaderText="Recorder" 
                            SortExpression="Recorder" />
                        <asp:BoundField DataField="CallingRecorder" HeaderText="CallingRecorder" 
                            SortExpression="CallingRecorder" />
                        <asp:BoundField DataField="FMRecorder" HeaderText="FMRecorder" 
                            SortExpression="FMRecorder" />
                        <asp:BoundField DataField="Java" HeaderText="Java" 
                            SortExpression="Java" />
                        <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                        <asp:BoundField DataField="TVConnection" HeaderText="TVConnection" 
                            SortExpression="TVConnection" />
                        <asp:BoundField DataField="OfficeApps" HeaderText="OfficeApps" 
                            SortExpression="OfficeApps" />
                        <asp:BoundField DataField="OtherApp" HeaderText="OtherApp" 
                            SortExpression="OtherApp" />
                        <asp:BoundField DataField="Screen" HeaderText="Screen" 
                            SortExpression="Screen" />
                        <asp:BoundField DataField="Ringtone" HeaderText="Ringtone" 
                            SortExpression="Ringtone" />
                        <asp:BoundField DataField="DownloadRingtone" HeaderText="DownloadRingtone" 
                            SortExpression="DownloadRingtone" />
                        <asp:BoundField DataField="SpeakerPhone" HeaderText="SpeakerPhone" 
                            SortExpression="SpeakerPhone" />
                        <asp:BoundField DataField="Vibrate" HeaderText="Vibrate" 
                            SortExpression="Vibrate" />
                        <asp:BoundField DataField="JackPhone" HeaderText="JackPhone" 
                            SortExpression="JackPhone" />
                        <asp:BoundField DataField="InternalStore" HeaderText="InternalStore" 
                            SortExpression="InternalStore" />
                        <asp:BoundField DataField="Ram" HeaderText="Ram" SortExpression="Ram" />
                        <asp:BoundField DataField="CPU" HeaderText="CPU" SortExpression="CPU" />
                        <asp:BoundField DataField="MemoryCard" HeaderText="MemoryCard" 
                            SortExpression="MemoryCard" />
                        <asp:BoundField DataField="MaximumMemoryCapacity" 
                            HeaderText="MaximumMemoryCapacity" SortExpression="MaximumMemoryCapacity" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" 
                            SortExpression="Contact" />
                        <asp:BoundField DataField="Message" HeaderText="Message" 
                            SortExpression="Message" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="2Gband" HeaderText="2Gband" 
                            SortExpression="2Gband" />
                        <asp:BoundField DataField="3Gband" HeaderText="3Gband" 
                            SortExpression="3Gband" />
                        <asp:BoundField DataField="MutilSimcard" HeaderText="MutilSimcard" 
                            SortExpression="MutilSimcard" />
                        <asp:BoundField DataField="GPRS" HeaderText="GPRS" SortExpression="GPRS" />
                        <asp:BoundField DataField="EDGE" HeaderText="EDGE" SortExpression="EDGE" />
                        <asp:BoundField DataField="3G" HeaderText="3G" SortExpression="3G" />
                        <asp:BoundField DataField="Wifi" HeaderText="Wifi" SortExpression="Wifi" />
                        <asp:BoundField DataField="Browser" HeaderText="Browser" 
                            SortExpression="Browser" />
                        <asp:BoundField DataField="GPS" HeaderText="GPS" SortExpression="GPS" />
                        <asp:BoundField DataField="Bluetooth" HeaderText="Bluetooth" 
                            SortExpression="Bluetooth" />
                        <asp:BoundField DataField="Ultrared" HeaderText="Ultrared" 
                            SortExpression="Ultrared" />
                        <asp:BoundField DataField="USB" HeaderText="USB" SortExpression="USB" />
                        <asp:BoundField DataField="Resolution" HeaderText="Resolution" 
                            SortExpression="Resolution" />
                        <asp:BoundField DataField="SizeScreen" HeaderText="SizeScreen" 
                            SortExpression="SizeScreen" />
                        <asp:BoundField DataField="Sensor" HeaderText="Sensor" 
                            SortExpression="Sensor" />
                        <asp:BoundField DataField="OS" HeaderText="OS" SortExpression="OS" />
                        <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style" />
                        <asp:BoundField DataField="QwertyKeyboard" HeaderText="QwertyKeyboard" 
                            SortExpression="QwertyKeyboard" />
                        <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" 
                            SortExpression="Weight" />
                        <asp:BoundField DataField="Warranty" HeaderText="Warranty" 
                            SortExpression="Warranty" />
                        <asp:BoundField DataField="Language" HeaderText="Language" 
                            SortExpression="Language" />
                        <asp:BoundField DataField="Battery" HeaderText="Battery" 
                            SortExpression="Battery" />
                        <asp:BoundField DataField="CapabilityBattery" HeaderText="CapabilityBattery" 
                            SortExpression="CapabilityBattery" />
                        <asp:BoundField DataField="CallingTime" HeaderText="CallingTime" 
                            SortExpression="CallingTime" />
                        <asp:BoundField DataField="WaittingTime" HeaderText="WaittingTime" 
                            SortExpression="WaittingTime" />
                        <asp:BoundField DataField="StandarBox" HeaderText="StandarBox" 
                            SortExpression="StandarBox" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                    SelectCommand="SELECT * FROM [Phone]" 
        DeleteCommand="DELETE FROM Phone WHERE (ID = @ID)">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
