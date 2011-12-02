using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for SaleBillDt
/// </summary>
public class SaleBillDt
{
    int id;
    int saleBillID;
    int productID;
    int productIMEI;
    bool isPhone;
    int number;
    double price;

    public SaleBillDt()
    {
    }

    public SaleBillDt(int id)
    {
        this.id = id;
    }

    public SaleBillDt(int id, int saleBillID, int productID, int productIMEI,
        bool isPhone, int number, double price)
    {
        this.id = id;
        this.saleBillID = saleBillID;
        this.productID = productID;
        this.productIMEI = productIMEI;
        this.isPhone = isPhone;
        this.number = number;
        this.price = price;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from SaleBillDt where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        saleBillID = (int)dt.Rows[0]["SaleBillID"];
        productID = (int)dt.Rows[0]["ProductID"];
        productIMEI = (int)dt.Rows[0]["ProductIMEI"];
        isPhone = (bool)dt.Rows[0]["IsPhone"];
        number = (int)dt.Rows[0]["Number"];
        price = (double)dt.Rows[0]["Price"];
    }

    public bool Insert()
    {
        id = GetMaxID() + 1;
        string query = String.Format("insert into SaleBillDt" +
            "(ID, SaleBillID, ProductID, ProductIMEI, IsPhone, Number, Price) " +
            "values('{0}',{1},{2}, {3}, '{4}', {5}, {6})",
            id, saleBillID, productID, productIMEI, isPhone, number, price);
        AccessData.ExecuteNonQuery(query);
        return true;
    }

    public bool Update()
    {
        string query = String.Format("update SaleBillDt " +
            "set SaleBillID = {0}, ProductID = {1}, ProductIMEI = {2}, " +
            "IsPhone = {3}, Number = {4}, Price = N{5} " +
            "where ID = {6}", saleBillID, productID, productIMEI, isPhone, number, price, id);
        AccessData.ExecuteNonQuery(query);
        return true;
    }

    public void Delete()
    {
        string query = String.Format("delete from SaleBillDt where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from SaleBillDt");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from SaleBillDt");
    }
}
