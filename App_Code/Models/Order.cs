using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{
    public int id;
    public string username;
    public bool isPhone;
    public int productID;
    public int number;
    public bool isAccepted;
    public bool isDelivered;

	public Order()
	{
	}

    public Order(int id)
    {
        this.id = id;
    }

    public Order(int id, string username, bool isPhone, int productID, int number,
        bool isAccepted, bool isDelivered)
    {
        this.id = id;
        this.username = username;
        this.isPhone = isPhone;
        this.productID = productID;
        this.number = number;
        this.isAccepted = isAccepted;
        this.isDelivered = isDelivered;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Order where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        username = (string)dt.Rows[0]["Username"];
        isPhone = (bool)dt.Rows[0]["IsPhone"];
        productID = (int)dt.Rows[0]["ProductID"];
        number = (int)dt.Rows[0]["Number"];
        isAccepted = (bool)dt.Rows[0]["IsAccepted"];
        isDelivered = (bool)(dt.Rows[0]["IsDelivered"]);
    }
}