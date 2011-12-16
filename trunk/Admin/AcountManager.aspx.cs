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

    protected void grid_Users_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate || 
            e.Row.RowState == DataControlRowState.Normal))
        {
            Button btnCancel = (Button)e.Row.Cells[9].Controls[0];
            btnCancel.OnClientClick = "if (!confirm('Bạn có chắc chắn muốn xóa User này không?')) return false";

        }
    }
    protected void grid_Users_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GetDataForUserFromGrid(e);
        if (user.Update())
        {
            grid_Users.EditIndex = -1;
            FillDataInGrid("Username");
            lb_Note.ForeColor = System.Drawing.Color.Green;
            lb_Note.Text = "Update username:" + user.username + " successfully";
        } 
        else
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Update username:" + user.username + " failed. This email is exist.";
        }
        
    }
    protected void grid_Users_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_Users.EditIndex= e.NewEditIndex;
        FillDataInGrid("Username");
    }
    protected void grid_Users_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string username = grid_Users.DataKeys[e.RowIndex].Values[0].ToString();
        if (1>0)
        {
            AccessData.ExecuteNonQuery("Delete from Users where Username='" + username + "'");
            lb_Note.Text = "Delete username:" + username + " successfully";
            FillDataInGrid("Username");
        } 
        else
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Delete username:" + username + " failed";
        }
        
    }
    
    protected void grid_Users_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_Users.EditIndex = -1;
        FillDataInGrid("Username");
    }
    protected void grid_Users_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Users.PageIndex = e.NewPageIndex;
        FillDataInGrid("Username");
    }
    protected void grid_Users_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataInGrid(e.SortExpression);
    }

    

    private void GetDataForUserFromGrid(GridViewUpdateEventArgs e)
    {
        user.username = grid_Users.DataKeys[e.RowIndex].Value.ToString();
        user.password = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        user.fullname = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        user.email = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        user.birthDay = Convert.ToDateTime(((TextBox)grid_Users.Rows[e.RowIndex].Cells[4].FindControl("Birthday")).Text);
        user.tel = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        user.address = ((TextBox)grid_Users.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        user.idCard = Convert.ToInt32(((TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0]).Text);
        //TextBox decentralize = (TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0];
        user.decentralize = ((DropDownList)grid_Users.Rows[e.RowIndex].FindControl("cmbDecentralize")).SelectedValue.ToString();
    }
}