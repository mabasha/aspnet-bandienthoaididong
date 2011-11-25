using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DistributorManager : System.Web.UI.Page
{
    private void FillData()
    {
        gShow.DataSource = Distributor.GetAll();
        gShow.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            FillData();
            lThongBao.Text = "";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {
        if (tName.Text != "" && tAddress.Text != "")
        {
            Distributor dis = new Distributor(tName.Text, tAddress.Text);
            bool isSuccess = dis.Insert();
            if (isSuccess == true)
            {
                lThongBao.Text = "<p class=info>* Thêm thành công.</p>";
                tName.Text = "";
                tAddress.Text = "";
            }
            else
            {
                lThongBao.Text = "<p class=error>* Tên đã tồn tại.</p>";
            }
        }
        else
        {
            lThongBao.Text = "<p class=error>* Bạn chưa nhập đầy đủ thông tin.</p>";
        }
    }
}
