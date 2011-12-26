using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_News_San_pham : System.Web.UI.Page
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
        gridShow.DataSource = News.GetAll_Product();
        gridShow.DataBind();
    }
    protected void gridShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridShow.PageIndex = e.NewPageIndex;
        FillData();
    }
}
