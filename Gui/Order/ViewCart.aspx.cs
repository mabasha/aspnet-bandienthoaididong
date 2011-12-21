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
        if (Session["CartProductList"] != null)
        {
            List<ProductInfo>  productList = (List<ProductInfo>)Session["CartProductList"];
            
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
            }
            if (sortExp != "")
                dtAcc.DefaultView.Sort = sortExp;
            gAcc.DataSource = dtAcc;
            gAcc.DataBind();
        }

        //Nếu có sản phẩm muốn được thêm vào
        if (Request.QueryString["ProductID"] != null && Request.QueryString["IsPhone"] != null)
        {
            bool isPhone = Convert.ToBoolean(Request.QueryString["IsPhone"]);
            int productID = Convert.ToInt32(Request.QueryString["ProductID"]);
            if (isPhone == true)
            {
                fBuyConfirm.DataSource = Phone.GetAllByID(productID);
            }
            else
            {
                fBuyConfirm.DataSource = Accessory.GetAllByID(productID);
            }

            //Lưu thông tin dùng lại khi nhấn nút Add
            ViewState["CartIsPhone"] = isPhone;
            ViewState["CartID"] = productID;

            fBuyConfirm.DataBind();
            
        }
    }
    protected void fBuyConfirm_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "bAdd")
        {
            TextBox tNum = (TextBox)fBuyConfirm.FindControl("tNum");
            int number = Convert.ToInt32(tNum.Text);
            int id = (int)ViewState["CartID"];
            bool isPhone = (bool)ViewState["CartIsPhone"];

            List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
            ProductInfo.AddProductList(id, isPhone, number, ref productList);
            Session["CartProductList"] = productList;

            Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"] + "?"+Request.QueryString);
        }
    }
    protected void bOrder_Click(object sender, EventArgs e)
    {

    }
}