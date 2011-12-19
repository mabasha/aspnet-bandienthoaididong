using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Gui_ProfileUser : System.Web.UI.Page
{
    static Account user = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
            {
                user.username = Session["username"].ToString();
                user.GetInfoByUsername();
                FillDataInDetailViews();
            }
            else if (cookie != null)
            {
                user.username = cookie["username"].ToString();
                user.GetInfoByUsername();
                FillDataInDetailViews();
            }
            else
            {
                Response.Redirect("~/GUI/HomePage.aspx");
            }
        }
    }

    private void FillDataInDetailViews()
    {
        DataTable dt = Account.GetUser(user.username);
        dtviews_User.DataSource = dt;
        dtviews_User.DataBind();
    }

    protected void dtviews_User_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                {
                    dtviews_User.ChangeMode(DetailsViewMode.Edit);
                    FillDataInDetailViews();
                    break;
                }
            case "Cancel":
                {
                    dtviews_User.ChangeMode(DetailsViewMode.ReadOnly);
                    FillDataInDetailViews();
                    break;
                }
        }
    }

    protected void dtviews_User_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        GetDataForUserFromDetailViews();
        bool temp = user.Update();
        if (temp)
        {
            //Label lb = (Label)dtviews_User.Rows[1].FindControl("lb_Note");
            lb_Note.ForeColor = Color.Green;
            lb_Note.Text = "Cập nhật thành công";
            dtviews_User.ChangeMode(DetailsViewMode.ReadOnly);
            FillDataInDetailViews();
        }
        else
        {
            //Label lb = (Label)dtviews_User.Rows[1].FindControl("lb_Note");
            lb_Note.ForeColor = Color.Red;
            lb_Note.Text = "Cập nhật thất bại, vui lòng điền email khác";
        }
    }

    protected void dtviews_User_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }

    private void GetDataForUserFromDetailViews()
    {
        user.username = dtviews_User.DataKey.Value.ToString();
        user.password = ((TextBox)dtviews_User.Rows[3].FindControl("txt_Password")).Text;
        user.fullname = ((TextBox)dtviews_User.Rows[4].Cells[1].Controls[0]).Text;
        user.email = ((TextBox)dtviews_User.Rows[5].Cells[1].Controls[0]).Text;
        user.birthDay = Convert.ToDateTime(((TextBox)dtviews_User.Rows[6].FindControl("txt_BirthDay")).Text);
        user.tel = ((TextBox)dtviews_User.Rows[7].Cells[1].Controls[0]).Text;
        user.address = ((TextBox)dtviews_User.Rows[8].FindControl("txt_Address")).Text;
        user.idCard = int.Parse(((TextBox)dtviews_User.Rows[7].Cells[1].Controls[0]).Text);
    }
}