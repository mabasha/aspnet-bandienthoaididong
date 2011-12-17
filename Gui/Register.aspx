<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Gui_Register" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        }
        .style5
        {
            width: 282px;
        }
    </style>
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
                    },
                    <%=txt_Captcha.UniqueID %>:{
                        required: true
                    }
                }, messages: {
                    
                }
            });
        });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
  
    <table class="style2">
    <form id="aspnetForm">
        <tr>
            <td colspan="2" valign="bottom">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                Vui lòng nhập username, password và một số thông tin cần thiết khác vào form bên 
                dưới :
                <br />
                <asp:Label ID="lb_Note" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Username :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Username" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Password" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Confirm Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmPassword" runat="server" Width="200px" 
                    TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Fullname :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Fullname" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Email Address :</td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Email" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Confirm Email Address :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                BirthDay :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_BirthDay" runat="server" Width="200px"></asp:TextBox>
                <asp:CalendarExtender ID="txt_BirthDay_CalendarExtender" runat="server" 
                    TargetControlID="txt_BirthDay">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Tel : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Tel" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                Address : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Address" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom">
                IDcard : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_IDCard" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5" valign="bottom">
                <br />
                       Vui lòng điền đúng chuỗi kí tự ở hình bên trên :
            </td>
            <td class="style4" valign="bottom">
                <asp:UpdatePanel runat="server" ID="updatepanelcaptcha">
                   <ContentTemplate>
                       <asp:Image ID="captchaImage" runat="server" />
                       &nbsp;
                       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Apps/update.jpg"
                           OnClick="ImageButton1_Click" ToolTip="Đổi Captcha" />
                   </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:TextBox ID="txt_Captcha" runat="server" Width="200px"></asp:TextBox>
            </td>
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

