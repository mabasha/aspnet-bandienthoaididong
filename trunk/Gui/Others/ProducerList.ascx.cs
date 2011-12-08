using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_Others_ProducerList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = Producer.GetAll();
            dt.DefaultView.Sort = "Name";
            dShow.DataSource = dt;
            dShow.DataBind();
        }
    }
}
