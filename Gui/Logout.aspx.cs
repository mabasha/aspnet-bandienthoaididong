using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["login"];
        cookie.Expires = DateTime.Now;
        Response.Cookies.Add(cookie);

        Session["username"] = null;
    }
}