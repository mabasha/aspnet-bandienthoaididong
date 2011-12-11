using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_WarrantyReceiptManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack==false)
        {   
            FillData();
        }
    }
    private void FillData(string sort)
    {
        DataTable grid = WarrantyReceipt.GetAll();
        grid.DefaultView.Sort = sort;
        gridPBH.DataSource = grid;
        gridPBH.DataBind();
    }
    private void FillData()
    {
        FillData("");
    }
    protected void gridPBH_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
                   e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnDelete = (ImageButton)e.Row.Cells[12].Controls[0];
            btnDelete.OnClientClick = "if (!confirm('Bạn có đồng ý xóa Phiếu bảo hành không?')) return false";
        }
    }
    protected void gridPBH_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gridPBH.Rows[e.RowIndex].Cells[0].Text);
        WarrantyReceipt war = new WarrantyReceipt(id);
        war.Delete();
        FillData();
    }
    private static int id;
    protected void gridPBH_SelectedIndexChanged(object sender, EventArgs e)
    {
        rChua.Enabled = true;
        rTra.Enabled = true;
        txtLydo.Enabled = true;
        txtMota.Enabled = true;
        btnCapnhat.Enabled = true;
        btnHuy.Enabled = true; 
     
        id = Convert.ToInt32(gridPBH.SelectedRow.Cells[0].Text);
        //WarrantyReceipt war = new WarrantyReceipt(id);
        Label lydo = (Label)gridPBH.SelectedRow.FindControl("lbReason");
        Label mota = (Label)gridPBH.SelectedRow.FindControl("lbDes");
        Label tinhtrang = (Label)gridPBH.SelectedRow.FindControl("lbIsRe");
        if (tinhtrang.Text == "Chưa đổi")
        {
            rChua.Checked = true;
            rTra.Checked = false;
        }
        else
        {
            rTra.Checked = true;
            rChua.Checked = false;
        }

        txtLydo.Text = lydo.Text;
        txtMota.Text = mota.Text;          
    }
    protected void btnCapnhat_Click(object sender, EventArgs e)
    {        
        bool returned = false;
        if (rTra.Checked == true) returned = true;
        else returned = false;
        string returnedDate = DateTime.Now.ToShortDateString();
        WarrantyReceipt war = new WarrantyReceipt(id , txtLydo.Text, returned, returnedDate, txtMota.Text);
        war.Update();
        FillData();
        rChua.Enabled = false;
        rTra.Enabled = false;
        txtLydo.Enabled = false;
        txtMota.Enabled = false;
        btnCapnhat.Enabled = false;
        btnHuy.Enabled = false;
    }
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        rChua.Enabled = false;
        rTra.Enabled = false;
        txtLydo.Enabled = false;
        txtMota.Enabled = false;
        btnCapnhat.Enabled = false;
        btnHuy.Enabled = false;
    }
    protected void gridPBH_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridPBH.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gridPBH_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
}
