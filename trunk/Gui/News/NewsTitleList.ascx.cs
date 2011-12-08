using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_News_NewsTitleList : System.Web.UI.UserControl
{
    public String OrderBy
    {
        get{ return orderby;}
        set{orderby = value;}
    }

    public int Number
    {
        get { return number; }
        set { number = value; }
    }

    public bool IsAsc
    {
        get { return isAsc; }
        set { isAsc = value; }
    }

    string orderby="id";
    public int number = 5;
    bool isAsc = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = News.GetTitles(number, orderby, isAsc);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
}
