using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Gui_News_ShowNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            Sanpham_Load();
            Congnghe_Load();
            //Thuthuat_Load();
            //Nhanvat_Load();
        }
    }
    private void Sanpham_Load()
    {
        int id = News.GetMaxID_Sanpham();
        imgSp.ImageUrl = "~/Images/News/" + News.GetImage(id);
        hlTitleSp.Text = News.GetTitle(id);
        hlTitleSp.NavigateUrl = "NewsDetails.aspx?id=" + id;
        lbIntroSp.Text = News.GetIntro(id);

        hlSp2.Text = News.GetTitle(News.GetElementIDNo(2, "Sản phẩm"));
        hlSp2.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(2, "Sản phẩm");
        hlSp3.Text = News.GetTitle(News.GetElementIDNo(3, "Sản phẩm"));
        hlSp3.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(3, "Sản phẩm");
    }
    private void Congnghe_Load()
    {
        int id = News.GetMaxID_Congnghe();
        imgCn.ImageUrl = "~/Images/News/" + News.GetImage(id);
        hlTitleCn.Text = News.GetTitle(id);
        hlTitleCn.NavigateUrl = "NewsDetails.aspx?id=" + id;
        lbIntroCn.Text = News.GetIntro(id);

        hlCn2.Text = News.GetTitle(News.GetElementIDNo(2, "Công Nghệ"));
        hlCn2.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(2, "Công nghệ");
        hlCn3.Text = News.GetTitle(News.GetElementIDNo(3, "Công Nghệ"));
        hlCn3.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(3, "Công Nghệ");
    }
    private void Thuthuat_Load()
    {
        int id = News.GetMaxID_Thuthuat();
        imgTt.ImageUrl = "~/Images/News/" + News.GetImage(id);
        hlTitleTt.Text = News.GetTitle(id);
        hlTitleTt.NavigateUrl = "NewsDetails.aspx?id=" + id;
        lbIntroTt.Text = News.GetIntro(id);

        hlTt2.Text = News.GetTitle(News.GetElementIDNo(2, "Thủ thuật"));
        hlTt2.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(2, "Thủ thuật");
        hlTt3.Text = News.GetTitle(News.GetElementIDNo(3, "Thủ thuật"));
        hlTt3.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(3, "Thủ thuật");
    }
    private void Nhanvat_Load()
    {
        int id = News.GetMaxID_Nhanvat();
        imgNv.ImageUrl = "~/Images/News/" + News.GetImage(id);
        hlTitleNv.Text = News.GetTitle(id);
        hlTitleNv.NavigateUrl = "NewsDetails.aspx?id=" + id;
        lbIntroNv.Text = News.GetIntro(id);

        hlNv2.Text = News.GetTitle(News.GetElementIDNo(2, "Nhân vật"));
        hlNv2.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(2, "Nhân vật");
        hlNv3.Text = News.GetTitle(News.GetElementIDNo(3, "Nhân vật"));
        hlNv3.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(3, "Nhân vật");
    }
}
