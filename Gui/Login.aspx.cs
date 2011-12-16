using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        int temp = Login.CheckLogin(txt_Username.Text, txt_Password.Text);
        switch (temp)
        {
            case 1:
                {
                    lb_Note.Text = String.Format("Không tồn tại username : {0}", txt_Username.Text);
                    break;
                }
            case 2:
                {
                    lb_Note.Text = String.Format("Mật khẩu không đúng, vui lòng đăng nhập lại");
                    break;
                }
            case 3:
                {
                    lb_Note.Text = String.Format("Đăng nhập thành công");
                    break;
                }
        }
        
    }
}