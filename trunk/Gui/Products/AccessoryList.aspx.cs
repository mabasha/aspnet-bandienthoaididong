using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gui_Products_AccessoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["keyword"] != null)
                accList.Keyword = Request.QueryString["keyword"];
            if (Request.QueryString["orderby"] != null)
                accList.OrderBy = Request.QueryString["orderby"];
            if (Request.QueryString["ProducerName"] != null)
                accList.ProducerName = Request.QueryString["ProducerName"];
            if (Request.QueryString["priceFrom"] != null)
                accList.PriceFrom = Convert.ToDouble(Request.QueryString["priceFrom"]);
            if (Request.QueryString["priceTo"] != null)
                accList.PriceTo = Convert.ToDouble(Request.QueryString["priceTo"]);
            if (Request.QueryString["IsAsc"] != null)
                accList.IsAsc = Convert.ToBoolean(Request.QueryString["IsAsc"]);
            if (Request.QueryString["PageNumber"] != null)
                accList.PageNumber = Convert.ToInt32(Request.QueryString["PageNumber"]);
            accList.FillData();
        }
    }

}