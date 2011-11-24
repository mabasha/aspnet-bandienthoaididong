﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;

/// <summary>
/// Use for access data from Producer table
/// </summary>
public class ProducerModel
{
    public static bool IsExistName(string name)
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("select ID from Producer where name = '{0}'", name);
        String result = (string)AccessData.ExecuteScalar(sb.ToString());
        if (result == null)
            return false;
        else return true;
    }

    public static int GetMaxID()
    {
        return Convert.ToInt32(AccessData.ExecuteScalar("select max(ID) from Producer"));
    }
    public static void Insert(string name)
    {
        int ID = GetMaxID() + 1;
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("insert into Producer(ID, Name) values ('{0}','{1}')", ID, name);
        AccessData.ExecuteNonQuery(sb.ToString());
    }

    public static DataTable GetProducts()
    {
        return AccessData.GetTable("select * from Producer");
    }
}
