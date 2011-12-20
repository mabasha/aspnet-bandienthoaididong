<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="RecoveryPassword.aspx.cs" Inherits="Gui_RecoveryPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <asp:Label ID="lb_Note" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" 
        Text="Vui lòng nhập tên tài khoản của bạn : "></asp:Label>
    <asp:TextBox ID="txt_Username" runat="server" Width="200px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txt_Username" Display="Dynamic" 
        ErrorMessage="Ô này không được bỏ trống"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="btn_Ok" runat="server" onclick="btn_Ok_Click" Text="Đồng ý" />
&nbsp;
    <asp:Button ID="btn_Cancel" runat="server" onclick="btn_Cancel_Click" 
        Text="Hủy bỏ" />
    <br />
</asp:Content>

