using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_DistributorManager : System.Web.UI.Page
{
    private void FillData()
    {
        FillData("");
    }

    private void FillData(string sortExp)
    {
        DataTable dtDis = Distributor.GetAll();
        if (sortExp != "")
        {
            dtDis.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dtDis;
        gShow.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            FillData();
            lThongBao.Text = "";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        Distributor dis = new Distributor(0, tName.Text, tAddress.Text);
        bool isSuccess = dis.Insert();
        if (isSuccess == true)
        {
            lThongBao.Text = "<div class=valid_box>THÊM THÀNH CÔNG </div>";
            tName.Text = "";
            tAddress.Text = "";
            FillData();
        }
        else
        {
            lThongBao.Text = "<div class=error_box>TÊN ĐÃ TỒN TẠI </div>";
        }
    }
    protected void gShow_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[4].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa NPP này không ?')) return false;";
        }
    }
    protected void gShow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gShow.EditIndex = e.NewEditIndex;
        FillData();
    }
    protected void gShow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gShow.EditIndex = -1;
        FillData();
    }
    protected void gShow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //TextBox tUpdateID = (TextBox)gShow.Rows[e.RowIndex].Cells[0].Controls[0];
        string sID = gShow.Rows[e.RowIndex].Cells[0].Text;
        TextBox tUpdateName = (TextBox)gShow.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox tUpdateAddress = (TextBox)gShow.Rows[e.RowIndex].Cells[2].Controls[0];
        int ID = Convert.ToInt32(sID);
        string name = tUpdateName.Text;
        string address = tUpdateAddress.Text;
        if (tUpdateName.Text != "" && tUpdateAddress.Text!="")
        {
            Distributor dis = new Distributor(ID, name, address);
            dis.Update();
            gShow.EditIndex = -1;
            FillData();
        }
    }

    protected void gShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Distributor dis = new Distributor(Convert.ToInt32(gShow.Rows[e.RowIndex].Cells[0].Text));
        dis.Delete();
        FillData();
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShow_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
