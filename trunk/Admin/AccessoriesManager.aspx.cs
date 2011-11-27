using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_AccessoriesManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dtProducer = Producer.GetAll();
            cProducer.DataSource = dtProducer;
            cProducer.DataTextField = "Name";
            cProducer.DataValueField = "ID";
            cProducer.DataBind();
        }
    }
    protected void bShowImage_Click(object sender, EventArgs e)
    {
        if (bShowImage.Text == "Hiện hình ảnh")
        {
            if (tImageName.Text != "")
            {
                iAdd.ImageUrl = "~/Images/Phone/" + tImageName.Text;
                bShowImage.Text = "Ẩn hình ảnh";
            }
        }
        else if (bShowImage.Text == "Ẩn hình ảnh")
        {
            iAdd.ImageUrl = "";
            bShowImage.Text = "Hiện hình ảnh";
        }
    }
}
