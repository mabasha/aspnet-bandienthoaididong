using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Order_Cart : System.Web.UI.UserControl
{

    //int number;
    List<ProductInfo> productList;

    public int Number
    {
        get {
            int num = 0;
            foreach (ProductInfo info in productList)
            {
                num += info.Number;
            }
            return num; 
        }
    }

    public List<ProductInfo> ProductList
    {
        get { return productList; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {   
        if (Session["CartProductList"] != null)
            productList = (List<ProductInfo>)Session["CartProductList"];
        else 
        {
            productList=new List<ProductInfo>();
            Session["CartProductList"] = productList;
        }

        lNumber.Text = Number.ToString();
    }

    public void ResetLabel()
    {
        lNumber.Text = Number.ToString();
    }
    protected void iCart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Gui/Order/ViewCart.aspx");
    }
}