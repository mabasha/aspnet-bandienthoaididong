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

public partial class Admin_AcountManager : System.Web.UI.Page
{
    private Account user = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataInGrid("Username");
        }
    }
    
    private void FillDataInGrid(object sort)
    {
        SqlConnection conn = new SqlConnection(AccessData.ConnectString);
        SqlDataAdapter sqldata = new SqlDataAdapter("Select * from Users", conn);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            sqldata.Fill(dt);
            dt.DefaultView.Sort = sort.ToString();
            grid_Users.DataSource = dt;
            grid_Users.DataBind();
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

    

    private void GetDataForUserFromGrid(GridViewUpdateEventArgs e)
    {
        user.username = grid_Users.DataKeys[e.RowIndex].Value.ToString();
        user.password = Utils.MD5(((TextBox)grid_Users.Rows[e.RowIndex].Cells[1].Controls[0]).Text);
        user.fullname = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        user.email = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[3].FindControl("txt_Email")).Text;
        user.birthDay = Convert.ToDateTime(((TextBox)grid_Users.Rows[e.RowIndex].Cells[4].FindControl("txt_Birthday")).Text);
        user.tel = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[5].FindControl("txt_Tel")).Text;
        user.address = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[6].FindControl("txt_Address")).Text;
        user.idCard = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[7].FindControl("txt_IDCard")).Text;
        //TextBox decentralize = (TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0];
        user.decentralize = ((DropDownList)grid_Users.Rows[e.RowIndex].FindControl("ddl_Decentralize")).SelectedValue.ToString();
        user.isActived = Convert.ToInt32(((DropDownList)grid_Users.Rows[e.RowIndex].FindControl("ddl_IsActived")).SelectedValue.ToString());
    }

    
    protected void grid_Users_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        grid_Users.PageIndex = e.NewPageIndex;
        FillDataInGrid("Username");
    }
    protected void grid_Users_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataInGrid(e.SortExpression);
    }

    protected void grid_Users_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_Users.EditIndex = -1;
        FillDataInGrid("Username");
    }

    protected void grid_Users_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GetDataForUserFromGrid(e);
        if (user.Update())
        {
            grid_Users.EditIndex = -1;
            FillDataInGrid("Username");
            lb_Note.ForeColor = System.Drawing.Color.Green;
            lb_Note.Text = "Cập nhật username:" + user.username + " thành công";
        }
        else
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Cập nhật username:" + user.username + " lỗi. Email này đã được sử dụng.";
        }
    }

    protected void grid_Users_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        user.username = grid_Users.DataKeys[e.RowIndex].Values[0].ToString();
        string result = user.Delete();
        if (result == "")
        {
            lb_Note.ForeColor = System.Drawing.Color.Green;
            lb_Note.Text = "Xóa thành công username:" + user.username;
            FillDataInGrid("Username");
        }
        else
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Lỗi : không thể xóa username : " + user.username;
        }
    }

    protected void grid_Users_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            LinkButton btnCancel = (LinkButton)e.Row.Cells[10].Controls[0];
            btnCancel.OnClientClick = "if (!confirm('Bạn có chắc chắn muốn xóa User này không?')) return false";

        }

    }

    protected void grid_Users_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void grid_Users_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_Users.EditIndex = e.NewEditIndex;
        FillDataInGrid("Username");
    }
    protected void btn_Search_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = user.Search(txt_Username_Search.Text, txt_Fullname_Search.Text, txt_Email_Search.Text, ddl_Decentralize_Search.SelectedValue.ToString(), ddl_IsActived_Search.SelectedValue.ToString());
        dt.DefaultView.Sort = "Username";
        grid_Users.DataSource = dt;
        grid_Users.DataBind();
    }
    
}