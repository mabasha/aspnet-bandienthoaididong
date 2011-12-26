using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_News_Thu_thuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            FillData();
        }
    }
    private void FillData()
    {
        gridShow.DataSource = News.GetAll_Tips();
        gridShow.DataBind();
    }
    protected void gridShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridShow.PageIndex = e.NewPageIndex;
        FillData();
    }
}
