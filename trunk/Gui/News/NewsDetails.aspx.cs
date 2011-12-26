using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_News_NewsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {            
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string category = News.GetCategory(id);
            hlCategory.Text = category;
            if(category=="Sản phẩm")
                hlCategory.NavigateUrl = "Product.aspx";
            if (category == "Công nghệ")
                hlCategory.NavigateUrl = "Technology.aspx";
            if (category == "Thủ thuật")
                hlCategory.NavigateUrl = "Tips.aspx";
            if (category == "Nhân vật")
                hlCategory.NavigateUrl = "Character.aspx";
            lbTitle.Text = News.GetTitle(id);
            lbDate.Text = "Cập nhật ngày: " + News.GetCreatedDate(id);
            
            lbIntro.Text = News.GetIntro(id);
            divContents.InnerHtml = News.GetContents(id);
            lbAuthor.Text = News.GetAuthor(id);
            AccessData.ExecuteNonQuery(String.Format("update News set Views= Views+1 where ID ={0}", id));
        }
    }
}
