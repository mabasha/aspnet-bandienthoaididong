<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="AcountManager.aspx.cs" Inherits="Admin_AcountManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
<head runat="server">
        $(document).ready(function() {
            $("#form1").validate({
                rules: {
                    <%#txt_Username.UniqueID %>: {
                        minlength: 5,
                        required: true
                    },
                    <%#txt_Password.UniqueID %>: {
                        minlength: 6,
                        required: true
                    },
                    <%#txt_Fullname.ClientID%>: {                       
                        required: true,
                        //email:true
                        //minlenght: 5
                    },
                    <%#txt_Email.ClientID%>: {                       
                        required: true,
                        email:true
                    },
                    <%#txt_BirthDay.ClientID%>: {                       
                        required: true,
                    },
                    <%#txt_Tel.ClientID%>: {                       
                        required: true,
                    },
                    <%#txt_Address.ClientID%>: {
                        required: true
                    },
                    <%#txt_IDCard.ClientID%>: {
                        required: true,
                        number: true
                    }
                }, messages: {}
            });
        });
    </script>
    <title></title>
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
                                Width="50%" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="50%" 
                                            CssClass="styleText" BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label3" runat="server" Text="Fullname :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Fullname" runat="server" Width="50%" CssClass="styleText" 
                                            BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label9" runat="server" Text="Email :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txt_Email" runat="server" Width="50%" CssClass="styleText" 
                                            BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label4" runat="server" Text="BirthDay :&nbsp;&nbsp;"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:TextBox ID="txt_BirthDay" runat="server" Width="50%" CssClass="styleText" 
                                            BorderStyle="None" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txt_BirthDay" runat="server"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label5" runat="server" Text="Tel :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Tel" runat="server" Width="50%" CssClass="styleText" 
                                            BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label6" runat="server" Text="Address :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_Address" runat="server" Width="70%" TextMode="MultiLine" 
                                Height="50px" CssClass="styleText" BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label7" runat="server" Text="IDCard :"></asp:Label>
                                    </td>
                                    <td class="style4">
                            <asp:TextBox ID="txt_IDCard" runat="server" Width="50%" CssClass="styleText" 
                                            BorderStyle="None"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
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
                                    <td  colspan=2>
                                            <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="text-align: center">
                            <asp:Button ID="btn_Add" runat="server" Text="Thêm" onclick="btn_Add_Click" 
                                            CssClass="styleButtonAdd" BorderStyle="None" Height="40px" Width="87px" />
                            <asp:Button ID="btn_Add0" runat="server" Text="Xóa" onclick="btn_Add_Click" 
                                            CssClass="styleButtonCancle" BorderStyle="None" Height="40px" Width="87px" />
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
    
                    <asp:GridView class="styleGrid" ID="grid_Users" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="Username" ForeColor="#333333" 
                        onrowdatabound="grid_Users_RowDataBound" Width="100%" 
                        onrowediting="grid_Users_RowEditing" 
                        onrowupdating="grid_Users_RowUpdating" 
                        onrowdeleting="grid_Users_RowDeleting" 
                        onrowcancelingedit="grid_Users_RowCancelingEdit" AllowPaging="True" 
                        onpageindexchanging="grid_Users_PageIndexChanging" PageSize="15" 
                        AllowSorting="True" onsorting="grid_Users_Sorting" GridLines="None"  >
                        <AlternatingRowStyle BackColor="White" />
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
                            <asp:CommandField ButtonType="Button" DeleteImageUrl="~/Admin/AdminSite/Template/images/error.png" 
                                ShowDeleteButton="True" CancelText="" >
                            <ControlStyle BorderStyle="None" CssClass="styleButtonCancle" />
                            <HeaderStyle VerticalAlign="Middle" />
                            </asp:CommandField>
                            <asp:CommandField ShowEditButton="True" ButtonType="Image" DeleteText="" 
                                EditImageUrl="~/Admin/AdminSite/Template/images/user_edit.png" 
                                CancelImageUrl="~/Admin/AdminSite/Template/images/error.png" 
                                UpdateImageUrl="~/Admin/AdminSite/Template/images/valid.png" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Size="13pt" 
                            ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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