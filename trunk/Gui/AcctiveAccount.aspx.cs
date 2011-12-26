using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_AcctiveAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["username"] != null && int.Parse(Request.QueryString["isactived"]) == 1)
        {
            Account.UpdateIsActived(Request.QueryString["username"], int.Parse(Request.QueryString["isactived"]));
            Response.Redirect("../Gui/Redirect.aspx?todo=actived");
        }
        else
        {
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
            {
                Session["username"] = null;
            }
            Response.Redirect("../Gui/HomePage.aspx");
        }
    }
}