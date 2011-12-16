<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Gui_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 401px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function() {
            $("#aspnetForm").validate({
                rules: {
                    <%=txt_Username.UniqueID %>: {
                        minlength: 2,
                        required: true
                    },
                    <%=txt_Password.UniqueID %>: {
                        minlength: 6,
                        required: true
                    }
                }, messages: {}
            });
        });
    </script>
    <table class="style2" width="400">
    <form id="aspnetForm">
        <tr>
            <td colspan="2">
                Vui lòng đăng nhập :
                <br />
                <asp:Label ID="lb_Note" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="70">
                Username : 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt_Username" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="70">
                Password :
            </td>
            <td class="style3">
                <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:CheckBox ID="cb_Remember" runat="server" Text="Remember Me?" />
                <br />
                <asp:Button ID="btn_Login" runat="server" onclick="btn_Login_Click" 
                    style="text-align: left" Text="Đăng nhập" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="../Admin/RecoveryPassword.aspx ">Quên mật khẩu</asp:HyperLink>
            </td>
        </tr>
        </form>
    </table>
</asp:Content>

