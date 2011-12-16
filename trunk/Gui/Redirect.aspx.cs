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
                lb_Note.Text = "Bạn đã đăng kí thành công. Vui lòng đợi trong giây lát để chuyển về trang đăng nhập";
                Response.AddHeader("refresh", "5;url=../Gui/Login.aspx");
                break;
            }
            default: Response.Redirect("../Gui/HomePage.aspx");
            break;
        }
    }
}