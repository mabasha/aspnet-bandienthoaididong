<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Gui_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
               .styleLogin
            {
                margin-top:20px;
                width: 95%;
                background-color: #FFFFFF;
                -moz-border-radius:5px;
                -webkit-border-radius:5px;
                 box-shadow: 0px 0px 0px 0px #818181;
    -webkit-box-shadow: 0px 0px 1px 1px #818181;
    -moz-box-shadow: 1px 1px 1px 1px #818181;
                background: -moz-linear-gradient(bottom, #E1E1E1, #ffffff);
    background: -webkit-gradient(linear, center bottom, center top, from(#E1E1E1), to(#ffffff));
    
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
                        required: true
                    }
                }, messages: {}
            });
        });
    </script>
    <table class="styleLogin" width="400">
    <form id="aspnetForm">
        <tr>
            <td colspan="2">
                Vui lòng đăng nhập :
                <br />
                <asp:Label ID="lb_Note" runat="server" ForeColor="Red"></asp:Label>
            &nbsp;<asp:LinkButton ID="btnl_Actived" runat="server" ForeColor="#3333FF">đây</asp:LinkButton>
&nbsp;<asp:Label ID="lb_Continuous" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="70">
                Tên : 
            </td>
            <td class="style3">
                <asp:TextBox ID="txt_Username" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="70">
                Mật khẩu :
            </td>
            <td class="style3">
                <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:CheckBox ID="cb_Remember" runat="server" Text="Ghi nhớ?" />
                <br />
                <asp:Button ID="btn_Login" runat="server" onclick="btn_Login_Click" 
                    style="text-align: left" Text="Đăng nhập" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="margin-left: 40px">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="../GUI/RecoveryPassword.aspx" ForeColor="#3366FF">Quên mật khẩu</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Gui/Register.aspx" 
                    ForeColor="#3366FF">Đăng ký mới</asp:HyperLink>
            </td>
        </tr>
        </form>
    </table>
</asp:Content>

