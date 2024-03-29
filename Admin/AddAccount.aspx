﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddAccount.aspx.cs" Inherits="Admin_AddAccount" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 137px;
        }
        .style2
        {
            height: 8px;
            width: 137px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <%=txt_Fullname.UniqueID %>: {                       
                        required: true,
                        //email:true
                        //minlenght: 5
                    },
                     <%=txt_Email.UniqueID %>: {                       
                        required: true,
                        email:true
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
                }, messages: {}
            });
        });
    </script>
<form id="aspnetForm">
<table width=100%>
            <tr>
                <td align=center>
                    <div class="style">Thêm tài khoản</div>      
                </td>
            </tr>
        </table>
        <br />
<table width=100% >
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Tài khoản :" ></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Username" runat="server" style="text-align: left" 
            Width="400px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Mật khẩu :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="400px" 
                        CssClass="styleText" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label3" runat="server" Text="Họ và tên :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Fullname" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label9" runat="server" Text="Email :"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_Email" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label4" runat="server" Text="Ngày sinh :&nbsp;&nbsp;"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_BirthDay" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None" ></asp:TextBox>
                    <asp:MaskedEditExtender ID="txt_BirthDay_MaskedEditExtender" runat="server" 
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99/99/9999" MaskType="Date" oninvalidcssclass="error" 
                        TargetControlID="txt_BirthDay">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txt_BirthDay_CalendarExtender" runat="server" 
                        TargetControlID="txt_BirthDay">
                    </asp:CalendarExtender>
                    <asp:MaskedEditValidator ID="MaskedEditValidator1" runat="server"  CssClass="error_date"
                        ControlExtender="txt_BirthDay_MaskedEditExtender" 
                        ControlToValidate="txt_BirthDay" Display="Dynamic" 
                        ErrorMessage="Ngày không đúng định dạng MM/dd/yyyy" 
                        InvalidValueMessage="Ngày không đúng định dạng MM/dd/yyyy"></asp:MaskedEditValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label5" runat="server" Text="Số điện thoại :"></asp:Label>
                </td>
                <td class="style4" style="height: 8px">
        <asp:TextBox ID="txt_Tel" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_Tel_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Custom, Numbers" InvalidChars="." 
                        TargetControlID="txt_Tel">
                    </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label6" runat="server" Text="Địa chỉ :"></asp:Label>
                </td>
                <td class="style4" valign="middle" align="left" style="text-align: left">
        <asp:TextBox ID="txt_Address" runat="server" Width="400px" TextMode="MultiLine" 
            Height="50px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label7" runat="server" Text="Số chứng minh :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_IDCard" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="txt_IDCard_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_IDCard">
                    </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label8" runat="server" Text="Phân quyền :" Width="109%"></asp:Label>
                </td>
                <td class="style4">
        <asp:DropDownList ID="ddl_Decentralize" runat="server" CssClass="styleText" >
            <asp:ListItem>Administrator</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>Client</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td  colspan=2 style="text-align: center">
                        <br />
        <asp:Button ID="btn_Add" runat="server" Text="Thêm" onclick="btn_Add_Click" 
                        CssClass="styleButtonAdd" BorderStyle="None" Height="40px" Width="87px" />
                    <br />
        <asp:Label ID="lb_Note" runat="server" ForeColor="#33CC33" Font-Bold="True" 
            Font-Size="15pt" style="text-align: center"></asp:Label>
                </td>
            </tr>
                    
        </table>
        </form>
</asp:Content>

