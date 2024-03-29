﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Products_AccessoryDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            FillData(id);
        }
    }

    void FillData(int id)
    {
        fShow.DataSource = Accessory.GetAllByID(id);
        fShow.DataBind();
    }
    protected void fShow_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void fShow_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "iBuy")
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect(String.Format("~/Gui/Order/ViewCart.aspx?ProductID={0}&IsPhone=false", id));
        }
    }
    protected void iBuy_Click(object sender, ImageClickEventArgs e)
    {

    }
}
