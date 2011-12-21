using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Order
/// </summary>
public class Orders
{
    public int id;
    public string username;
    public bool isPhone;
    public int productID;
    public int number;
    public bool isAccepted;
    public bool isDelivered;
    public double price;

	public Orders()
	{
	}

    public Orders(int id)
    {
        this.id = id;
    }

    public Orders(int id, string username, bool isPhone, int productID, int number,
        bool isAccepted, bool isDelivered, double price)
    {
        this.id = id;
        this.username = username;
        this.isPhone = isPhone;
        this.productID = productID;
        this.number = number;
        this.isAccepted = isAccepted;
        this.isDelivered = isDelivered;
        this.price = price;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Orders where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        username = (string)dt.Rows[0]["Username"];
        isPhone = (bool)dt.Rows[0]["IsPhone"];
        productID = (int)dt.Rows[0]["ProductID"];
        number = (int)dt.Rows[0]["Number"];
        isAccepted = (bool)dt.Rows[0]["IsAccepted"];
        isDelivered = (bool)(dt.Rows[0]["IsDelivered"]);
        price = Convert.ToDouble(dt.Rows[0]["Price"]);
    }

    public void Insert()
    {
        id = AccessData.GetMaxID("Orders") + 1;
        string query = String.Format("insert into Orders(ID, Username, IsPhone, ProductID, Number, IsAccepted, IsDelivered, Price)" +
            "values('{0}',N'{1}','{2}','{3}','{4}','{5}','{6}',{7})", id, username, isPhone, productID, number, isAccepted, isDelivered, price);
        AccessData.ExecuteNonQuery(query);
    }

    public void Delete()
    {
        string query = String.Format("delete from Orders where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }
}