﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Distributor
/// </summary>
public class Distributor
{
    int id;
    string name;
    string address;

	public Distributor()
	{
	}

    public Distributor(int id)
    {
        this.id = id;
        
    }

    public Distributor(int id, string name, string address)
    {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Distributor where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        name = (string)dt.Rows[0]["Name"];
        address = (string)dt.Rows[0]["Address"];
    }

    public bool Insert()
    {
        bool isExist = IsExistName();
        if (isExist == false)
        {
            id = GetMaxID() + 1;
            string query = String.Format("insert into Distributor(ID, Name, Address) values('{0}',N'{1}',N'{2}')", id, name, address);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public bool Update()
    {
        bool isExist = IsExistName();
        if (isExist == false)
        {
            string query = String.Format("update Distributor set Name = N'{0}', Address = N'{1}' where ID = {2}", name, address, id);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public void Delete()
    {
        string query = String.Format("delete from Distributor where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public bool IsExistName()
    {
        string query = String.Format("select count(ID) from Distributor where name = N'{0}'", name);
        int count = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (count > 0) return true;
        return false;
    }

    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from Distributor");
        try
        {
            return Convert.ToInt32(result);
        }
        catch(Exception){}
        return 0;
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from Distributor");
    }
}
