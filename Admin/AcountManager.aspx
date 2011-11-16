<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcountManager.aspx.cs" Inherits="Admin_AcountManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
  protected void calEventDate_SelectionChanged(object sender, EventArgs e)
  {
      txt_BirthDay.Text = calEventDate.SelectedDate.ToString("d");
  }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pop-up Date Picker</title>
      <script type="text/javascript">
          function displayCalendar() {
              var datePicker = document.getElementById('datePicker');
              datePicker.style.display = 'block';
          }
      </script>
      <style type="text/css">
      #datePicker
      {
          display:none;
          position:absolute;
          border:solid 2px black;
          background-color:white;
      }
      .content
      {
          width:400px;
          background-color:white;
          margin:auto;
          padding:10px;
      }
      html
      {
          background-color:silver;
      }
          .style2
          {
              text-align: left;
          }
    </style>
    <%--<title></title>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            text-align: left;
        }
    </style>--%>
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td style="text-align: center">
                    <h1>
                        <b>DANH SÁCH USERS</b></h1>
                    <div class="style2">
                        Username :
                        <asp:TextBox ID="txt_Username" runat="server" style="text-align: left" 
                            Width="160px"></asp:TextBox>
&nbsp; Password :
                        <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" Width="160px"></asp:TextBox>
&nbsp;Fullname :
                        <asp:TextBox ID="txt_Fullname" runat="server" Width="160px"></asp:TextBox>
&nbsp;<br />
                        BirthDay :&nbsp;
                        &nbsp;<asp:TextBox ID="txt_BirthDay" runat="server" Width="160px"></asp:TextBox>
                        <asp:Image ID="img_Calendar" alt="" onclick="displayCalendar()" runat="server" 
                            Height="20px" ImageUrl="~/Images/calendar.png" Width="20px" />
                        <div id="datePicker">
                            <asp:Calendar id="calEventDate" OnSelectionChanged="calEventDate_SelectionChanged" Runat="server" />
                        </div>
                    &nbsp; Tel :
                        <asp:TextBox ID="txt_Tel" runat="server" Width="160px"></asp:TextBox>
&nbsp; Address :
                        <asp:TextBox ID="txt_Address" runat="server" TextMode="MultiLine" Width="160px"></asp:TextBox>
                        <br />
                        IDCard :
                        <asp:TextBox ID="txt_IDCard" runat="server" Width="160px"></asp:TextBox>
&nbsp;Decentralize :
                        <asp:DropDownList ID="ddl_Decentralize" runat="server">
                            <asp:ListItem>Adminitrator</asp:ListItem>
                            <asp:ListItem>Mod</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Add" runat="server" Text="Add" onclick="btn_Add_Click" />
                        <br />
                        <br />
                        <center><asp:Label ID="lb_Note" runat="server" ForeColor="Red" Font-Bold="True" 
                                Font-Size="15pt"></asp:Label>
                            <br />
                        </center>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
    
                    <asp:GridView ID="grid_Users" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="Username" 
                        EnableModelValidation="True" ForeColor="#333333" 
                        onrowdatabound="grid_Users_RowDataBound" Width="800px" 
                        onrowediting="grid_Users_RowEditing" 
                        onrowupdating="grid_Users_RowUpdating" 
                        onrowdeleting="grid_Users_RowDeleting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" 
                                SortExpression="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" 
                                SortExpression="Password" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" 
                                SortExpression="FullName" />
                            <asp:BoundField DataField="BirthDay" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="BirthDay" HtmlEncode="False" SortExpression="BirthDay" />
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:BoundField DataField="IDCard" HeaderText="IDCard" 
                                SortExpression="IDCard" />
                            <asp:BoundField DataField="Decentralize" HeaderText="Decentralize" 
                                SortExpression="Decentralize" />
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:CommandField ButtonType="Button" DeleteImageUrl="~/Images/delete.png" 
                                ShowDeleteButton="True" />
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
    
                    <br />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
    </center>
</body>
</html>
