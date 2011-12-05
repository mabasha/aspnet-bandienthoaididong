using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EmployeeReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    void FillData()
    {
        if (tFrom.Text != "" && tTo.Text != "")
        {
            DateTime from = DateTime.Parse(tFrom.Text);
            DateTime to = DateTime.Parse(tTo.Text);
            gShow.DataSource = SaleBill.EmployeeReport(tKeyword.Text, from, to);
        }
        else
        {
            gShow.DataSource = SaleBill.EmployeeReport(tKeyword.Text);
        }
        
        gShow.DataBind();
    }
    protected void bView_Click(object sender, EventArgs e)
    {
        FillData();
    }
}
