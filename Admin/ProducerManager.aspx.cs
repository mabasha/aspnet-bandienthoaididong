using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProducerManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            gProducer.DataSource = ProducerModel.GetProducts();
            gProducer.DataBind();
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        if (ProducerModel.IsExistName(tName.Text) == false)
        {
            ProducerModel.Insert(tName.Text);
            Response.Write("<div class=info>* Thêm thành công.</div>");
        }
        else
        {
            Response.Write("<div class=error>* Nhà sản xuất đã tồn tại.</div>");
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
}
