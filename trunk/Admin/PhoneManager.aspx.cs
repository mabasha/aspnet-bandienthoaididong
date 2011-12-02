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
        if (!IsPostBack)
        {
            FillDataInGrid("Name");
            id = Convert.ToInt32(grid_Phone.DataKeys[0].Value);
            FillDataInDetailsView(id);
        }
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
            id = Convert.ToInt32(grid_Phone.DataKeys[index].Value);
            FillDataInDetailsView(id);
            if (dtview_Phone.CurrentMode==DetailsViewMode.Edit)
            {
                ConvertHtmlToTextBox(dtview_Phone);
            }
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
        string query = String.Format("DELETE FROM Phone WHERE ID='{0}'", Convert.ToInt32(dtview_Phone.DataKey.Value));
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
                FillDataInDetailsView(Convert.ToInt32(dtview_Phone.DataKey.Value));
                ConvertHtmlToTextBox(dtview_Phone);
                break;
            case "Cancel": dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
                FillDataInDetailsView(Convert.ToInt32(dtview_Phone.DataKey.Value));
                break;
            case "New": dtview_Phone.ChangeMode(DetailsViewMode.Insert);
                break;
        }
    }
    protected void dtview_Phone_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //ConvertTextBoxToHtml
        string specialFuture = ((TextBox)dtview_Phone.Rows[8].Cells[0].FindControl("txt_SpecialFeature")).Text.Replace("\n", "</br>");
        string officeApps = ((TextBox)dtview_Phone.Rows[23].Cells[0].FindControl("txt_OfficeApps")).Text.Replace("\n", "</br>");
        string otherApp = ((TextBox)dtview_Phone.Rows[24].Cells[0].FindControl("txt_OtherApp")).Text.Replace("\n", "</br>");
        string query = String.Format("UPDATE Phone SET SpecialFeature=N'{0}' WHERE ID='{1}'", specialFuture, dtview_Phone.DataKey.Value);
        AccessData.ExecuteNonQuery(query);
        dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
        FillDataInDetailsView(Convert.ToInt32(dtview_Phone.DataKey.Value));
    }
    protected void dtview_Phone_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }

    private void ConvertHtmlToTextBox(DetailsView dtview_Phone)
    {
        TextBox specialFuture = (TextBox)dtview_Phone.Rows[8].Cells[0].FindControl("txt_SpecialFeature");
        specialFuture.Text = specialFuture.Text.Replace("</br>", "\n");
        TextBox officeApps = (TextBox)dtview_Phone.Rows[23].Cells[0].FindControl("txt_OfficeApps");
        officeApps.Text = officeApps.Text.Replace("</br>", "\n");
        TextBox otherApp = (TextBox)dtview_Phone.Rows[24].Cells[0].FindControl("txt_OtherApp");
        otherApp.Text = otherApp.Text.Replace("</br>", "\n");
    }

    private void ConvertTextBoxToHtml(DetailsView dtview_Phone)
    {
        
    }
}