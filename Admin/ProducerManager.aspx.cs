using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProducerManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        AccessData.ExecuteNonQuery("insert into Producer(ID, Name) values"+
            "('','"+tName.Text+"')");
        Response.Write("<div class=info>* Thêm thành công.</div>");
    }
}
