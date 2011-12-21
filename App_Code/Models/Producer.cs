using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class Producer
{
    public int id;
    public string name;

    public Producer()
	{
	}

    public Producer(int id)
    {
        this.id = id;
        
    }

    public Producer(int id, string name)
    {
        this.id = id;
        this.name = name;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from Producer where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        name = (string)dt.Rows[0]["Name"];
    }

    public bool Insert()
    {
        bool isExist = IsExistName();
        if (isExist == false)
        {
            id = GetMaxID() + 1;
            string query = String.Format("insert into Producer(ID, Name) values('{0}',N'{1}')", id, name);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public bool Update()
    {
        bool isExist = IsExistName();
        if (isExist == false || (isExist == true && GetIDFromName(name) == id))
        {
            string query = String.Format("update Producer set Name = N'{0}' where ID = {1}", name, id);
            AccessData.ExecuteNonQuery(query);
        }
        return !isExist;
    }

    public void Delete()
    {
        string query = String.Format("delete from Producer where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public bool IsExistName()
    {
        string query = String.Format("select count(ID) from Producer where name = N'{0}'", name);
        int count = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (count > 0) return true;
        return false;
    }

    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from Producer");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from Producer");
    }

    public static DataTable GetName()
    {
        return AccessData.GetTable("select Name from Producer");
    }

    public static int GetIDFromName(String name)
    {
        String query = String.Format("select ID from Producer where Name=N'{0}'", name);
        return Convert.ToInt32(AccessData.ExecuteScalar(query));
    }
}
