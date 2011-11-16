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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataInGrid();
        }
    }
    
    AccessData ac = new AccessData();

    private void FillDataInGrid()
    {
        SqlConnection conn = new SqlConnection(ac.ConnectString);
        SqlDataAdapter sqldata = new SqlDataAdapter("Select * from Users", conn);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            sqldata.Fill(dt);
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
            btnCancel.OnClientClick = "if (!confirm('Bạn có đồng ý hủy')) return false";

        }
    }
    protected void grid_Users_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string username = grid_Users.DataKeys[e.RowIndex].Value.ToString();
        TextBox password = (TextBox)grid_Users.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox fullName = (TextBox)grid_Users.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox birthDay = (TextBox)grid_Users.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox tel = (TextBox)grid_Users.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox address = (TextBox)grid_Users.Rows[e.RowIndex].Cells[5].Controls[0];
        TextBox idCard = (TextBox)grid_Users.Rows[e.RowIndex].Cells[6].Controls[0];
        //TextBox decentralize = (TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0];
        DropDownList decentralize = (DropDownList)grid_Users.Rows[e.RowIndex].FindControl("cmbDecentralize");

        string sql = "UPDATE Users SET Password=N'" + password.Text + "', FullName=N'" + fullName.Text + "', Tel='" +
            tel.Text + "', BirthDay='"+birthDay.Text+"',Address=N'" + address.Text + "', IDCard='" + idCard.Text + "', Decentralize='" +
            decentralize.SelectedValue.ToString() + "' Where Username='" + username + "'";

        ac.ExeCuteNonquery(sql);
        
        //ac.ExeCuteNonquery("UPDATE User SET Password='" + password.Text + "', FullName='" + fullName.Text + "', BirthDay='" + birthDay.Text + "', Tel='" + tel.Text + "', Address='" + address.Text + "', IDCard='" + idCard.Text + "', Decentralize='" + decentralize.Text + "' WHERE Username=" + int.Parse(username.Text) + "");
        grid_Users.EditIndex = -1;
        FillDataInGrid();
    }
    protected void grid_Users_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_Users.EditIndex= e.NewEditIndex;
        FillDataInGrid();
    }
    protected void grid_Users_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string username = grid_Users.DataKeys[e.RowIndex].Values[0].ToString();
        if (1>0)
        {
            ac.ExeCuteNonquery("Delete from Users where Username='" + username + "'");
            lb_Note.Text = "Delete username:" + username + " successfully";
            FillDataInGrid();
        } 
        else
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Delete username:" + username + " failed";
        }
        
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        // Check xem user có tồn tại trong database hay chưa.
        if (txt_Username.Text=="" || txt_Password.Text=="" || txt_Fullname.Text=="" || txt_Tel.Text=="" || txt_BirthDay.Text=="" || 
            txt_Address.Text=="" || txt_IDCard.Text=="")
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. Please complete the information.";
            FillDataInGrid();
        } 
        else
        {
            string username = txt_Username.Text;
            string sql = "Select Count(*) From Users Where Username='" + username + "'";
            int temp = int.Parse(ac.ExecuteScalar(sql));
            if (temp > 0)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. This username is exist.";
                FillDataInGrid();
            }
            else
            {
                sql = "Insert into Users (Username, Password, FullName, Tel, BirthDay, Address, IDCard, Decentralize) Values (N'" +
                username + "', N'" + txt_Password.Text + "', N'" + txt_Fullname.Text + "', '" + txt_Tel.Text + "', '" + txt_BirthDay.Text
                + "', N'" + txt_Address.Text + "', " + int.Parse(txt_IDCard.Text) + ", '" + ddl_Decentralize.SelectedValue.ToString() + "')";
                ac.ExeCuteNonquery(sql);
                lb_Note.ForeColor = System.Drawing.Color.Green;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " successfully";
                FillDataInGrid();
            }
        }
       
    }
}