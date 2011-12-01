using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class Account
{
    public string username;
    public string password;
    public string fullname;
    public DateTime birthDay;
    public string tel;
    public string address;
    public int idCard;
    public string decentralize;

	public Account()
	{   
	}

    public Account(string username)
    {
        this.username = username;
    }

    public void GetInfoByUsername()
    {
        string query = String.Format("select * from Users where Username = N'{0}'", username);
        DataTable dtUser = AccessData.GetTable(query);

        username = (string)dtUser.Rows[0]["Username"];
        password = (string)dtUser.Rows[0]["Password"];
        fullname = (string)dtUser.Rows[0]["FullName"];
        birthDay = (DateTime)dtUser.Rows[0]["BirthDay"];
        tel = (string)dtUser.Rows[0]["Tel"];
        address = (string)dtUser.Rows[0]["Address"];
        idCard = (int)dtUser.Rows[0]["IDCard"];
        decentralize = (string)dtUser.Rows[0]["Decentralize"];
    }

    public static DataTable GetUsers(params string[] decentralizes)
    {
        string where = "where ";
        bool isFirst = true;
        foreach (string dec in decentralizes)
        {
            if(isFirst == true)
            {
                where += String.Format("Decentralize = '{0}' ", dec);
                isFirst = false;
            }
            else
            {
                where += String.Format("or Decentralize = '{0}' ", dec);
            }
        }
        string query = "select * from Users " + where;
        return AccessData.GetTable(query);
    }

    public static DataTable GetUsersWithKeyword(string keyword, params string[] decentralizes)
    {
        string where = "where ";
        bool isFirst = true;
        foreach (string dec in decentralizes)
        {
            if (isFirst == true)
            {
                where += String.Format("Decentralize = '{0}' ", dec);
                isFirst = false;
            }
            else
            {
                where += String.Format("or Decentralize = '{0}' ", dec);
            }
        }
        where += String.Format("and FullName like N'%{0}%'", keyword);
        string query = "select * from Users " + where;
        return AccessData.GetTable(query);
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from Users");
    }

    public static DataTable GetAllWithKeyword(string keyword)
    {
        string query = String.Format("select * from Users where FullName like N'%{0}%'", keyword);
        return AccessData.GetTable(query);
    }

    public static DataTable GetUser(string username)
    {
        string query = String.Format("select * from Users where Username = N'{0}'", username);
        return AccessData.GetTable(query);
    }
}
