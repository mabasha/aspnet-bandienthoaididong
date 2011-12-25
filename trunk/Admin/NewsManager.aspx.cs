using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class Admin_NewsManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData("");
        }
    }

    void FillData(string keyword, string sortExp)
    {
        DataTable dt = News.GetAllWithKeyword(keyword);
        if(sortExp != "")
        {
            dt.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dt;
        gShow.DataBind();
    }

    void FillData(string keyword)
    {
        FillData(keyword, "");
    }
    protected void gShow_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa tin tức này không ?')) return false;";

        }
    }
    protected void gShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gShow.Rows[e.RowIndex].Cells[0].Text);
        News news = new News(id);
        news.Delete();
        FillData("");
    }
    protected void gShow_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gShow.Rows[rowIndex].Cells[0].Text);
            Response.Redirect("NewsAdd.aspx?id=" + id);
        }
    }
    protected void bSearch_Click(object sender, EventArgs e)
    {
        FillData(tKeyword.Text);
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData(tKeyword.Text);
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(tKeyword.Text, e.SortExpression);
    }
    protected void bAdd_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NewsAdd.aspx");
    }
}
