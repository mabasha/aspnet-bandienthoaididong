<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Gui_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Using the jQuery Validation Plugin to choose atleast one CheckBox before submitting
the Form</title>
<style type="text/css">
label.error, #msg
{
float: none;
color: red;
padding-left: .3em;
vertical-align: top;
}
</style>
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $("#form1").validate({

            rules: {
                txtUsername: {

                    required: true,

                    minlength: 5

                },

                txtEmail: {

                    required: true,

                    minlength: 5,

                    email: true

                }

            }, messages: {
                txtUsername: {
                    required: "* Required Field *",
                    minlength: "* Please enter atleast 5characters *"
                },
                txtEmail: {
                    required: "* Required Field *",
                    minlength: "* Please enter atleast 5 characters *"
                }

            }

        });

    });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        <p>

            Username:

            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></p>

        <p>

            Email:

            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></p>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />

    </div>
    </form>
</body>
</html>
