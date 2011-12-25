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

            dProducer.DataSource = dt;
            dProducer.DataTextField="Name";
            dProducer.DataValueField="Name";
            dProducer.DataBind();
            dProducer.Items.Add("Tất cả các hãng");
            dProducer.SelectedIndex = dProducer.Items.Count - 1;

            dOrderBy.SelectedIndex = 3; //Gía giảm dần.
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
        string url = "~/Gui/Products/PhoneList.aspx";
        string param = "";
        
        string keyword = tKeyword.Text;
        if(keyword != "")
            param = AddParam(param, "Keyword="+keyword);
        

        string producerName = dProducer.SelectedValue.ToString();
        if(producerName != "Tất cả các hãng")
            param = AddParam(param, "ProducerName="+producerName);
        
        if(dPriceFrom.SelectedIndex!=0)
        {
            string sPriceFrom = dPriceFrom.SelectedValue.ToString();
            sPriceFrom = sPriceFrom.Replace(".", "");
            param = AddParam(param, "PriceFrom=" + sPriceFrom);
        }
        if(dPriceTo.SelectedIndex!=0)
        {
            string sPriceTo = dPriceTo.SelectedValue.ToString();
            sPriceTo = sPriceTo.Replace(".", "");
            param = AddParam(param, "PriceTo=" + sPriceTo);
        }

        if (param != "")
        {
            url+="?"+param;
        }

        Response.Redirect(url);
        
    }
    protected void dNumberShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        spSuper.Number = spHigh.Number = spMedium.Number = spNormal.Number = Convert.ToInt32(dNumberShow.SelectedValue);
        spSuper.FillData();
        spHigh.FillData();
        spMedium.FillData();
        spNormal.FillData();
    }
    protected void dOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (dOrderBy.SelectedValue.ToString())
        {
            case "A->Z":
                spSuper.OrderBy = spHigh.OrderBy = spMedium.OrderBy = spNormal.OrderBy = "Name";
                spSuper.IsAsc = spHigh.IsAsc = spMedium.IsAsc = spNormal.IsAsc = true;
                break;
            case "Z->A":
                spSuper.OrderBy = spHigh.OrderBy = spMedium.OrderBy = spNormal.OrderBy = "Name";
                spSuper.IsAsc = spHigh.IsAsc = spMedium.IsAsc = spNormal.IsAsc = false;
                break;
            case "Giá tăng dần":
                spSuper.OrderBy = spHigh.OrderBy = spMedium.OrderBy = spNormal.OrderBy = "Price";
                spSuper.IsAsc = spHigh.IsAsc = spMedium.IsAsc = spNormal.IsAsc = true;
                break;
            case "Giá giảm dần":
                spSuper.OrderBy = spHigh.OrderBy = spMedium.OrderBy = spNormal.OrderBy = "Price";
                spSuper.IsAsc = spHigh.IsAsc = spMedium.IsAsc = spNormal.IsAsc = false;
                break;
        }
        spSuper.FillData();
        spHigh.FillData();
        spMedium.FillData();
        spNormal.FillData();
    }
}
