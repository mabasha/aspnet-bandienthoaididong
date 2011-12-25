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
        if (!IsPostBack)
        {
            FillDataInGrid();
            ViewState["TongTien"] = 0;
            ViewState["TongSoLuong"] = 0;
        }
    }
    AccessData ac = new AccessData();
    private void FillDataInGrid()
    {
        SqlConnection conn = new SqlConnection(AccessData.ConnectString);
        SqlDataAdapter sqldata = new SqlDataAdapter("SELECT Phone.*, Producer.Name FROM Phone INNER JOIN Producer cd ON Phone.ProducerID = cd.ID", conn);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            sqldata.Fill(dt);
            grid_Phone.DataSource = dt;
            grid_Phone.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert(" + ex.Message + ")</script>");
        }
        finally
        {
            conn.Close();
        }
    }

    protected void grid_Phone_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnDelete = (ImageButton)e.Row.Cells[4].Controls[0];
            btnDelete.OnClientClick = "if (!confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) return false";
            //ImageButton btnEdit = (ImageButton)e.Row.Cells[5].Controls[0];
            //btnEdit.OnClientClick = Response.Redirect("~/Admin/PhoneEditAdd.aspx?action=edit&&id=");
            //btnEdit.Click();
            
        }
    }
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="Edit")
        {
            int index = int.Parse(e.CommandArgument.ToString());
            Label id = (Label)grid_Phone.Rows[index].FindControl("lb_ID");
            Response.Redirect("~/Admin/PhoneEditAdd.aspx?action=edit&&id=" + id.Text);
        }
    }
}