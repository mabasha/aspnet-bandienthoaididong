using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Gui_Products_AccessoryListCtrl : System.Web.UI.UserControl
{
    string keyword = "";
    string orderBy = "Price";
    string producerName = "";
    double priceFrom = 0, priceTo = 100000000;
    bool isAsc = false;
    int page = 1;
    const int pageSize = 10;

    public string Keyword
    {
        get { return keyword; }
        set { keyword = value; }
    }

    public string OrderBy
    {
        get { return orderBy; }
        set { orderBy = value; }
    }

    public string ProducerName
    {
        get { return producerName; }
        set { producerName = value; }
    }

    public double PriceFrom
    {
        get { return priceFrom; }
        set { priceFrom = value; }
    }

    public double PriceTo
    {
        get { return priceTo; }
        set { priceTo = value; }
    }

    public bool IsAsc
    {
        get { return isAsc; }
        set { isAsc = value; }
    }

    public int PageNumber
    {
        get { return page; }
        set { 
            page = value; 
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData();
        }
    }

    public void FillData()
    {
        
        DataTable dtOrigin = Accessory.GetAll(keyword, priceFrom, priceTo, orderBy, producerName);
        int numPage = dtOrigin.Rows.Count / 10 + 1;
        if (page > numPage || page<1) page = 1;

        DataTable dtNew = dtOrigin.Clone();
        for(int i = (page-1)*10; i<(page)*10; i++)
        {
            if(i<dtOrigin.Rows.Count)
                dtNew.ImportRow(dtOrigin.Rows[i]);
        }
        gShow.DataSource = dtNew;
        gShow.DataBind();

        //Ẩn hiện các định hướng.
        
        if (page == 1)
        {
            hlFirst.Visible = false;
            hlPrev.Visible = false;
        }
        else
        {
            hlFirst.Visible = true;
            hlPrev.Visible = true;
        }

        if (page == numPage)
        {
            hlLast.Visible = false;
            hlNext.Visible = false;
        }
        else
        {
            hlLast.Visible = true;
            hlNext.Visible = true;
        }
        lPage.Text = page.ToString() ;

        string url = "http://" + (string)Request.ServerVariables["SERVER_NAME"] 
            + ":"+(string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"]+"?"+Request.QueryString;

        if (url.IndexOf("PageNumber") != -1)
            url = url.Substring(0, url.IndexOf("PageNumber"));
        hlFirst.NavigateUrl = url + "&PageNumber=1";
        hlPrev.NavigateUrl = url + "&PageNumber=" + (page - 1);
        hlNext.NavigateUrl = url + "&PageNumber=" + (page + 1);
        hlLast.NavigateUrl = url + "&PageNumber=" + numPage;
    }

    protected void gShow_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "bBuy")
        {
            ImageButton b = (ImageButton)e.CommandSource;
            int id = Convert.ToInt32(b.CommandArgument);

            List<ProductInfo> productList = (List<ProductInfo>)Session["CartProductList"];
            ProductInfo.AddProductList(id, false, ref productList);
            Session["CartProductList"] = productList;

            Response.Redirect("http://" + (string)Request.ServerVariables["SERVER_NAME"]
                + ":" + (string)Request.ServerVariables["SERVER_PORT"] + (string)Request.ServerVariables["URL"]+Request.QueryString);
        }
    }

}