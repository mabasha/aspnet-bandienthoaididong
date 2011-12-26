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
            Thuthuat_Load();
            Nhanvat_Load();
        }
    }
    private void Sanpham_Load()
    {
        int id = News.GetMaxID_Product();
        if (id != -1)
        {
            imgSp.ImageUrl = "~/Images/News/" + News.GetImage(id);
            hlTitleSp.Text = News.GetTitle(id);
            hlTitleSp.NavigateUrl = "NewsDetails.aspx?id=" + id;
            lbIntroSp.Text = News.GetIntro(id);
        }
        else
        {
            hlCategory.Visible = false;
            imgSp.Visible = false;
            hlTitleSp.Visible = false;
            lbIntroSp.Visible = false;
        }

        int id2 = News.GetElementIDNo(2, "Sản phẩm");
        int id3 = News.GetElementIDNo(3, "Sản phẩm");

        if (id2 != -1)
        {
            hlSp2.Text = News.GetTitle(id2);
            hlSp2.NavigateUrl = "NewsDetails.aspx?id=" + id2;
        }
        else hlSp2.Visible = false;

        if (id3 != -1)
        {
            hlSp3.Text = News.GetTitle(id3);
            hlSp3.NavigateUrl = "NewsDetails.aspx?id=" + id3;
        }
        else hlSp3.Visible = false;

    }
    private void Congnghe_Load()
    {
        int id = News.GetMaxID_Technology();
        if (id != -1)
        {
            imgCn.ImageUrl = "~/Images/News/" + News.GetImage(id);
            hlTitleCn.Text = News.GetTitle(id);
            hlTitleCn.NavigateUrl = "NewsDetails.aspx?id=" + id;
            lbIntroCn.Text = News.GetIntro(id);
        }
        else
        {
            hlCongnghe.Visible = false;
            imgCn.Visible = false;
            hlTitleCn.Visible = false;
            lbIntroCn.Visible = false;
        }

        int id2 = News.GetElementIDNo(2, "Công Nghệ");
        int id3 = News.GetElementIDNo(3, "Công Nghệ");

        if (id2 != -1)
        {
            hlCn2.Text = News.GetTitle(id2);
            hlCn2.NavigateUrl = "NewsDetails.aspx?id=" + id2;
        }
        else hlCn2.Visible = false;

        if (id3 != -1)
        {
            hlCn3.Text = News.GetTitle(id3);
            hlCn3.NavigateUrl = "NewsDetails.aspx?id=" + id3;
        }
        else hlCn3.Visible = false;
    }
    private void Thuthuat_Load()
    {
        int id = News.GetMaxID_Tips();
        if (id != -1)
        {
            imgTt.ImageUrl = "~/Images/News/" + News.GetImage(id);
            hlTitleTt.Text = News.GetTitle(id);
            hlTitleTt.NavigateUrl = "NewsDetails.aspx?id=" + id;
            lbIntroTt.Text = News.GetIntro(id);
        }
        else
        {
            hlThuthuat.Visible = false;
            imgTt.Visible = false;
            hlTitleTt.Visible = false;
            lbIntroTt.Visible = false;
        }

        int id2 = News.GetElementIDNo(2, "Thủ thuật");
        int id3 = News.GetElementIDNo(3, "Thủ thuật");

        if (id2 != -1)
        {
            hlTt2.Text = News.GetTitle(News.GetElementIDNo(2, "Thủ thuật"));
            hlTt2.NavigateUrl = "NewsDetails.aspx?id=" + News.GetElementIDNo(2, "Thủ thuật");
        }
        else hlTt2.Visible = false;

        if (id3 != -1)
        {
            hlTt3.Text = News.GetTitle(id3);
            hlTt3.NavigateUrl = "NewsDetails.aspx?id=" + id3;
        }
        else hlTt3.Visible = false;
    }
    private void Nhanvat_Load()
    {
        int id = News.GetMaxID_Character();
        if (id != -1)
        {
            imgNv.ImageUrl = "~/Images/News/" + News.GetImage(id);
            hlTitleNv.Text = News.GetTitle(id);
            hlTitleNv.NavigateUrl = "NewsDetails.aspx?id=" + id;
            lbIntroNv.Text = News.GetIntro(id);
        }
        else
        {
            hlNhanvat.Visible = false;
            imgNv.Visible = false;
            hlTitleNv.Visible = false;
            lbIntroNv.Visible = false;
        }

        int id2 = News.GetElementIDNo(2, "Nhân vật");
        int id3 = News.GetElementIDNo(3, "Nhân vật");

        if (id2 != -1)
        {
            hlNv2.Text = News.GetTitle(id2);
            hlNv2.NavigateUrl = "NewsDetails.aspx?id=" + id2;
        }
        else hlNv2.Visible = false;

        if (id3 != -1)
        {
            hlNv3.Text = News.GetTitle(id3);
            hlNv3.NavigateUrl = "NewsDetails.aspx?id=" + id3;
        }
        else hlNv3.Visible = false;
    }
}
