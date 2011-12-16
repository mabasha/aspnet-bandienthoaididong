<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.master" CodeFile="AcountManager.aspx.cs" Inherits="Admin_AcountManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Admin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width=100%>
            <tr>
                <td align=center>
                    <div class="style">DANH SÁCH USERS</div>      
                </td>
            </tr>
        </table>
         <br />
              
            <table>
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="lb_Note" runat="server"></asp:Label>
                            </td>
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
                            <asp:TemplateField HeaderText="Username" SortExpression="Username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Username_Update" runat="server" 
                                        Text='<%# Eval("Username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Password" HeaderText="Password" 
                                SortExpression="Password" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" 
                                SortExpression="FullName"  />
                            <%--<asp:BoundField DataField="BirthDay" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="BirthDay" HtmlEncode="False" SortExpression="BirthDay" />--%>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:TemplateField HeaderText="BirthDay" > 
                            <EditItemTemplate> 
                              <asp:TextBox ID="Birthday" runat="server"  
                                    Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>' /> 
                                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="Birthday" runat="server"></asp:CalendarExtender>
                            </EditItemTemplate> 
                            <ItemTemplate> 
                              <asp:Label ID="lbBirthDay" runat="server" 
                                    Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>' 
                                    DataFormatString="{0:dd/mm/yyyy}"></asp:Label> 
                            </ItemTemplate> 
                            </asp:TemplateField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:BoundField DataField="IDCard" HeaderText="IDCard" 
                                SortExpression="IDCard" />
                            <%--<asp:BoundField DataField="Decentralize" HeaderText="Decentralize" 
                                SortExpression="Decentralize" />--%>
                            <asp:TemplateField HeaderText="Decentralize"> 
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
                        <%--<SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />--%>
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