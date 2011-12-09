using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Gui_ShowProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataInGrid();
            ViewState["TongTien"] = 0;
            ViewState["TongSoLuong"] = 0;
        }
    }
    AccessData ac = new AccessData();
    private void FillDataInGrid()
    {
        string keyword="";
        string orderBy="Price";
        string producerName="";
        double priceFrom=0, priceTo = 100000000;
        bool isAsc = false;
        
        if(Request.QueryString["keyword"]!=null)
            keyword = Request.QueryString["keyword"];
        if(Request.QueryString["orderby"]!=null)
            orderBy = Request.QueryString["orderby"];
        if(Request.QueryString["ProducerName"]!=null)
            producerName = Request.QueryString["ProducerName"];
        if(Request.QueryString["priceFrom"]!=null)
            priceFrom = Convert.ToDouble(Request.QueryString["priceFrom"]);
        if(Request.QueryString["priceTo"]!=null)
            priceTo = Convert.ToDouble(Request.QueryString["priceTo"]);
        if (Request.QueryString["IsAsc"] != null)
            isAsc = Convert.ToBoolean(Request.QueryString["IsAsc"]);

        grid_Phone.DataSource = Phone.GetAll(keyword, priceFrom, priceTo, orderBy, producerName);
        grid_Phone.DataBind();
    }
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="Chon_mua")
        {
            //Xác định chỉ số dòng.
            int index = int.Parse(e.CommandArgument.ToString());
            Label donGia = (Label)grid_Phone.Rows[index].FindControl("lb_Price");
            int temp = int.Parse(ViewState["TongSoLuong"].ToString());
            temp += 1;
            ViewState["TongSoLuong"] = temp.ToString();
            temp = int.Parse(ViewState["TongTien"].ToString());
            temp += int.Parse(donGia.Text);
            ViewState["TongTien"] = temp.ToString();
            lb_SoLuong.Text = ViewState["TongSoLuong"].ToString();
            lb_TriGia.Text = String.Format("{0:0,0 VNĐ}", temp);
        }
    }
    protected void grid_Phone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Phone.PageIndex = e.NewPageIndex;
        FillDataInGrid();
    }
}