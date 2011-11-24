using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProducerManager : System.Web.UI.Page
{
    private void FillData()
    {
        gProducer.DataSource = ProducerModel.GetProducts();
        gProducer.DataBind();
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
        if (tName.Text == "")
        {
            lThongBao.Text = "<div class=error>*Bạn chưa nhập tên !</div>";
            return;
        }
        if (ProducerModel.IsExistName(tName.Text) == false)
        {
            ProducerModel.Insert(tName.Text);
            lThongBao.Text = "<div class=info>* Thêm thành công.</div>";
            FillData();
            tName.Text = "";
        }
        else
        {
            lThongBao.Text = "<div class=error>* Nhà sản xuất đã tồn tại.</div>";
        }
    }
    protected void gProducer_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gProducer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton) e.Row.Cells[3].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa NSX này không ?')) return false;";
        }
    }
    protected void gProducer_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ProducerModel.Delete(Convert.ToInt32(gProducer.Rows[e.RowIndex].Cells[0].Text));
        FillData();
    }
    protected void gProducer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gProducer.EditIndex = -1;
        FillData();
    }
    protected void gProducer_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gProducer.EditIndex = e.NewEditIndex;
        FillData();
    }
    protected void gProducer_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox tUpdateID = (TextBox) gProducer.Rows[e.RowIndex].Cells[0].Controls[0];
        TextBox tUpdateName = (TextBox) gProducer.Rows[e.RowIndex].Cells[1].Controls[0];
        if (tUpdateName.Text != "")
        {
            int ID = Convert.ToInt32(tUpdateID.Text);
            string newName = tUpdateName.Text;
            ProducerModel.Update(ID, tUpdateName.Text);
            gProducer.EditIndex = -1;
            FillData();
        }
        else
        {
            lThongBao.Text = "Cập nhật không thành công ! Chưa nhập đủ thông tin.";
        }
    }
}
