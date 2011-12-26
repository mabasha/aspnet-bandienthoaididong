<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="ProfileUser.aspx.cs" Inherits="Gui_ProfileUser" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

      
        



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <asp:Label ID="lb_Note" runat="server"></asp:Label>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:DetailsView CssClass="styleProducerList" ID="dtviews_User" 
    runat="server" AutoGenerateRows="False" style="margin-top:14px" Height="50px" onitemcommand="dtviews_User_ItemCommand" 
        onitemupdating="dtviews_User_ItemUpdating" 
        onmodechanging="dtviews_User_ModeChanging" DataKeyNames="Username" 
        Width="95%" Font-Names="TimesNewRoman" CellPadding="4" 
    ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle Font-Bold="True" Width="120px" BackColor="#DEE8F5" />
        <Fields>
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/Apps/delete.png" 
                CancelText="Hủy bỏ" EditImageUrl="~/Images/Apps/edit.png" EditText="Chỉnh sửa" 
                ShowEditButton="True" UpdateImageUrl="~/Images/Apps/update.jpg" 
                UpdateText="Cập nhật" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lb_Note0" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username :">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_Password" Display="Dynamic" 
                        ErrorMessage="Ô này không được bỏ trống"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Fullname" HeaderText="Fullname :" />
            <asp:BoundField DataField="Email" HeaderText="Email :" />
            <asp:TemplateField HeaderText="BirthDay :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_BirthDay" runat="server" Width="200px" 
                        Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                    <asp:MaskedEditExtender ID="txt_BirthDay_MaskedEditExtender" runat="server" 
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="txt_BirthDay">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txt_BirthDay_CalendarExtender" runat="server" 
                        TargetControlID="txt_BirthDay">
                    </asp:CalendarExtender>
                    <asp:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                        ControlExtender="txt_BirthDay_MaskedEditExtender" 
                        ControlToValidate="txt_BirthDay" Display="Dynamic" 
                        ErrorMessage="Vui lòng điền đúng định dạng MM/dd/yyyy" 
                        InvalidValueMessage="Vui lòng điền đúng định dạng MM/dd/yyyy" 
                        IsValidEmpty="False" ToolTip="Vui lòng điền đúng định dạng MM/dd/yyyy" 
                        TooltipMessage="Vui lòng điền đúng định dạng MM/dd/yyyy"></asp:MaskedEditValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tel :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Tel" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_Tel_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" InvalidChars="." 
                        TargetControlID="txt_Tel">
                    </asp:FilteredTextBoxExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Address" runat="server" Text='<%# Eval("Address") %>' 
                        TextMode="MultiLine" Width="200px" Height="50px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_Address" ErrorMessage="Ô này không được để trống"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IDCard :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_IDCard" runat="server" Text='<%# Bind("IDCard") %>'></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_IDCard_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_IDCard">
                    </asp:FilteredTextBoxExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("IDCard") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Decentralize :">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Decentralize") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Decentralize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Width="100px" BackColor="#507CD1" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
</asp:Content>

