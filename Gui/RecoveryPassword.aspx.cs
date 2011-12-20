using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_RecoveryPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Gui/HomePage.aspx");
    }
    protected void btn_Ok_Click(object sender, EventArgs e)
    {
        if (RecoveryPassword.Recovery(txt_Username.Text) == 0)
        {
            lb_Note.Text = String.Format("Tài khoản {0} không tồn tại, vui lòng nhập đúng tên tài khoản của bạn", txt_Username.Text);
        } 
        else
        {
            Account user = new Account();
            user.username = txt_Username.Text;
            user.GetInfoByUsername();
            user.password = Utils.RandomPassword();
            string subject = "Khôi phục mật khẩu";
            string content = String.Format("Bạn đã yêu cầu khôi phục mật khẩu cho tài khoản {0} ở trang web của chúng tôi. Mật khẩu mới của bạn là : {1} . </br>Vui lòng truy cập vào website của chúng tôi để tiến hành đăng nhập và đổi mật khẩu", txt_Username.Text, user.password);
            Utils.SendEMail(user.email, subject, content);
            user.Update();
            Response.Redirect("../GUI/Redirect.aspx?todo=recovery");
        }
    }
}