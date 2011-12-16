<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/Frame.master" AutoEventWireup="true" CodeFile="Redirect.aspx.cs" Inherits="Gui_Redirect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        function delayer() {
            window.location = "../Gui/HomePage.aspx";
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cMain" Runat="Server">
    <table class="style2">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lb_Note" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

