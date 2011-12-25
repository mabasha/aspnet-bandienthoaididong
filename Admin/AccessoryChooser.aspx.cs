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
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
        {

            CheckLogin(Session["username"].ToString());
        }
        else if (cookie != null)
        {
            CheckLogin(cookie["username"].ToString());
        }
        else
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
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

    /*
     * Check Login xem username đang login có phải là admin hoặc employee không, nếu không thì cho ra ngoài trang Home của GUI
     */
    private void CheckLogin(string username)
    {
        Account user = new Account();
        user.username = username;
        user.GetInfoByUsername();
        if (user.decentralize == "Client")
        {
            Response.Redirect("~/GUI/HomePage.aspx");
        }
    }
}
