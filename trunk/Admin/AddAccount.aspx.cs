using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAccount : System.Web.UI.Page
{
    Account user = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {

        if (txt_Username.Text == "" || txt_Password.Text == "" || txt_Fullname.Text == "" || txt_Tel.Text == "" || txt_BirthDay.Text == "" ||
            txt_Address.Text == "" || txt_IDCard.Text == "")
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. Please complete the information.";

        }
        else
        {
            GetDataForUserFromTextbox();
            // Check xem user có tồn tại trong database hay chưa.
            int temp = user.Insert();
            if (temp == 0)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = "Insert username:" + user.username + " failed. This username is exist.";
                //FillDataInGrid("Username");
            }
            else if (temp == 1)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = "Insert username:" + user.username + " failed. This email is exist.";
            }
            else
            {
                lb_Note.ForeColor = System.Drawing.Color.Green;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " successfully";
                
            }
        }
    }

    private void GetDataForUserFromTextbox()
    {
        user.username = txt_Username.Text;
        user.password = txt_Password.Text;
        user.fullname = txt_Fullname.Text;
        user.email = txt_Email.Text;
        //FormatProvider f = new FormatProvider();
        //IFormatProvider culture = new System.Globalization.CultureInfo("en-US", true);
        user.birthDay = Convert.ToDateTime(txt_BirthDay.Text);
        user.tel = txt_Tel.Text;
        user.address = txt_Address.Text;
        user.idCard = Convert.ToInt32(txt_IDCard.Text);
        user.decentralize = ddl_Decentralize.SelectedValue.ToString();
    }
}