using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
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


            string script = String.Format("window.open(\"ImageManager.aspx?receiveInputID={0}\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tImageName.ClientID);
            bChooseImage.OnClientClick = script;
        }
        lInfo.Text = "";
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

    void FillDataSearch(string sortExp, string name)
    {
        DataTable dtAcc = Accessory.GetAllWithKeyword(name);
        if (sortExp != "")
        {
            dtAcc.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dtAcc;
        gShow.DataBind();
    }

    void FillDataSearch(string name)
    {
        FillDataSearch("", name);
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
            Convert.ToDouble(tPrice.Text),tImageName.Text,tDescription.Text, 0);
        bool isSuccess = acc.Insert();
        if (isSuccess == true)
        {
            lInfo.Text = "<div class=valid_box>THÊM THÀNH CÔNG </div>";
            tName.Text = "";
            tPrice.Text = "";
            tImageName.Text = "";
            tDescription.Text = "";
            FillData();
        }
        else
        {
            lInfo.Text = "<div class=error_box>TÊN ĐÃ TỒN TẠI </div>";
        }
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataSearch(e.SortExpression, tInput.Text);
    }
    protected void gShow_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[7].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa NPP này không ?')) return false;";
            
        }
    }
    protected void gShow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gShow.EditIndex = e.NewEditIndex;
        FillData();

        //Lấy dữ liệu từ trang popup
        Button bChooseImageTemplate = (Button)gShow.Rows[gShow.EditIndex].FindControl("bChooseImageTemplate");
        TextBox tImageNameTemplate = (TextBox)gShow.Rows[gShow.EditIndex].FindControl("tImageNameTemplate");
        bChooseImageTemplate.OnClientClick = String.Format("window.open(\"ImageManager.aspx?receiveInputID={0}\", 'mypopup', " +
            "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tImageNameTemplate.ClientID);
    }
    protected void gShow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gShow.EditIndex = -1;
        FillData();

    }
    protected void gShow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sID = gShow.Rows[e.RowIndex].Cells[0].Text;
        TextBox tNameUpdate = (TextBox)gShow.Rows[e.RowIndex].Cells[1].Controls[0];
        DropDownList dProducerUpdate = (DropDownList)gShow.Rows[e.RowIndex].FindControl("dProducerName");//(DropDownList)gShow.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox tPriceUpdate = (TextBox)gShow.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox lImageNameTemplate = (TextBox)gShow.Rows[e.RowIndex].FindControl("tImageNameTemplate");
        TextBox tDescriptionUpdate = (TextBox)gShow.Rows[e.RowIndex].Cells[5].Controls[0];

        int ID = Convert.ToInt32(sID);
        string name = tNameUpdate.Text;
        int producerID = Convert.ToInt32(dProducerUpdate.SelectedValue);
        double price = Convert.ToDouble(tPriceUpdate.Text);
        string imageName = lImageNameTemplate.Text;
        string description = tDescriptionUpdate.Text;

        if (name != "" && tPriceUpdate.Text != "" && imageName != "" && description != null)
        {
            Accessory acc = new Accessory(ID, name, producerID, price, imageName, description, 0);
            acc.Update();
            gShow.EditIndex = -1;
            FillData();
        }
    }
    protected void gShow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Accessory acc = new Accessory(Convert.ToInt32(gShow.Rows[e.RowIndex].Cells[0].Text));
        string result = acc.Delete();
        if (result == "")    //không có lỗi
            FillData();
        else lInfo.Text = "<span style=\"color:red;\">LỖI : Không xóa được, xóa các đối tượng liên quan trước.</span>";
    }
    protected void bChooseImage_Click(object sender, EventArgs e)
    {

    }
    protected void gShow_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void bSearch_Click(object sender, EventArgs e)
    {
        FillDataSearch("", tInput.Text);
    }
}
