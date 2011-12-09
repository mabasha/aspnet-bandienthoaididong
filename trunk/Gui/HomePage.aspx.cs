using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

public partial class Gui_HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = Producer.GetName();
            dt.DefaultView.Sort = "Name";
            //dt.Rows.Add("Tất cả các hãng");

            dProducer.DataSource = dt;
            dProducer.DataTextField="Name";
            dProducer.DataValueField="Name";
            dProducer.DataBind();
            dProducer.Items.Add("Tất cả các hãng");
            dProducer.SelectedIndex = dProducer.Items.Count - 1;
        }
    }

    private string AddParam(string param, string add)
    {
        if (param != "")
        {
            param += "&";
        }
        param += add;
        return param;
    }

    protected void bSearch_Click(object sender, ImageClickEventArgs e)
    {
        string url = "~/Gui/Products/ShowProducts.aspx";
        string param = "";
        
        string keyword = tKeyword.Text;
        if(keyword != "")
            param = AddParam(param, "Keyword="+keyword);
        

        string producerName = dProducer.SelectedValue.ToString();
        if(producerName != "Tất cả các hãng")
            param = AddParam(param, "ProducerName="+producerName);
        
        //double priceFrom=0, priceTo=0;
        if(dPriceFrom.SelectedIndex!=0)
        {
            string sPriceFrom = dPriceFrom.SelectedValue.ToString();
            sPriceFrom = sPriceFrom.Replace(".", "");
            //priceFrom = Convert.ToDouble(sPriceFrom);
            param = AddParam(param, "PriceFrom=" + sPriceFrom);
        }
        if(dPriceTo.SelectedIndex!=0)
        {
            string sPriceTo = dPriceTo.SelectedValue.ToString();
            sPriceTo = sPriceTo.Replace(".", "");
            //priceTo = Convert.ToDouble(sPriceTo);
            param = AddParam(param, "PriceTo=" + sPriceTo);
        }

        if (param != "")
        {
            url+="?"+param;
        }

        Response.Redirect(url);
        
    }
}
