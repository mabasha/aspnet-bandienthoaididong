using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Drawing;

public partial class Gui_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
        {
            Response.Redirect("../Gui/HomePage.aspx");
        }
        else if (cookie != null)
        {
            Account user = new Account();
            user.username = cookie["username"];
            user.GetInfoByUsername();
            if (user.isActived == '0')
            {
                lb_Note.ForeColor = Color.Red;
                lb_Note.Text = "Tài khoản của bạn chưa được actived, vui lòng check mail để actived tài khoản hoặc click vào ";
                btnl_Actived.PostBackUrl = String.Format("../Gui/Login.aspx?username={0}", txt_Username.Text);
                btnl_Actived.Visible = true;
                lb_Continuous.Visible = true;
                lb_Continuous.ForeColor = Color.Red;
                lb_Continuous.Text = "để actived lại tài khoản";
            }
            else
            {
                Response.Redirect("../Gui/HomePage.aspx");
            }
        }
        else if (Request.QueryString["username"] != null)
        {
            string username = Request.QueryString["username"];
            Account user = new Account();
            user.username = username;
            user.GetInfoByUsername();
            string subject = "Kích hoạt lại tài khoản";
            string content = String.Format("Xin chào {0}. Bạn đã yêu cầu kích hoạt lại tài khoản {1} ở trang web của chúng tôi.</br>Để kích hoạt lại tài khoản, vui lòng kích hoạt link sau :<a href='/GUI/AcctiveAccount.aspx?username={2}&&isactived=1' style='color:Blue;'>Kích hoạt tài khoản</a>.</br>Nếu hủy việc kích hoạt, vui lòng kích hoạt link sau : <a href='/GUI/AcctiveAccount.aspx?username={2}&&isactived=0' style='color:Blue;'>Hủy đăng kí</a>.</br> Việc kích hoạt tài khoản chỉ có có hiệu lực một ngày kể từ lúc đăng kí.", user.fullname, user.username, user.username, user.username);
            Utils.SendEMail(user.email, subject, content);
            //lb_Actived.Visible = false;
            lb_Note.ForeColor = Color.Green;
            lb_Note.Text = "Bạn đã yêu cầu actived lại tài khoản. Vui lòng check mail để actived lại tài khoản";
            lb_Continuous.Visible = false;
            btnl_Actived.Visible = false;

            // Add cookie để sau 1 ngày mà người dùng không check mail để thực hiện actived thì sẽ hủy lênh active
            cookie = new HttpCookie("login");
            cookie["username"] = txt_Username.Text;
            cookie["password"] = Utils.MD5(txt_Password.Text);
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);
        }
        btnl_Actived.Visible = false;
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        int temp = Login.CheckLogin(txt_Username.Text, Utils.MD5(txt_Password.Text));
        switch (temp)
        {
            case 0:
                {
                    lb_Note.ForeColor = Color.Red;
                    lb_Note.Text = "Tài khoản của bạn chưa được actived, vui lòng check mail để actived tài khoản hoặc click vào ";
                    btnl_Actived.PostBackUrl = String.Format("../Gui/Login.aspx?username={0}", txt_Username.Text);
                    btnl_Actived.Visible = true;
                    lb_Continuous.Visible = true;
                    lb_Continuous.ForeColor = Color.Red;
                    lb_Continuous.Text = "để actived lại tài khoản";
                    break;
                }
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
                        HttpCookie cookie = new HttpCookie("login");
                        cookie["username"] = txt_Username.Text;
                        cookie["password"] = Utils.MD5(txt_Password.Text);
                        cookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cookie);
                    }
                    else
                    {
                        Session["username"] = txt_Username.Text;
                        Session["password"] = Utils.MD5(txt_Password.Text);
                    }
                    Response.Redirect("../Gui/Redirect.aspx?todo=login");
                    break;
                }
        }
        
    }
}