using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_Order_CartHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData("");
        }
    }

    void FillData(string sortExp)
    {
        int status = dStatus.SelectedIndex-1;
        DateTime dFrom, dTo;
        string username = null;
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
            username = Session["username"].ToString();
        else if (cookie != null)
            username = cookie["username"].ToString();
        if (username == null) return;

        try{
            dFrom = Convert.ToDateTime(tFrom.Text);
            dTo = Convert.ToDateTime(tTo.Text);
        }
        catch{
            dFrom = new DateTime(1900,1,1);
            dTo = new DateTime(2100,1,1);
        }
        
        DataTable dtPhone = Orders.GetAll(tKeyword.Text, 
            dFrom, dTo, status,true,username);
        DataTable dtAcc = Orders.GetAll(tKeyword.Text,
            dFrom, dTo, status, false,username);

        if (sortExp != "")
        {
            dtPhone.DefaultView.Sort = sortExp;
            dtAcc.DefaultView.Sort = sortExp;
        }
        gShowPhone.DataSource = dtPhone;
        gShowPhone.DataBind();
        gShowAcc.DataSource = dtAcc;
        gShowAcc.DataBind();
    }
    protected void bSearch_Click(object sender, ImageClickEventArgs e)
    {
        FillData("");
    }
    protected void gShowPhone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowPhone.PageIndex = e.NewPageIndex;
        FillData("");
    }
    protected void gShowPhone_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShowAcc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowAcc.PageIndex = e.NewPageIndex;
        FillData("");
    }
    protected void gShowAcc_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
}