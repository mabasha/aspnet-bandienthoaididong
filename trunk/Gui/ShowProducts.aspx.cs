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
}