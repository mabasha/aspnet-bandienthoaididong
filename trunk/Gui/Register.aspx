<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Gui_Register" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Admin/AdminSite/Template/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../Admin/AdminSite/Template/jquery.validate.js" type="text/javascript"></script>
    <script src="../Admin/AdminSite/Template/jquery.validate.min.js" type="text/javascript"></script>

    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 277px;
        }
        .style5
        {
        }
        select, input, textarea, button {outline:none; resize:none;
	height: 26px;
}
        .style7
        {
            width: 162px;
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
                        required: true
                    },
                    <%=txt_Tel.UniqueID %>: {                       
                        required: true
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

   <form id="aspnetForm">
    
    <table class="style2">
    
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
            <td align="char" class="style7" valign="bottom">
                Username :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Username" runat="server" Width="200px" 
                    style="margin-left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Password" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Confirm Password :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmPassword" runat="server" Width="200px" 
                    TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Fullname :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Fullname" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Email Address :</td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Email" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Confirm Email Address :
            </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_ConfirmEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                BirthDay :
            </td>
            <td class="style3" valign="middle">
                    <asp:TextBox ID="txt_BirthDay" runat="server" Width="200px" ></asp:TextBox>
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
                        IsValidEmpty="False"></asp:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Tel : </td>
            <td class="style3" valign="middle">
        <asp:TextBox ID="txt_Tel" runat="server" Width="200px" CssClass="styleText"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_Tel_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Custom, Numbers" InvalidChars="." 
                        TargetControlID="txt_Tel">
                    </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                Address : </td>
            <td class="style3" valign="middle">
                <asp:TextBox ID="txt_Address" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="char" class="style7" valign="bottom">
                IDcard : </td>
            <td class="style3" valign="middle">
        <asp:TextBox ID="txt_IDCard" runat="server" Width="200px" CssClass="styleText"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_IDCard_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_IDCard">
                    </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td align="char" class="style5" valign="bottom" colspan="2">
                       Vui lòng điền đúng chuỗi kí tự ở hình bên trên :
                <asp:UpdatePanel runat="server" ID="updatepanel1">
                   <ContentTemplate>
                <br />
                       <asp:Image ID="captchaImage" runat="server" />
                       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Apps/update.jpg"
                           OnClick="ImageButton1_Click" ToolTip="Đổi Captcha" />
                   <br />
                 </ContentTemplate>
                </asp:UpdatePanel>
                <asp:TextBox ID="txt_Captcha" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="bottom">
                <asp:Button ID="btn_Register" runat="server" Text="Đăng kí" 
                    onclick="btn_Register_Click" />
            </td>
        </tr>
        
    </table>
    
    </form>
</asp:Content>

