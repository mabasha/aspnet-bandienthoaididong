﻿using System;
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
            Button btnCancel = (Button)e.Row.Cells[10].Controls[0];
            btnCancel.OnClientClick = "if (!confirm('Bạn có chắc chắn muốn xóa User này không?')) return false";

        }
    }
    protected void grid_Users_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string username = grid_Users.DataKeys[e.RowIndex].Value.ToString();
        TextBox password = (TextBox)grid_Users.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox fullName = (TextBox)grid_Users.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox email = (TextBox)grid_Users.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox birthDay = (TextBox)grid_Users.Rows[e.RowIndex].Cells[4].FindControl("Birthday");
        TextBox tel = (TextBox)grid_Users.Rows[e.RowIndex].Cells[5].Controls[0];
        TextBox address = (TextBox)grid_Users.Rows[e.RowIndex].Cells[6].Controls[0];
        TextBox idCard = (TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0];
        //TextBox decentralize = (TextBox)grid_Users.Rows[e.RowIndex].Cells[7].Controls[0];
        DropDownList decentralize = (DropDownList)grid_Users.Rows[e.RowIndex].FindControl("cmbDecentralize");

        string sql = "UPDATE Users SET Password=N'" + password.Text + "', FullName=N'" + fullName.Text + "', Tel='" +
            tel.Text + "', Email='"+email.Text+"', BirthDay='"+birthDay.Text+"',Address=N'" + address.Text + "', IDCard='" + idCard.Text + "', Decentralize='" +
            decentralize.SelectedValue.ToString() + "' Where Username='" + username + "'";

        AccessData.ExecuteNonQuery(sql);
        
        //ac.ExeCuteNonquery("UPDATE User SET Password='" + password.Text + "', FullName='" + fullName.Text + "', BirthDay='" + birthDay.Text + "', Tel='" + tel.Text + "', Address='" + address.Text + "', IDCard='" + idCard.Text + "', Decentralize='" + decentralize.Text + "' WHERE Username=" + int.Parse(username.Text) + "");
        grid_Users.EditIndex = -1;
        FillDataInGrid("Username");
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
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        
        if (txt_Username.Text=="" || txt_Password.Text=="" || txt_Fullname.Text=="" || txt_Tel.Text=="" || txt_BirthDay.Text=="" || 
            txt_Address.Text=="" || txt_IDCard.Text=="")
        {
            lb_Note.ForeColor = System.Drawing.Color.Red;
            lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. Please complete the information.";
            
        } 
        else
        {
            string username = txt_Username.Text;
            string email = txt_Email.Text;
            // Check xem user có tồn tại trong database hay chưa.
            string sql1 = "SELECT Count(*) FROM Users WHERE Username='" + username + "'";
            string sql2 = "SELECT Count(*) FROM Users WHERE Email='" + email + "'";
            int temp1 = Convert.ToInt32(AccessData.ExecuteScalar(sql1));
            int temp2 = Convert.ToInt32(AccessData.ExecuteScalar(sql2));
            if (temp1 > 0)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. This username is exist.";
                //FillDataInGrid("Username");
            }else if (temp2 > 0)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " failed. This email is exist.";
            }
            else
            {
                sql1 = "Insert into Users (Username, Password, FullName, Email, Tel, BirthDay, Address, IDCard, Decentralize) Values (N'" +
                username + "', N'" + txt_Password.Text + "', N'" + txt_Fullname.Text + "', N'" + txt_Email.Text + "','" + txt_Tel.Text + "', '" + txt_BirthDay.Text
                + "', N'" + txt_Address.Text + "', " + int.Parse(txt_IDCard.Text) + ", '" + ddl_Decentralize.SelectedValue.ToString() + "')";
                AccessData.ExecuteNonQuery(sql1);
                lb_Note.ForeColor = System.Drawing.Color.Green;
                lb_Note.Text = "Insert username:" + txt_Username.Text + " successfully";
                //FillDataInGrid();
            }
        }
        FillDataInGrid("Username");
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
}