<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportPhone.aspx.cs" Inherits="Admin_ImportPhone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 84%;
            height: 190px;
        }
        .style2
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td align="center" colspan="2">
                CẬP NHẬT ĐIỆN THOẠI</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Mã điện thoại :</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Tên điện thoại :</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Nhà sản xuất :</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Giá tiền:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Tính năng đặt biệt :</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Camera :</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Recorder Camera :</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Sub Camera :</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Video Player :</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Music Player :</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                FM :</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                TV :</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Recorder :</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Calling Recorder :</td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                FM Recorder :</td>
            <td>
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Java :</td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Game :</td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                TVConnection :</td>
            <td>
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                OfficeApps :</td>
            <td>
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Sensor :</td>
            <td>
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                OS :</td>
            <td>
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Style :</td>
            <td>
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                QwertyKeyboard :</td>
            <td>
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Size :</td>
            <td>
                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Weight :</td>
            <td>
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Warranty :</td>
            <td>
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Language :</td>
            <td>
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Battery :</td>
            <td>
                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                CapabilityBattery :</td>
            <td>
                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                CallingTime :</td>
            <td>
                <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                WattingTime :</td>
            <td>
                <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnThem" runat="server" Height="26px" Text="Thêm" 
                    Width="64px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="GridPhone" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="ProducerID" HeaderText="ProducerID" 
                            SortExpression="ProducerID" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="SpecialFeature" HeaderText="SpecialFeature" 
                            SortExpression="SpecialFeature" />
                        <asp:BoundField DataField="Camera" HeaderText="Camera" 
                            SortExpression="Camera" />
                        <asp:CheckBoxField DataField="VideoCall" HeaderText="VideoCall" 
                            SortExpression="VideoCall" />
                        <asp:BoundField DataField="RecorderCamera" HeaderText="RecorderCamera" 
                            SortExpression="RecorderCamera" />
                        <asp:CheckBoxField DataField="SubCamera" HeaderText="SubCamera" 
                            SortExpression="SubCamera" />
                        <asp:BoundField DataField="VideoPlayer" HeaderText="VideoPlayer" 
                            SortExpression="VideoPlayer" />
                        <asp:BoundField DataField="MusicPlayer" HeaderText="MusicPlayer" 
                            SortExpression="MusicPlayer" />
                        <asp:BoundField DataField="FM" HeaderText="FM" SortExpression="FM" />
                        <asp:BoundField DataField="TV" HeaderText="TV" SortExpression="TV" />
                        <asp:CheckBoxField DataField="Recorder" HeaderText="Recorder" 
                            SortExpression="Recorder" />
                        <asp:CheckBoxField DataField="CallingRecorder" HeaderText="CallingRecorder" 
                            SortExpression="CallingRecorder" />
                        <asp:CheckBoxField DataField="FMRecorder" HeaderText="FMRecorder" 
                            SortExpression="FMRecorder" />
                        <asp:CheckBoxField DataField="Java" HeaderText="Java" SortExpression="Java" />
                        <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                        <asp:BoundField DataField="TVConnection" HeaderText="TVConnection" 
                            SortExpression="TVConnection" />
                        <asp:BoundField DataField="OfficeApps" HeaderText="OfficeApps" 
                            SortExpression="OfficeApps" />
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
                        <asp:BoundField DataField="WattingTime" HeaderText="WattingTime" 
                            SortExpression="WattingTime" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                    SelectCommand="SELECT * FROM [Phone]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
