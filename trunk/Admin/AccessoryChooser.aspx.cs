using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_AccessoryChooser : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData();
        }
        string receiveID = Request.QueryString["receiveID"];
        string javascript = String.Format("window.opener.$('#{0}').val($('#hChoosed').val()); self.close();", receiveID);
        bClose.OnClientClick = javascript;
    }

    void FillData(string sortExp)
    {
        DataTable dAcc = Accessory.GetAllWithKeyword(tKeyword.Text);
        
        if (sortExp != "")
        {
            dAcc.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dAcc;
        gShow.DataBind();
    }

    void FillData()
    {
        FillData("");
    }
    protected void bSearch_Click(object sender, EventArgs e)
    {
        FillData();
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        hChoosed.Value = gShow.SelectedRow.Cells[0].Text;
    }
}
