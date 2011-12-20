using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Redirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string todo = Request.QueryString["todo"];
        switch (todo)
        {
            case "login":
            {
                lb_Note.Text = "Bạn đã đăng nhập thành công. Vui lòng đợi trong giây lát để chuyển về trang chủ.";
                Response.AddHeader("refresh", "5;url=../Gui/HomePage.aspx");
        	    break;
            }
            case "register":
            {
                lb_Note.Text = "Bạn đã đăng kí thành công tài khoản tại trang web của chúng tôi. Vui lòng check mail để hoàn tất việc đăng nhập";
                Response.AddHeader("refresh", "5;url=../Gui/Login.aspx");
                break;
            }
            case "actived":
            {
                lb_Note.Text = "Chúc mừng bạn đã avtived thành công tài khoản. Sau khi Login, bạn có thể thoái xem và đặt hàng tại trang web của chúng tôi";
                Response.AddHeader("refresh", "5;url=../Gui/Login.aspx");
                break;
            }
            case "recovery":
            {
                lb_Note.Text = "Bạn đã yêu cầu gửi email để phục hồi mật khẩu. Vui lòng check mail để nhận mật khẩu mới";
                Response.AddHeader("refresh", "5;url=../Gui/Login.aspx");
                break;
            }
            default: Response.Redirect("../Gui/HomePage.aspx");
            break;
        }
    }
}