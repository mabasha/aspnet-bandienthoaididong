using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"]!=null)
        {
            CheckLogin(Session["username"].ToString());
            lb_Username.Text = Session["username"].ToString();
            
        }
        else if (cookie!=null)
        {
            CheckLogin(cookie["username"].ToString());
            lb_Username.Text = cookie["username"].ToString();
            
        }
        else
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
    }

    private void CheckLogin(string username)
    {
        Account user = new Account();
        user.username = username;
        // xét trường hợp cookie vẫn còn nhưng account đã bị xóa.
        int temp = user.GetInfoByUsername();
        if (temp == 0)
        {
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
            {
                Session["username"] = null;
            }
            else if (cookie != null)
            {
                cookie.Expires = DateTime.Now;
                Response.Cookies.Add(cookie);
            }
            
            Response.Redirect("~/GUI/HomePage.aspx");           
        }
        if (user.decentralize == "Client")
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
    }
}
