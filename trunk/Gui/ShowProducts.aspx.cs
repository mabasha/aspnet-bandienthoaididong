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

public partial class Gui_ShowProducts : System.Web.UI.Page
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
        SqlConnection conn = new SqlConnection(ac.ConnectString);
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
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="Chon_mua")
        {
            //Xác định chỉ số dòng.
            int index = int.Parse(e.CommandArgument.ToString());
            Label donGia = (Label)grid_Phone.Rows[index].FindControl("lb_Price");
            int temp = int.Parse(ViewState["TongSoLuong"].ToString());
            temp += 1;
            ViewState["TongSoLuong"] = temp.ToString();
            temp = int.Parse(ViewState["TongTien"].ToString());
            temp += int.Parse(donGia.Text);
            ViewState["TongTien"] = temp.ToString();
            lb_SoLuong.Text = ViewState["TongSoLuong"].ToString();
            lb_TriGia.Text = String.Format("{0:0,0 VNĐ}", temp);
        }
    }
}