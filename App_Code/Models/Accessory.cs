﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Accessory
/// </summary>
public class Accessory
{
    public int id;
    public string name;
    public int producerID;
    public double price;
    public string image;
    public string description;
    public int residualAmount;

    public Accessory()
    {
    }

    public Accessory(int id)
    {
        this.id = id;
    }

    public Accessory(int id, string name, int producerID,
        double price, string image, string description, int residualAmount)
    {
        this.id = id;
        this.name = name;
        this.producerID = producerID;
        this.price = price;
        this.image = image;
        this.description = description;
        this.residualAmount = residualAmount;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Accessory where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        name = (string)dt.Rows[0]["Name"];
        producerID = (int)dt.Rows[0]["ProducerID"];
        price = Convert.ToDouble(dt.Rows[0]["Price"]);
        image = (string)dt.Rows[0]["Image"];
        description = (string)dt.Rows[0]["Description"];
        residualAmount = (int)(dt.Rows[0]["ResidualAmount"]);
    }

    public bool Insert()
    {
        bool isExist = IsExistName();
        if (isExist == false)
        {
            id = GetMaxID() + 1;
            string query = String.Format("insert into Accessory(ID, Name, ProducerID, Price, Image, Description, ResidualAmount)" +
                "values('{0}',N'{1}','{2}','{3}',N'{4}',N'{5}',{6})", id, name, producerID, price, image, description, residualAmount);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public bool Update()
    {
        bool isExist = IsExistName();
        if (isExist == false || (isExist == true && GetIDFromName(name) == id))
        {
            string query = String.Format("update Accessory set Name = N'{0}', ProducerID = N'{1}',"
            + "Price = '{2}', Image = N'{3}', Description = N'{4}', ResidualAmount = {5} where ID = {6}",
            name, producerID, price, image, description, residualAmount, id);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public void Delete()
    {
        string query = String.Format("delete from Accessory where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public bool IsExistName()
    {
        string query = String.Format("select count(ID) from Accessory where name = N'{0}'", name);
        int count = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (count > 0) return true;
        return false;
    }

    public int GetAmount()
    {
        String query = String.Format("select ResidualAmount from Accessory where ID = N'{0}'", id);
        return (int)AccessData.ExecuteScalar(query);
    }

    public void SetAmount(int amount)
    {
        String query = String.Format("update Accessory set ResidualAmount = {0} where ID = {1}", amount, id);
        AccessData.ExecuteNonQuery(query);
    }

    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from Accessory");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select Accessory.*, Producer.Name as ProducerName from Accessory, Producer where Accessory.ProducerID = Producer.ID");
    }

    public static int GetIDFromName(String name)
    {
        String query = String.Format("select ID from Accessory where Name=N'{0}'", name);
        return Convert.ToInt32(AccessData.ExecuteScalar(query));
    }

    public static DataTable GetAllWithKeyword(string keyword)
    {
        String query = String.Format("select * from Accessory where Name like N'%{0}%'", keyword);
        return AccessData.GetTable(query);
    }

}
