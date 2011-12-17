<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ProfileUser.aspx.cs" Inherits="Admin_ProfileUser" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Label ID="lb_Note" runat="server"></asp:Label>
    <asp:DetailsView ID="dtviews_User" runat="server" AutoGenerateRows="False" 
        BorderStyle="None" Height="50px" onitemcommand="dtviews_User_ItemCommand" 
        onitemupdating="dtviews_User_ItemUpdating" 
        onmodechanging="dtviews_User_ModeChanging" DataKeyNames="Username" 
        Width="500px" Font-Names="TimesNewRoman">
        <FieldHeaderStyle Font-Bold="True" ForeColor="#666633" Width="120px" />
        <Fields>
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/Apps/delete.png" 
                CancelText="Hủy bỏ" EditImageUrl="~/Images/Apps/edit.png" EditText="Chỉnh sửa" 
                ShowEditButton="True" UpdateImageUrl="~/Images/Apps/update.jpg" 
                UpdateText="Cập nhật" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lb_Note" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username :">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
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
                    <asp:CalendarExtender ID="txt_BirthDay_CalendarExtender" runat="server" 
                        TargetControlID="txt_BirthDay">
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_BirthDay" Display="Dynamic" 
                        ErrorMessage="Ô này không được để trống"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Tel" HeaderText="Tel :" />
            <asp:TemplateField HeaderText="Address :">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Address" runat="server" Text='<%# Eval("Address") %>' 
                        TextMode="MultiLine" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_Address" ErrorMessage="Ô này không được để trống"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IDCard" HeaderText="IDCard :" />
            <asp:TemplateField HeaderText="Decentralize :">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Decentralize") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Decentralize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle Width="100px" />
    </asp:DetailsView>
</asp:Content>

