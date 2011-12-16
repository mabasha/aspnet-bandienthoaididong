using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Gui_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null || cookie != null)
        {
            Response.Redirect("../Gui/HomePage.aspx");
        }
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
                    if (cb_Remember.Checked)
                    {
                        //HttpCookie username = new HttpCookie("username", txt_Username.Text);
                        //username.Expires = DateTime.Now.AddDays(30);
                        //Response.Cookies.Add(username);
                        //HttpCookie password = new HttpCookie("password", txt_Password.Text);
                        //password.Expires = DateTime.Now.AddDays(30);
                        //Response.Cookies.Add(password);
                        //Response.Cookies["username"].Value = txt_Username.Text;
                        //Response.Cookies["username"].Expires = DateTime.Now.AddDays(30);
                        //Response.Cookies["password"].Value = txt_Password.Text;
                        //Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);
                        HttpCookie cookie = new HttpCookie("login");
                        cookie["username"] = txt_Username.Text;
                        cookie["password"] = txt_Password.Text;
                        cookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cookie);
                    }
                    else
                    {
                        Session["username"] = txt_Username.Text;
                        Session["password"] = txt_Password.Text;
                    }
                    Response.Redirect("../Gui/Redirect.aspx?todo=login");
                    break;
                }
        }
        
    }
}