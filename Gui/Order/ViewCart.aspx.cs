using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_Order_ViewCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData("");
        }
    }

    void FillData(string sortExp)
    {
        float sumPrice = 0;
        if (Session["CartProductList"] != null)
        {
            List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];

            //Phụ kiện
            DataTable dtAcc = Utils.CreateDataTable("ID", "Name", "ProducerName", "Price", "Number");
            List<ProductInfo> accList = ProductInfo.GetSeperateList(productList, false);
            foreach (ProductInfo info in accList)
            {
                Accessory acc = new Accessory(info.ProductID);
                acc.GetInfoByID();

                Producer producer = new Producer(acc.producerID);
                producer.GetInfoByID();

                object[] obj = new object[5];
                obj[0] = acc.id;
                obj[1] = acc.name;
                obj[2] = producer.name;
                obj[3] = acc.price;
                obj[4] = info.Number;

                dtAcc.Rows.Add(obj);

                sumPrice += (float)acc.price*info.Number;
            }
            if (sortExp != "")
                dtAcc.DefaultView.Sort = sortExp;
            gAcc.DataSource = dtAcc;
            gAcc.DataBind();

            //điện thoại
            DataTable dtPhone = Utils.CreateDataTable("ID", "Name", "ProducerName", "Price", "Number");
            List<ProductInfo> phoneList = ProductInfo.GetSeperateList(productList, true);
            foreach (ProductInfo info in phoneList)
            {
                Phone phone = new Phone(info.ProductID);
                phone.GetInfoByID();

                Producer producer = new Producer(phone.producerID);
                producer.GetInfoByID();

                object[] obj = new object[5];
                obj[0] = phone.id;
                obj[1] = phone.name;
                obj[2] = producer.name;
                obj[3] = phone.price;
                obj[4] = info.Number;

                dtPhone.Rows.Add(obj);

                sumPrice += (float)phone.price*info.Number;
            }
            if (sortExp != "")
                dtPhone.DefaultView.Sort = sortExp;
            gPhone.DataSource = dtPhone;
            gPhone.DataBind();

            lInfo.Text = "";
        }

        //kiểm tra
        if (gAcc.Rows.Count == 0 && gPhone.Rows.Count == 0)
        {
            bOrder.Visible = false;
            bDeleteAll.Visible = false;
        }
        lSumPrice.Text = sumPrice.ToString();

        //Nếu có sản phẩm muốn được thêm vào
        if (Request.QueryString["ProductID"] != null && Request.QueryString["IsPhone"] != null)
        {
            bool isPhone = Convert.ToBoolean(Request.QueryString["IsPhone"]);
            int productID = Convert.ToInt32(Request.QueryString["ProductID"]);
            if (isPhone == true)
            {
                fBuyConfirmPhone.DataSource = Phone.GetAllByID(productID);
                fBuyConfirmPhone.DataBind();
            }
            else
            {
                fBuyConfirmAcc.DataSource = Accessory.GetAllByID(productID);
                fBuyConfirmAcc.DataBind();
            }

            //Lưu thông tin dùng lại khi nhấn nút Add
            ViewState["CartIsPhone"] = isPhone;
            ViewState["CartID"] = productID; 
        }
    }
    protected void fBuyConfirm_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "bAdd")
        {
            TextBox tNum = (TextBox)fBuyConfirmAcc.FindControl("tNum");
            int number = Convert.ToInt32(tNum.Text);
            int id = (int)ViewState["CartID"];

            List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
            ProductInfo.AddProductList(id, false, number, ref productList);
            Session["CartProductList"] = productList;

            Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?"+Request.QueryString);
        }
    }
    protected void bOrder_Click(object sender, EventArgs e)
    {
        string username=null;
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
            username = Session["username"].ToString();
        else if (cookie != null)
            username = cookie["username"].ToString();

        if (username == null)
            lInfo.Text = "<span style=\"color:red\">Bạn phải đăng nhập trước khi mua hàng!</span>";
        //phụ kiện
        foreach (GridViewRow row in gAcc.Rows)
        {
            int productID = Convert.ToInt32(row.Cells[0].Text);
            int number = Convert.ToInt32(row.Cells[4].Text);
            double price = Convert.ToDouble(row.Cells[3].Text);
            Orders order = new Orders(0, username, false, productID, number, 0, price, DateTime.Now);
            order.Insert();
        }

        //điện thoại
        foreach (GridViewRow row in gPhone.Rows)
        {
            int productID = Convert.ToInt32(row.Cells[0].Text);
            int number = Convert.ToInt32(row.Cells[4].Text);
            double price = Convert.ToDouble(row.Cells[3].Text);
            Orders order = new Orders(0, username, true, productID, number, 0, price, DateTime.Now);
            order.Insert();
        }

        List<ProductInfo> productList = new List<ProductInfo>();
        Session["CartProductList"] = productList;

        FillData("");

        lInfo.Text = "<span style=\"color:blue\">Đã đặt hàng thành công. Vui lòng thanh toán để nhận hàng!</span>";
        Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?" + Request.QueryString);
    }
    protected void fBuyConfirmPhone_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "bAdd")
        {
            TextBox tNum = (TextBox)fBuyConfirmPhone.FindControl("tNum");
            int number = Convert.ToInt32(tNum.Text);
            int id = (int)ViewState["CartID"];

            List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
            ProductInfo.AddProductList(id, true, number, ref productList);
            Session["CartProductList"] = productList;

            Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?" + Request.QueryString);
        }
    }
    protected void gAcc_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gPhone_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gAcc_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa mặt hàng này không ?')) return false;";
        }
    }
    protected void gPhone_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa mặt hàng này không ?')) return false;";
        }
    }
    protected void gAcc_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int productID = Convert.ToInt32(gAcc.Rows[e.RowIndex].Cells[0].Text);
        int number = Convert.ToInt32(gAcc.Rows[e.RowIndex].Cells[4].Text);
        List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
        foreach (ProductInfo info in productList)
        {
            if (info.ProductID == productID && info.Number == number)
            {
                productList.Remove(info);
                break;
            }
        }
        FillData("");
        Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?" + Request.QueryString);
    }
    protected void gPhone_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int productID = Convert.ToInt32(gPhone.Rows[e.RowIndex].Cells[0].Text);
        int number = Convert.ToInt32(gPhone.Rows[e.RowIndex].Cells[4].Text);
        List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
        foreach (ProductInfo info in productList)
        {
            if (info.ProductID == productID && info.Number == number)
            {
                productList.Remove(info);
                break;
            }
        }
        Session["CartProductList"] = productList;
        FillData("");
        Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?" + Request.QueryString);
    }
    protected void bDeleteAll_Click(object sender, EventArgs e)
    {
        List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
        productList.Clear();
        Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?" + Request.QueryString);
    }
}