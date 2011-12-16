<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Gui_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 277px;
        }
        .style4
        {
            width: 156px;
        }
    </style>
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.js" type="text/javascript"></script>
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
                    },
                    <%=txt_ConfirmPassword.UniqueID %>: {
                        minlength: 6,
                        required: true,
                        equalTo: "#<%=txt_Password.ClientID %>"
                    },
                    <%=txt_Fullname.UniqueID %>: {                       
                        required: true,
                        //email:true
                        //minlenght: 5
                    },
                    <%=txt_Email.UniqueID %>: {                       
                        required: true,
                        email:true
                    },
                    <%=txt_ConfirmEmail.UniqueID %>: {                       
                        required: true,
                        email:true,
                        equalTo: "#<%=txt_Email.ClientID %>"
                    },
                    <%=txt_BirthDay.UniqueID %>: {                       
                        required: true,
                    },
                    <%=txt_Tel.UniqueID %>: {                       
                        required: true,
                    },
                    <%=txt_Address.UniqueID %>: {
                        required: true
                    },
                    <%=txt_IDCard.UniqueID %>: {
                        required: true,
                        number: true
                    }
                }, messages: {
                    
                }
            });
        });
   </script>
    <table class="style2">
    <form id="aspnetForm">
        <tr>
            <td colspan="2" valign="bottom">
                Vui lòng nhập username, password và một số thông tin cần thiết khác vào form bên 
                dưới :
                <br />
                <asp:Label ID="lb_Note" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Username :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Username" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Password" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Confirm Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmPassword" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Fullname :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Fullname" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Email Address :</td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Email" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Confirm Email Address :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                BirthDay :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_BirthDay" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Tel : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Tel" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                Address : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Address" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style4" valign="bottom" width="150">
                IDcard : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_IDCard" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4" valign="bottom">
                &nbsp;</td>
            <td class="style3" valign="middle">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" valign="bottom">
                <asp:Button ID="btn_Register" runat="server" Text="Đăng kí" 
                    onclick="btn_Register_Click" />
            </td>
        </tr>
        </form>
    </table>
</asp:Content>

