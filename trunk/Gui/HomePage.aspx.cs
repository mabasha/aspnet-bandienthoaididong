using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

public partial class Gui_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = Producer.GetName();
            dt.DefaultView.Sort = "Name";
            //dt.Rows.Add("Tất cả các hãng");

            dProducer.DataSource = dt;
            dProducer.DataTextField="Name";
            dProducer.DataValueField="Name";
            dProducer.DataBind();
            dProducer.Items.Add("Tất cả các hãng");
            dProducer.SelectedIndex = dProducer.Items.Count - 1;
        }
    }
}
