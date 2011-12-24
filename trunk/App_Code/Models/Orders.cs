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
    public int status;
    public double price;
    public DateTime createdDate;

	public Orders()
	{
	}

    public Orders(int id)
    {
        this.id = id;
    }

    public Orders(int id, string username, bool isPhone, int productID, int number,
        int status, double price, DateTime createdDate)
    {
        this.id = id;
        this.username = username;
        this.isPhone = isPhone;
        this.productID = productID;
        this.number = number;
        this.status = status;
        this.price = price;
        this.createdDate = createdDate;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Orders where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        username = (string)dt.Rows[0]["Username"];
        isPhone = (bool)dt.Rows[0]["IsPhone"];
        productID = (int)dt.Rows[0]["ProductID"];
        number = (int)dt.Rows[0]["Number"];
        status = (int)dt.Rows[0]["Status"];
        price = Convert.ToDouble(dt.Rows[0]["Price"]);
        createdDate = (DateTime)dt.Rows[0]["CreatedDate"];
    }

    public void Insert()
    {
        id = AccessData.GetMaxID("Orders") + 1;
        string query = String.Format("insert into Orders(ID, Username, IsPhone, ProductID, Number, Status, Price, CreatedDate)" +
            "values('{0}',N'{1}','{2}','{3}','{4}','{5}','{6}','{7}')", 
            id, username, isPhone, productID, number, status, price, createdDate);
        AccessData.ExecuteNonQuery(query);
    }

    public void Update()
    {
        string query = String.Format("update Orders set Username = N'{0}', IsPhone = '{1}',"
            + "ProductID = '{2}', Number = '{3}', Status= '{4}', Price= {5}, CreatedDate = '{6}' where ID = {7}",
            username, isPhone, productID, number, status, price, createdDate ,id);
        AccessData.ExecuteNonQuery(query);
    }

    public void Delete()
    {
        string query = String.Format("delete from Orders where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public static DataTable GetAll(string keyword, DateTime from, DateTime to, int status, bool isPhone)
    {
        string query = "";
        if (isPhone == true)
        {
            query = String.Format("select Orders.*, "+
                "Phone.Name as ProductName, Producer.Name as ProducerName, Users.Fullname, Users.Username, Phone.ID as ProductID " +
               "from Orders, Phone, Users, Producer " +
               "where Orders.Username = Users.Username and Orders.ProductID = Phone.ID " +
               "and Phone.ProducerID = Producer.ID " +
               "and IsPhone = 'True'" +
               "and (Phone.Name like '%{0}%' or Producer.Name like '%{0}%') " +
               "and (CreatedDate between '{1}' and '{2}') ", keyword, from, to);
        }
        else
        {
            query = String.Format("select Orders.*, "+
                "Accessory.Name as ProductName, Producer.Name as ProducerName, Users.Fullname, Users.Username, Accessory.ID as ProductID  " +
                "from Orders, Accessory, Users, Producer " +
                "where Orders.Username = Users.Username and Orders.ProductID = Accessory.ID " +
                "and Accessory.ProducerID = Producer.ID " +
                "and IsPhone = 'False' " +
                "and (Accessory.Name like '%{0}%' or Producer.Name like '%{0}%') " +
                "and (CreatedDate between '{1}' and '{2}') ", keyword, from, to);
        }
        if (status != -1)
            query += "and Status = " + status;
        return AccessData.GetTable(query);
    }

    public static DataTable GetAll(string keyword, DateTime from, DateTime to, int status, bool isPhone, string username)
    {
        string query = "";
        if (isPhone == true)
        {
             query= String.Format("select Orders.*, Phone.Name as ProductName, Producer.Name as ProducerName " +
                "from Orders, Phone, Users, Producer " +
                "where Orders.Username = Users.Username and Orders.ProductID = Phone.ID " +
                "and Phone.ProducerID = Producer.ID " +
                "and IsPhone = 'True'"+
                "and (Phone.Name like '%{0}%' or Producer.Name like '%{0}%') " +
                "and (CreatedDate between '{1}' and '{2}') "+
                "and Users.Username = '{3}' ", keyword, from, to, username);
        }
        else
        {
            query = String.Format("select Orders.*, Accessory.Name as ProductName, Producer.Name as ProducerName " +
                "from Orders, Accessory, Users, Producer " +
                "where Orders.Username = Users.Username and Orders.ProductID = Accessory.ID " +
                "and Accessory.ProducerID = Producer.ID " +
                "and IsPhone = 'False' "+
                "and (Accessory.Name like '%{0}%' or Producer.Name like '%{0}%') " +
                "and (CreatedDate between '{1}' and '{2}') "+
                "and Users.Username = '{3}' ", keyword, from, to, username);
        }
        if (status != -1)
            query += "and Status = "+status;
        return AccessData.GetTable(query);
    }
    
}