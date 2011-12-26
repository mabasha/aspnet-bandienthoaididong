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
                                    CssClass="styleText" Width="150px"></asp:TextBox>
&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="Họ và tên : "></asp:Label>
&nbsp;<asp:TextBox ID="txt_Fullname_Search" runat="server" BorderStyle="None" 
                                    CssClass="styleText" Width="150px"></asp:TextBox>
&nbsp; Email : &nbsp;<asp:TextBox ID="txt_Email_Search" runat="server" CssClass="styleText"></asp:TextBox>
&nbsp;<asp:Label ID="Label13" runat="server" Text="Phân quyền : "></asp:Label>
        <asp:DropDownList ID="ddl_Decentralize_Search" runat="server" CssClass="styleText" >
            <asp:ListItem>Tất cả</asp:ListItem>
            <asp:ListItem>Administrator</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>Client</asp:ListItem>
        </asp:DropDownList>
                &nbsp;&nbsp;
                                Tình trạng :&nbsp;
                                <asp:DropDownList ID="ddl_IsActived_Search" runat="server" CssClass="styleText">
                                    <asp:ListItem>Tất cả</asp:ListItem>
                                    <asp:ListItem Value="1">Đã kích hoạt</asp:ListItem>
                                    <asp:ListItem Value="0">Chưa kích hoạt</asp:ListItem>
                                </asp:DropDownList>
&nbsp;&nbsp;
                                <asp:ImageButton ID="btn_Search" runat="server" CssClass="styleButtonAdd" 
                                    Height="20px" ImageUrl="~/Images/Apps/search.png" Width="20px" 
                                    onclick="btn_Search_Click" />
                                <br />
                                <br />
                                <asp:Label ID="lb_Note" runat="server"></asp:Label>
                                <br />
                                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                </asp:ToolkitScriptManager>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
    
                                <asp:GridView ID="grid_Users" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                    DataKeyNames="Username" ForeColor="#333333" GridLines="None" 
                                    onpageindexchanging="grid_Users_PageIndexChanging1" 
                                    onrowcancelingedit="grid_Users_RowCancelingEdit" 
                                    onrowcommand="grid_Users_RowCommand" onrowdatabound="grid_Users_RowDataBound" 
                                    onrowdeleting="grid_Users_RowDeleting" onrowediting="grid_Users_RowEditing" 
                                    onrowupdating="grid_Users_RowUpdating" onsorting="grid_Users_Sorting">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Tài khoản" SortExpression="Username">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Mật khẩu" />
                                        <asp:BoundField DataField="FullName" HeaderText="Họ và Tên" 
                                            SortExpression="FullName" />
                                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Email" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    Display="Dynamic" 
                                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                    ControlToValidate="txt_Email"></asp:RegularExpressionValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày sinh" SortExpression="BirthDay">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Birthday" runat="server" 
                                                    Text='<%# Bind("BirthDay","{0:d}") %>'></asp:TextBox>
                                                <asp:CalendarExtender ID="txt_Birthday_CalendarExtender" runat="server" 
                                                    TargetControlID="txt_Birthday">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="txt_Birthday_MaskedEditExtender" runat="server" 
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                    Mask="99/99/9999" MaskType="Date" TargetControlID="txt_Birthday">
                                                </asp:MaskedEditExtender>
                                                <asp:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                                                    ControlExtender="txt_Birthday_MaskedEditExtender" 
                                                    ControlToValidate="txt_Birthday" Display="Dynamic" 
                                                    ErrorMessage="Điền đúng Email"></asp:MaskedEditValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("BirthDay","{0:d}") %>'></asp:Label>
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
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Địa chỉ" SortExpression="Address">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Address" runat="server" Text='<%# Bind("Address") %>' 
                                                    TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="txt_Address" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số chứng minh" SortExpression="IDCard">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_IDCard" runat="server" Text='<%# Bind("IDCard") %>'></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="txt_IDCard_FilteredTextBoxExtender" runat="server" 
                                                    Enabled="True" FilterType="Numbers" TargetControlID="txt_IDCard">
                                                </asp:FilteredTextBoxExtender>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("IDCard") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Phân quyền" SortExpression="Decentralize">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_Decentralize" runat="server" 
                                                    SelectedValue='<%# Bind("Decentralize") %>'>
                                                    <asp:ListItem Value="Administrator" Text="Administrator"></asp:ListItem>
                                                    <asp:ListItem Selected="True" Value="Employee" Text="Employee"></asp:ListItem>
                                                    <asp:ListItem Value="Client" Text="Client"></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Decentralize") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tình trạng" SortExpression="IsActived">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_IsActived" runat="server" 
                                                    SelectedValue='<%# Bind("IsActived") %>'>
                                                    <asp:ListItem Value="1">Đã kích hoạt</asp:ListItem>
                                                    <asp:ListItem Value="0">Chưa kích hoạt</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("IsActived") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" 
                                            DeleteImageUrl="~/Images/Apps/Delete.jpg">
                                        <ControlStyle CssClass="styleButtonCancle" />
                                        </asp:CommandField>
                                        <asp:CommandField DeleteText="" EditText="Sửa" ShowEditButton="True" 
                                            UpdateText="Cập nhật" ButtonType="Image" 
                                            EditImageUrl="~/Images/Apps/edit.png" 
                                            UpdateImageUrl="~/Images/Apps/update.jpg" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource_Users" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MobileShopConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
 
                    <br />
                </td>
            </tr>
        </table>
     
    </asp:Content>