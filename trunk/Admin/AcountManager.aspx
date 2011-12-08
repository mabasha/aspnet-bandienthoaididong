<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="AcountManager.aspx.cs" Inherits="Admin_AcountManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head runat=server>
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#form1").validate({
                rules: {
                    txt_Username: {
                        minlength: 5,
                        required: true
                    },
                    txt_Password: {
                        minlength: 6,
                        required: true
                    },
                    txt_Fullname: {                       
                        required: true,
                        //email:true
                        //minlenght: 5
                    },
                    txt_Email: {                       
                        required: true,
                        email:true
                    },
                    txt_BirthDay: {                       
                        required: true,
                    },
                    txt_Tel: {                       
                        required: true,
                    },
                    txt_Address: {
                        required: true
                    },
                    txt_IDCard: {
                        required: true,
                        number: true
                    }
                }, messages: {}
            });
        });
    </script>
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            text-align: left;
        }
        .style4
        {
            width: 449px;
        }
        .style5
        {
            width: 92px;
        }
    </style>
    
</head>
    
        <table width=100%>
            <tr>
                <td align=center>
                    <div class="style">DANH SÁCH USERS</div>      
                </td>
            </tr>
        </table>
         <br />
         <table width=100% >
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label1" runat="server" Text="Username :" ></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Username" runat="server" style="text-align: left" 
                                Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label3" runat="server" Text="Fullname :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Fullname" runat="server" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label9" runat="server" Text="Email :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txt_Email" runat="server" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label4" runat="server" Text="BirthDay :&nbsp;&nbsp;"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txt_BirthDay" runat="server" Width="50%" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txt_BirthDay" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label5" runat="server" Text="Tel :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Tel" runat="server" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label6" runat="server" Text="Address :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Address" runat="server" Width="70%" TextMode="MultiLine" 
                                Height="50px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label7" runat="server" Text="IDCard :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_IDCard" runat="server" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label8" runat="server" Text="Decentralize :" Width="100%"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:DropDownList ID="ddl_Decentralize" runat="server" >
                                <asp:ListItem>Administrator</asp:ListItem>
                                <asp:ListItem>Employee</asp:ListItem>
                                <asp:ListItem>Client</asp:ListItem>
                            </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="text-align: center">
                            <asp:Button ID="btn_Add" runat="server" Text="Add" onclick="btn_Add_Click" />
                                    </td>
                                </tr>
                            <tr>
                                <td>
                            <asp:Label ID="lb_Note" runat="server" ForeColor="#33CC33" Font-Bold="True" 
                                Font-Size="15pt"></asp:Label>
                                </td>
                             </tr>
            </table>
            <table>
                        <tr>
                            <td style="text-align: center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
    
                    <asp:GridView ID="grid_Users" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="Username" 
                        EnableModelValidation="True" ForeColor="#333333" 
                        onrowdatabound="grid_Users_RowDataBound" Width="100%" 
                        onrowediting="grid_Users_RowEditing" 
                        onrowupdating="grid_Users_RowUpdating" 
                        onrowdeleting="grid_Users_RowDeleting" 
                        onrowcancelingedit="grid_Users_RowCancelingEdit" AllowPaging="True" 
                        onpageindexchanging="grid_Users_PageIndexChanging" PageSize="15" 
                        AllowSorting="True" onsorting="grid_Users_Sorting" 
                        DataSourceID="">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" 
                                SortExpression="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" 
                                SortExpression="Password" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" 
                                SortExpression="FullName"  />
                            <%--<asp:BoundField DataField="BirthDay" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="BirthDay" HtmlEncode="False" SortExpression="BirthDay" />--%>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:TemplateField HeaderText="BirthDay" > 
                            <EditItemTemplate> 
                              <asp:TextBox ID="Birthday" runat="server"  Text='<%# Eval("BirthDay","{0:dd/mm/yyyy}") %>' /> 
                                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="Birthday" runat="server"></asp:CalendarExtender>
                            </EditItemTemplate> 
                            <ItemTemplate> 
                              <asp:Label ID="lbBirthDay" runat="server" Text='<%# Eval("BirthDay","{0:dd/mm/yyyy}") %>' DataFormatString="{0:dd/mm/yyyy}"></asp:Label> 
                            </ItemTemplate> 
                            </asp:TemplateField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:BoundField DataField="IDCard" HeaderText="IDCard" 
                                SortExpression="IDCard" />
                            <%--<asp:BoundField DataField="Decentralize" HeaderText="Decentralize" 
                                SortExpression="Decentralize" />--%>
                            <asp:TemplateField HeaderText="Gender"> 
                            <%--<FooterTemplate> 
                              <asp:DropDownList ID="cmbNewDecentralize" runat="server" >
                                <asp:ListItem Text="Adminitrator" Value="Adminitrator"></asp:ListItem> 
                                <asp:ListItem Selected="True"  Text="User" Value="User"></asp:ListItem> </asp:DropDownList> 
                            </FooterTemplate> --%>
                            <ItemTemplate> 
                              <asp:Label ID="lbDecentralize" runat="server" Text='<%# Eval("Decentralize") %>'></asp:Label> 
                            </ItemTemplate> 
                            <EditItemTemplate> 
                              <asp:DropDownList ID="cmbDecentralize" runat="server"  SelectedValue='<%# Eval("Decentralize") %>'> 
                                <asp:ListItem Value="Administrator" Text="Administrator"></asp:ListItem>
                                <asp:ListItem Selected="True" Value="Employee" Text="Employee"></asp:ListItem>
                                <asp:ListItem Value="Client" Text="Client"></asp:ListItem>
                              </asp:DropDownList> 
                            </EditItemTemplate> 
                            </asp:TemplateField> 
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:CommandField ButtonType="Button" DeleteImageUrl="~/Images/Apps/delete.png" 
                                ShowDeleteButton="True" >
                            <HeaderStyle VerticalAlign="Middle" />
                            </asp:CommandField>
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="13pt" 
                            ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_User" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                        SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
 
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
 
                    <br />
                </td>
            </tr>
        </table>
  
    </asp:Content>