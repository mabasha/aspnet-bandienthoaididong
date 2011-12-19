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
        }
        else if (cookie!=null)
        {
            lb_Username.Text = cookie["username"].ToString();
        }
        else
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
    }
}
