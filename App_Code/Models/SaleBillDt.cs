﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for SaleBillDt
/// </summary>
public class SaleBillDt
{
    public int id;
    public int saleBillID;
    public int productID;
    public string productIMEI;
    public bool isPhone;
    public int number;
    public double price;

    public SaleBillDt()
    {
    }

    public SaleBillDt(int id)
    {
        this.id = id;
    }

    public SaleBillDt(int id, int saleBillID, int productID, string productIMEI,
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
        productIMEI = (string)dt.Rows[0]["ProductIMEI"];
        isPhone = Convert.ToBoolean(dt.Rows[0]["IsPhone"]);
        number = (int)dt.Rows[0]["Number"];
        price = Convert.ToDouble(dt.Rows[0]["Price"]);
    }

    public bool Insert()
    {
        id = GetMaxID() + 1;
        string query = String.Format("insert into SaleBillDt" +
            "(ID, SaleBillID, ProductID, ProductIMEI, IsPhone, Number, Price) " +
            "values('{0}',{1},{2}, '{3}', '{4}', {5}, {6})",
            id, saleBillID, productID, productIMEI, isPhone, number, price);
        AccessData.ExecuteNonQuery(query);

        if (isPhone)
        {
            Phone phone = new Phone(productID);
            int oldAmount = phone.GetAmount();
            phone.SetAmount(oldAmount - number);
        }
        else
        {
            Accessory acc = new Accessory(productID);
            int oldAmount = acc.GetAmount();
            acc.SetAmount(oldAmount - number);
        }

        return true;
    }

    public bool Update()
    {
        //Trả về tồn trước khi thêm
        SaleBillDt oldSaleBillDt = new SaleBillDt(id);
        oldSaleBillDt.GetInfoByID();

        if (oldSaleBillDt.isPhone == true)
        {
            Phone phone = new Phone(oldSaleBillDt.productID);
            int oldAmount = phone.GetAmount();
            phone.SetAmount(oldAmount + oldSaleBillDt.number);
        }
        else
        {
            Accessory acc = new Accessory(oldSaleBillDt.productID);
            int oldAmount = acc.GetAmount();
            acc.SetAmount(oldAmount + oldSaleBillDt.number);
        }

        string query = String.Format("update SaleBillDt " +
            "set SaleBillID = {0}, ProductID = {1}, ProductIMEI = '{2}', " +
            "IsPhone = '{3}', Number = {4}, Price = {5} " +
            "where ID = {6}", saleBillID, productID, productIMEI, isPhone, number, price, id);
        AccessData.ExecuteNonQuery(query);

        //int deltaNumber = number - oldNumber;
        if (isPhone)
        {
            Phone phone = new Phone(productID);
            int oldAmount = phone.GetAmount();
            phone.SetAmount(oldAmount - number);
        }
        else
        {
            Accessory acc = new Accessory(productID);
            int oldAmount = acc.GetAmount();
            acc.SetAmount(oldAmount - number);
        }

        return true;
    }

    public void Delete()
    {
        string query = String.Format("delete from SaleBillDt where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);

        if (isPhone)
        {
            Phone phone = new Phone(productID);
            int oldAmount = phone.GetAmount();
            phone.SetAmount(oldAmount + number);
        }
        else
        {
            Accessory acc = new Accessory(productID);
            int oldAmount = acc.GetAmount();
            acc.SetAmount(oldAmount + number);
        }
    }

    private int GetNumber()
    {
        string query = String.Format("select Number from SaleBillDt where ID = {0}", id);
        return (int)AccessData.ExecuteScalar(query);
    }

    private bool GetIsPhone()
    {
        string query = String.Format("select IsPhone from SaleBillDt where ID = {0}", id);
        return (bool)AccessData.ExecuteScalar(query);
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

    public static DataTable GetAll(string saleBillID)
    {
        string query = String.Format("select * from SaleBillDt where SaleBillID = {0}", saleBillID);
        return AccessData.GetTable(query);
    }

    public static void Delete(int saleBillID)
    {
        string query = String.Format("delete from SaleBillDt where SaleBillID = {0}", saleBillID);
        AccessData.ExecuteNonQuery(query);
    }

    public static DataTable GetAllByID(int saleBillID, bool isPhone)
    {
        string query;
        if (isPhone == true)
        {
            query = String.Format("select Phone.Name, SaleBillDt.* from Phone, SaleBillDt " +
                "where SaleBillDt.ProductID = Phone.ID and SaleBillDt.SaleBillID = {0} and SaleBillDt.IsPhone = 'True'", saleBillID);
        }
        else
        {
            query = String.Format("select Accessory.Name, SaleBillDt.* from Accessory, SaleBillDt " +
                "where SaleBillDt.ProductID = Accessory.ID and SaleBillDt.SaleBillID = {0} and SaleBillDt.IsPhone = 'False'", saleBillID);
        }
        return AccessData.GetTable(query);
    }
}
