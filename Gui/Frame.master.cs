using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Frame : System.Web.UI.MasterPage
{
    Account user = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
        {
            Constructor(Session["username"].ToString());
        }
        else if (cookie != null)
        {
            Constructor(cookie["username"].ToString());
        }
        else
        {
            lb_Username.Text = "Login";
            lb_Username.NavigateUrl = "~/Gui/Login.aspx";
            lb_AdControl.Visible = false;
            lb_Logout.Visible = false;
        }
    }

    protected void Constructor(string username)
    {

        lb_Username.Text = username; 
        lb_Username.NavigateUrl = "~/Gui/ProfileUser.aspx";
        user.username = lb_Username.Text;
        user.GetInfoByUsername();
        if (user.decentralize != "Client")
        {
            lb_AdControl.Visible = true;
        } 
        else
        {
            lb_AdControl.Visible = false;
        }
    }
}
