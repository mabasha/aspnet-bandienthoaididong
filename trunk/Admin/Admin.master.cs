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
            lb_Username.Text = Session["username"].ToString();
            CheckLogin(lb_Username.Text);
        }
        else if (cookie!=null)
        {
            lb_Username.Text = cookie["username"].ToString();
            CheckLogin(lb_Username.Text);
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
        user.GetInfoByUsername();
        if (user.decentralize == "Client")
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
    }
}
