using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Admin_PhoneManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillDataInGrid();
        int id = Convert.ToInt32(grid_Phone.DataKeys[1].Value);
        FillDataInDetailsView(id);
    }

    int id = 1;
    //DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
    protected void FillDataInDetailsView(int id)
    {
        DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
        dtview_Phone.DataSource = dt;
        dtview_Phone.DataBind();
    }

    protected void FillDataInGrid()
    {
        DataTable dt = AccessData.GetTable("SELECT ID,Name FROM Phone");
        grid_Phone.DataSource = dt;
        grid_Phone.DataBind();
    }
    protected void grid_Phone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Phone.PageIndex = e.NewPageIndex;
        FillDataInGrid();
    }
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="ID")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            FillDataInDetailsView(Convert.ToInt32(grid_Phone.DataKeys[index].Value));
        }
    }
}