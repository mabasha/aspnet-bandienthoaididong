using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Products_ShowPhoneSmall : System.Web.UI.UserControl
{
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

    public int Number
    {
        get { return number; }
        set { number = value; }
    }

    public string OrderBy
    {
        get { return orderby; }
        set { orderby = value; }
    }

    public bool IsAsc
    {
        get { return isAsc; }
        set { isAsc = value; }
    }

    double priceFrom=0;
    double priceTo=1000000000;
    int number = 10;
    string orderby="Price";
    bool isAsc = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gShow.DataSource = Phone.GetTop(number, priceFrom, priceTo, orderby, isAsc);
            gShow.DataBind();
        }
    }
}
