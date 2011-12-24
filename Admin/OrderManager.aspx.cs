using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_OrderManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData("");
        }
        lInfo.Text = "";
    }

    void FillData(string sortExp)
    {
        int status = dStatus.SelectedIndex - 1;
        DateTime dFrom, dTo;

        try
        {
            dFrom = Convert.ToDateTime(tFrom.Text);
            dTo = Convert.ToDateTime(tTo.Text);
        }
        catch
        {
            dFrom = new DateTime(1900, 1, 1);
            dTo = new DateTime(2100, 1, 1);
        }

        DataTable dtPhone = Orders.GetAll(tKeyword.Text,
            dFrom, dTo, status, true);
        DataTable dtAcc = Orders.GetAll(tKeyword.Text,
            dFrom, dTo, status, false);

        if (sortExp != "")
        {
            dtPhone.DefaultView.Sort = sortExp;
            dtAcc.DefaultView.Sort = sortExp;
        }
        gShowPhone.DataSource = dtPhone;
        gShowPhone.DataBind();
        gShowAcc.DataSource = dtAcc;
        gShowAcc.DataBind();
    }
    protected void bSearch_Click(object sender, ImageClickEventArgs e)
    {
        FillData("");
    }
    protected void gShowPhone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowPhone.PageIndex = e.NewPageIndex;
        FillData("");
    }
    protected void gShowPhone_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShowAcc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowAcc.PageIndex = e.NewPageIndex;
        FillData("");
    }
    protected void gShowAcc_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShowPhone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "bAction")
        {
            //int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            string sStatus = ((Label)row.Cells[9].FindControl("lStatus")).Text;
            string customUsername = row.Cells[2].Text;
            string salerUsername = null;
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
                salerUsername = Session["username"].ToString();
            else if (cookie != null)
                salerUsername = cookie["username"].ToString();
            if (salerUsername == null) return;
            int productID = Convert.ToInt32(row.Cells[4].Text);
            int number = Convert.ToInt32(row.Cells[7].Text);
            double price = Convert.ToDouble(row.Cells[8].Text);
            int id = Convert.ToInt32(row.Cells[1].Text);

            if (sStatus == "Đang chờ")   //lập hóa đơn, bán hàng
            {
                //lập hóa đơn
                SaleBill saleBill = new SaleBill(0, salerUsername, customUsername, DateTime.Now);
                saleBill.Insert();
                SaleBillDt saleBillDt = new SaleBillDt(0, saleBill.id, productID, "", true, number, price);
                saleBillDt.Insert();

                //Cập nhật trạng thái
                Orders order = new Orders(id);
                order.GetInfoByID();
                order.status = 1;
                order.Update();
            }
            else if (sStatus == "Đã đặt hàng")   //xác nhận đã nhận được hàng
            {
                //Cập nhật trạng thái
                Orders order = new Orders(id);
                order.GetInfoByID();
                order.status = 2;
                order.Update();
            }
            FillData("");
            lInfo.Text = "<span style=\"color:blue;\">Cập nhật thành công</span>";
        }
    }
    protected void gShowAcc_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "bAction")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            string sStatus = ((Label)row.Cells[9].FindControl("lStatus")).Text;
            string customUsername = row.Cells[2].Text;
            string salerUsername = null;
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
                salerUsername = Session["username"].ToString();
            else if (cookie != null)
                salerUsername = cookie["username"].ToString();
            if (salerUsername == null) return;
            int productID = Convert.ToInt32(row.Cells[4].Text);
            int number = Convert.ToInt32(row.Cells[7].Text);
            double price = Convert.ToDouble(row.Cells[8].Text);
            int id = Convert.ToInt32(row.Cells[1].Text);

            if (sStatus == "Đang chờ")   //lập hóa đơn, bán hàng
            {
                //lập hóa đơn
                SaleBill saleBill = new SaleBill(0, salerUsername, customUsername, DateTime.Now);
                saleBill.Insert();
                SaleBillDt saleBillDt = new SaleBillDt(0, saleBill.id, productID, "", false, number, price);
                saleBillDt.Insert();

                //cập nhật trạng thái
                Orders order = new Orders(id);
                order.GetInfoByID();
                order.status = 1;
                order.Update();
            }
            else if (sStatus == "Đã đặt hàng")   //xác nhận đã nhận được hàng
            {
                //cập nhật trạng thái
                Orders order = new Orders(id);
                order.GetInfoByID();
                order.status = 2;
                order.Update();
            }
            FillData("");
        }
    }
}