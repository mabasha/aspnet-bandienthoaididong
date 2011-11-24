using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Producer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection mySqlCon;
    protected void btnThem_Click(object sender, EventArgs e)
    {
        string sql = ConfigurationManager.ConnectionStrings["MobileShopConnectionString"].ConnectionString;
        mySqlCon = new SqlConnection(sql);
        string strInsert = "insert into Producer(ID, Name) values(@ID,@Name)";
        SqlCommand mySqlCom = new SqlCommand(strInsert, mySqlCon);
        mySqlCom.Parameters.AddWithValue("@ID", txtMaNsx.Text);
        mySqlCom.Parameters.AddWithValue("@Name", txtTenNsx.Text);
        mySqlCom.Connection.Open();
        mySqlCom.ExecuteNonQuery();
        mySqlCom.Connection.Close();
        txtMaNsx.Text = "";
        txtTenNsx.Text = "";
        //BindGrid();
    }

    //public void BindGrid()
    //{
    //    SqlDataAdapter mySqlda = new SqlDataAdapter("select * from Producer", mySqlCon);
    //    DataSet myds = new DataSet();
    //    mySqlda.Fill(myds, "Producer");
    //    gridNsx.DataSource = myds.Tables["Producer"];
    //    //gridNsx.DataBind();
    //}
    protected void gridNsx_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
                    e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnCancel = (ImageButton)e.Row.Cells[3].Controls[0];
            btnCancel.OnClientClick = "if (!confirm('Bạn có đồng ý xóa?')) return false";

        }
    }
    //AccessData ac = new AccessData();
    //protected void gridNsx_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string vitri = gridNsx.DataKeys[e.RowIndex].Values[0].ToString();
    //    ac.ExeCuteNonquery("Delete from Producer where ID='" + vitri + "'");
    //    //lb_Note.Text = "Delete username:" + username + " successfully";
    //    //int ma = gridNsx.DataKeys(e.RowIndex).Value;
    //    SqlConnection conn = new SqlConnection(ac.ConnectString);
    //    SqlDataAdapter sqldata = new SqlDataAdapter("Select * from Producer", conn);
    //    DataTable dt = new DataTable();
    //    try
    //    {
    //        conn.Open();
    //        sqldata.Fill(dt);
    //        gridNsx.DataSource = dt;
    //        gridNsx.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("<script>alert(" + ex.Message + ")</script>");
    //    }
    //    finally
    //    {
    //        conn.Close();
    //    }

    //}
}
