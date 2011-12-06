using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_NewsAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                News news = new News(id);
                news.GetInfoByID();
                tTitle.Text = news.title;
                dCategory.SelectedIndex = dCategory.Items.IndexOf(dCategory.Items.FindByText(news.category));
                tAuthor.Text = news.author;
                tIntro.Text = news.introContent;
                ckContent.Text = news.content;

                Page.Title = "Cập nhật tin tức.";
                bAdd.Text = "Cập nhật";
                lTitle.Text = "Cập nhật tin tức";
            }
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        if (ckContent.Text == "")
        {
            tInfo.Text = "<span class = error>Bạn chưa nhập nội dung.</span>";
            return;
        }
        int id = Convert.ToInt32(Request.QueryString["id"]);
        string content = ckContent.Text;
        content = content.Replace("'", "''");
        News news = new News(id, tTitle.Text, tIntro.Text, content,
            tAuthor.Text, dCategory.SelectedValue.ToString(), DateTime.Now);

        if (id == 0)         //add
        {
            news.Insert();
        }
        else                 //edit
        {
            news.Update();
        }
        Response.Redirect("NewsManager.aspx");
    }
}
