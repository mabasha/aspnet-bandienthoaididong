using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Register_Click(object sender, EventArgs e)
    {
        Account user = new Account(txt_Username.Text, txt_Password.Text, txt_Fullname.Text, txt_Email.Text,
                                    Convert.ToDateTime(txt_BirthDay.Text), txt_Tel.Text, txt_Address.Text, Convert.ToInt32(txt_IDCard.Text));
        int temp = user.Insert();
        if (temp == 0)
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = String.Format("Lỗi : username {0} đã có người sử dụng, vui lòng chọn username khác.", txt_Username.Text);
            //FillDataInGrid("Username");
        }
        else if (temp == 1)
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = String.Format("Lỗi : Email {0} đã có người sử dụng, vui lòng nhập email khác.", txt_Email.Text);
        }
        else
        {
            Response.Redirect("../Gui/Redirect.aspx?todo=register");
        }
    }
}