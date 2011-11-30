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

public partial class Gui_AccessoryDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != "")
        {
            int id = int.Parse(Request.QueryString["id"]);
            DataTable dt = AccessData.GetTable("SELECT * FROM Accessory WHERE id=" + id);
            Label1.Text = dt.Rows[0]["Description"].ToString();
        }
    }
}