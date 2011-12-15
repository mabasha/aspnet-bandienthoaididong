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
    public string email;
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
        email = (string)dtUser.Rows[0]["Email"];
        birthDay = (DateTime)dtUser.Rows[0]["BirthDay"];
        tel = (string)dtUser.Rows[0]["Tel"];
        address = (string)dtUser.Rows[0]["Address"];
        idCard = (int)dtUser.Rows[0]["IDCard"];
        decentralize = (string)dtUser.Rows[0]["Decentralize"];
    }

    public int Insert()
    {
        if (IsExitsUserName())
        {
            return 0; // Đã tồn tại Username.
        }
        if (IsExitsEmail())
        {
            return 1; // Đã tồn tại Email.
        }
        string sql1 = "Insert into Users (Username, Password, FullName, Email, Tel, BirthDay, Address, IDCard, Decentralize) Values (N'" +
                username + "', N'" + password + "', N'" + fullname + "', N'" + email + "','" + tel + "', '" + birthDay
                + "', N'" + address + "', " + idCard + ", '" + decentralize + "')";
        AccessData.ExecuteNonQuery(sql1);
        return 2;
    }

    public bool Update()
    {
        DataTable dt = GetUser(username);
        string oldEmail = dt.Rows[0]["Email"].ToString();
        if ( String.Compare(oldEmail, email) != 0 && IsExitsEmail())
        {
            return false;
        } 
        else
        {
            string sql = "UPDATE Users SET Password=N'" + password + "', FullName=N'" + fullname + "', Tel='" +
            tel + "', Email='" + email + "', BirthDay='" + birthDay + "',Address=N'" + address + "', IDCard=" + idCard + ", Decentralize='" +
            decentralize + "' Where Username='" + username + "'";
            AccessData.ExecuteNonQuery(sql);
            return true;
        }
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

    public bool IsExitsUserName()
    {
        string sql1 = "SELECT Count(*) FROM Users WHERE Username='" + username + "'";
        int temp1 = Convert.ToInt32(AccessData.ExecuteScalar(sql1));
        if (temp1 > 0)
        {
            return true;
        } 
        else
        {
            return false;
        }
    }

    public bool IsExitsEmail()
    {
        string sql1 = "SELECT Count(*) FROM Users WHERE Email='" + email + "'";
        int temp1 = Convert.ToInt32(AccessData.ExecuteScalar(sql1));
        if (temp1 > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
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
