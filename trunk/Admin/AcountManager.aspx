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
              
            <table width=100%>
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="Label11" runat="server" Text="Tài khoản : "></asp:Label>
                                <asp:TextBox ID="txt_Username_Search" runat="server" BorderStyle="None" 
                                    CssClass="styleText" Width="200px"></asp:TextBox>
&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="Họ và tên : "></asp:Label>
&nbsp;<asp:TextBox ID="txt_Fullname_Search" runat="server" BorderStyle="None" 
                                    CssClass="styleText" Width="200px"></asp:TextBox>
&nbsp;&nbsp;
                                <asp:Label ID="Label13" runat="server" Text="Phân quyền : "></asp:Label>
        <asp:DropDownList ID="ddl_Decentralize_Search" runat="server" CssClass="styleText" >
            <asp:ListItem>Tất cả</asp:ListItem>
            <asp:ListItem>Administrator</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>Client</asp:ListItem>
        </asp:DropDownList>
                &nbsp;&nbsp;
                                <asp:ImageButton ID="btn_Search" runat="server" CssClass="styleButtonAdd" 
                                    Height="20px" ImageUrl="~/Images/Apps/search.png" Width="20px" 
                                    onclick="btn_Search_Click" />
                                <br />
                                <br />
                                <asp:Label ID="lb_Note" runat="server"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
    
                    <asp:GridView CssClass=styleGrid ID="grid_Users" runat="server" AutoGenerateColumns="False" 
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
                            <asp:TemplateField HeaderText="Tài khoản" SortExpression="Username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Username_Update" runat="server" 
                                        Text='<%# Eval("Username") %>' Enabled="False"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Mật khẩu" />
                            <asp:BoundField DataField="FullName" HeaderText="Họ và tên" 
                                SortExpression="FullName"  >
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="BirthDay" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="BirthDay" HtmlEncode="False" SortExpression="BirthDay" />--%>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                            <ItemStyle Width="20px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ngày sinh" > 
                            <EditItemTemplate> 
                              <asp:TextBox ID="Birthday" runat="server"  
                                    Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>' /> 
                                <asp:MaskedEditExtender ID="Birthday_MaskedEditExtender" runat="server" 
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    Mask="99/99/9999" MaskType="Date" oninvalidcssclass="error" 
                                    TargetControlID="Birthday">
                                </asp:MaskedEditExtender>
                                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="Birthday" runat="server"></asp:CalendarExtender>
                                <asp:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                                    ControlExtender="Birthday_MaskedEditExtender" ControlToValidate="Birthday" 
                                    IsValidEmpty="False" 
                                    ToolTip="Vui lòng điền đúng định dạng ngày tháng MM/dd/yyyy"></asp:MaskedEditValidator>
                            </EditItemTemplate> 
                            <ItemTemplate> 
                              <asp:Label ID="lbBirthDay" runat="server" 
                                    Text='<%# Eval("BirthDay","{0:MM/dd/yyyy}") %>' 
                                    DataFormatString="{0:dd/mm/yyyy}"></asp:Label> 
                            </ItemTemplate> 
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Điện thoại" SortExpression="Tel">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Tel" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txt_Tel_FilteredTextBoxExtender" 
                                        runat="server" Enabled="True" FilterType="Custom, Numbers" InvalidChars="." 
                                        TargetControlID="txt_Tel">
                                    </asp:FilteredTextBoxExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Address" HeaderText="Địa chỉ" 
                                SortExpression="Address" >
                            <ItemStyle Width="10px" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Decentralize" HeaderText="Decentralize" 
                                SortExpression="Decentralize" />--%>
                            <asp:TemplateField HeaderText="Số chứng minh" SortExpression="IDCard">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_IDCard" runat="server" Text='<%# Bind("IDCard") %>'></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txt_IDCard_FilteredTextBoxExtender" 
                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txt_IDCard">
                                    </asp:FilteredTextBoxExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txt_IDCard" Display="Dynamic" 
                                        ErrorMessage="Ô này không được để trống"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IDCard") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phân quyền" SortExpression="Decentralize"> 
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
                                ShowDeleteButton="True" CancelText="" DeleteText="Xóa" >
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