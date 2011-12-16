<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddAccount.aspx.cs" Inherits="Admin_AddAccount" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width=100% >
         <form id="aspnetForm">
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label1" runat="server" Text="Username :" ></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Username" runat="server" style="text-align: left" 
            Width="400px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="400px" 
                        CssClass="styleText" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label3" runat="server" Text="Fullname :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_Fullname" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label9" runat="server" Text="Email :"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_Email" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label4" runat="server" Text="BirthDay :&nbsp;&nbsp;"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_BirthDay" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None" ></asp:TextBox>
                    <asp:CalendarExtender ID="txt_BirthDay_CalendarExtender" runat="server" 
                        TargetControlID="txt_BirthDay">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style5" style="height: 8px" width="100">
                    <asp:Label ID="Label5" runat="server" Text="Tel :"></asp:Label>
                </td>
                <td class="style4" style="height: 8px">
        <asp:TextBox ID="txt_Tel" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label6" runat="server" Text="Address :"></asp:Label>
                </td>
                <td class="style4" valign="middle" align="left" style="text-align: left">
        <asp:TextBox ID="txt_Address" runat="server" Width="400px" TextMode="MultiLine" 
            Height="50px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label7" runat="server" Text="IDCard :"></asp:Label>
                </td>
                <td class="style4">
        <asp:TextBox ID="txt_IDCard" runat="server" Width="400px" CssClass="styleText" 
                        BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" width="100">
                    <asp:Label ID="Label8" runat="server" Text="Decentralize :" Width="100%"></asp:Label>
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
                <td  colspan=2 rowspan="2" style="text-align: center">
                        <br />
        <asp:Button ID="btn_Add" runat="server" Text="Thêm" onclick="btn_Add_Click" 
                        CssClass="styleButtonAdd" BorderStyle="None" Height="40px" Width="87px" />
                    <br />
        <asp:Label ID="lb_Note" runat="server" ForeColor="#33CC33" Font-Bold="True" 
            Font-Size="15pt" style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr>
            </tr>
        </form>
        </table>
</asp:Content>

