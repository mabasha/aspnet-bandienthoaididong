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
        if (!IsPostBack)
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
            else
            {
                Response.Redirect("~/GUI/HomePage.aspx");
            }
            Response.Redirect("~/GUI/Login.aspx");
        }
    }
}