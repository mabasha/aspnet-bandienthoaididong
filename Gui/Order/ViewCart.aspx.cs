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

            List<int> accList = ProductInfo.GetSeperateList(productList, false);
            DataTable dtAcc = Accessory.GetAll(accList);
            if (sortExp != "")
                dtAcc.DefaultView.Sort = sortExp;
            gAcc.DataSource = dtAcc;
            gAcc.DataBind();
        }
    }
}