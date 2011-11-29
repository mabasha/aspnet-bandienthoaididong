using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Producer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            FillData();            
        }
    }
    
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Producer pro = new Producer(0, txtTenNsx.Text);
        bool isSuccess = pro.Insert();
        if (isSuccess == true)
        {
            lbThongbao.Text = "<p class=info>* Thêm thành công Nhà sản xuất.</p>";
            txtTenNsx.Text = "";            
            FillData();
        }
        else
        {
            lbThongbao.Text = "<p class=error>* Tên đã tồn tại.</p>";
        }
    }
    
    protected void gridNsx_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
                    e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnCancel = (ImageButton)e.Row.Cells[3].Controls[0];
            btnCancel.OnClientClick = "if (!confirm('Bạn có đồng ý xóa Nhà sản xuất?')) return false";
        }       
    }

    protected void gridNsx_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridNsx.EditIndex = e.NewEditIndex;
        FillData();
    }
    protected void gridNsx_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridNsx.EditIndex = -1;
        FillData();
    } 
    protected void gridNsx_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {        
        TextBox txtUpdateName = (TextBox)gridNsx.Rows[e.RowIndex].Cells[1].Controls[0];               
        string name = txtUpdateName.Text;        
        int ID = Convert.ToInt32(gridNsx.Rows[e.RowIndex].Cells[0].Text);
        if (txtUpdateName.Text != "")
        {
            Producer pro = new Producer(ID, name);
            pro.Update();               
            gridNsx.EditIndex = -1;
            FillData();
        }
    }
    protected void gridNsx_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Producer pro = new Producer(Convert.ToInt32(gridNsx.Rows[e.RowIndex].Cells[0].Text));
        pro.Delete();
        FillData();
    }
    private void FillData()
    {
        gridNsx.DataSource = Producer.GetAll();
        gridNsx.DataBind();
    }
}
