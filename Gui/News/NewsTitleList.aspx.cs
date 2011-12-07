using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_News_NewsTitleList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int number=5;
        string orderby = "id";
        bool isAsc = false;
        if(Request.QueryString["number"]!=null)
            number = Convert.ToInt32(Request.QueryString["number"]);
        if(Request.QueryString["orderby"]!=null)
            orderby = (string)Request.QueryString["orderby"];
        if(Request.QueryString["isAsc"]!=null)
            isAsc = Convert.ToBoolean(Request.QueryString["isAsc"]);

        DataTable dt = News.GetTitles(number, orderby, isAsc);

        foreach(DataRow row in dt.Rows)
        {
            Label label = new Label();
            string title = (string)row["Title"];
            label.Text = "<br>"+title;

            pContainer.Controls.Add(label);
        }
    }
}
