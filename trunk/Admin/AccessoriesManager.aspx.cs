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

            FillData();

        }
    }

    void FillData(String sortExp)
    {
        DataTable dtAcc = Accessory.GetAll();
        if (sortExp != "")
        {
            dtAcc.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dtAcc;
        gShow.DataBind();
    }

    void FillData()
    {
        FillData("");
    }

    protected void bShowImage_Click(object sender, EventArgs e)
    {
        if (bShowImage.Text == "Hiện hình ảnh")
        {
            if (tImageName.Text != "")
            {
                iAdd.ImageUrl = "~/Images/Accessory/" + tImageName.Text;
                bShowImage.Text = "Ẩn hình ảnh";
            }
        }
        else if (bShowImage.Text == "Ẩn hình ảnh")
        {
            iAdd.ImageUrl = "";
            bShowImage.Text = "Hiện hình ảnh";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        Accessory acc = new Accessory(0, tName.Text, Convert.ToInt32(cProducer.SelectedItem.Value),
            Convert.ToDouble(tPrice.Text),tImageName.Text,tDescription.Text);
        bool isSuccess = acc.Insert();
        if (isSuccess == true)
        {
            lThongBao.Text = "<p class=info>* Thêm thành công.</p>";
            tName.Text = "";
            tPrice.Text = "";
            tImageName.Text = "";
            tDescription.Text = "";
            FillData();
        }
        else
        {
            lThongBao.Text = "<p class=error>* Tên đã tồn tại.</p>";
        }
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
}
