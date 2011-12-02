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
    int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        FillDataInGrid("Name");
        id = Convert.ToInt32(grid_Phone.DataKeys[1].Value);
        FillDataInDetailsView(id);
    }

    
    //DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
    protected void FillDataInDetailsView(int id)
    {
        DataTable dt = AccessData.GetTable("SELECT Phone.*, Distributor.Name as DistributorName, Producer.Name as ProducerName FROM Phone, Distributor, Producer WHERE Phone.ID=" + id + " and Phone.DistributorID=Distributor.ID and Phone.ProducerID=Producer.ID");
        dtview_Phone.DataSource = dt;
        dtview_Phone.DataBind();
    }

    protected void FillDataInGrid(object sort)
    {
        DataTable dt = AccessData.GetTable("SELECT ID,Name FROM Phone");
        dt.DefaultView.Sort = sort.ToString();
        grid_Phone.DataSource = dt;
        grid_Phone.DataBind();
    }
    protected void grid_Phone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Phone.PageIndex = e.NewPageIndex;
        FillDataInGrid("Name");
    }
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ChoosePhone")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            FillDataInDetailsView(Convert.ToInt32(grid_Phone.DataKeys[index].Value));
        }
    }
    protected void dtview_Phone_DataBound(object sender, EventArgs e)
    {
        if (dtview_Phone.Rows.Count>0 && dtview_Phone.CurrentMode==DetailsViewMode.ReadOnly)
        {
            ImageButton delete = (ImageButton)dtview_Phone.Rows[0].Cells[0].Controls[2];
            delete.OnClientClick = "if(!confirm('Bạn có đồng ý xóa điện thoại này không?')) return false;";
        }
    }
    protected void dtview_Phone_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        string query=String.Format("DELETE FROM Phone WHERE ID='{0}'", id);
        AccessData.ExecuteNonQuery(query);
        FillDataInGrid("Name");
        id = Convert.ToInt32(grid_Phone.DataKeys[1].Value);
        FillDataInDetailsView(id);
    }
    protected void grid_Phone_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataInGrid(e.SortExpression);
    }
    protected void dtview_Phone_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit": dtview_Phone.ChangeMode(DetailsViewMode.Edit);
                FillDataInDetailsView(id);
                break;
            case "Cancel": dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
                FillDataInDetailsView(id);
                break;
            case "New": dtview_Phone.ChangeMode(DetailsViewMode.Insert);
                break;
        }
    }
    protected void dtview_Phone_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

    }
    protected void dtview_Phone_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }
}