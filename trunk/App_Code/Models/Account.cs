using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Security.Cryptography;
using System.Text;

public class Account
{
    public string username;
    public string password;
    public string fullname;
    public string email;
    public DateTime birthDay;
    public string tel;
    public string address;
    public string idCard;
    public string decentralize;
    public int isActived;

	public Account()
	{   
	}

    public Account(string _username, string _password, string _fullname, string _email, DateTime _birthDay,
                    string _tel, string _address, string _idCard, int _isActived)
    {
        username = _username;
        password = _password;
        fullname = _fullname;
        email = _email;
        birthDay = _birthDay;
        tel = _tel;
        address = _address;
        idCard = _idCard;
        decentralize = "Client";
        isActived = _isActived;
    }

    public Account(string username)
    {
        this.username = username;
    }

    public int GetInfoByUsername()
    {
        string query = String.Format("select * from Users where Username = N'{0}'", username);
        DataTable dtUser = AccessData.GetTable(query);

        if (dtUser.Rows.Count > 0)
        {
            username = (string)dtUser.Rows[0]["Username"];
            password = (string)dtUser.Rows[0]["Password"];
            fullname = (string)dtUser.Rows[0]["FullName"];
            email = (string)dtUser.Rows[0]["Email"];
            birthDay = (DateTime)dtUser.Rows[0]["BirthDay"];
            tel = (string)dtUser.Rows[0]["Tel"];
            address = (string)dtUser.Rows[0]["Address"];
            idCard = (string)dtUser.Rows[0]["IDCard"];
            decentralize = (string)dtUser.Rows[0]["Decentralize"];
            isActived = (int)dtUser.Rows[0]["IsActived"];
            return 1;
        }
        return 0;
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
        string sql1 = "Insert into Users (Username, Password, FullName, Email, Tel, BirthDay, Address, IDCard, Decentralize, IsActived) Values (N'" +
                username + "', N'" + password + "', N'" + fullname + "', N'" + email + "','" + tel + "', '" + birthDay
                + "', N'" + address + "', '" + idCard + "', '" + decentralize + "', "+isActived+")";
        AccessData.ExecuteNonQuery(sql1);
        return 2;
    }

    public string Delete()
    {
        string query = String.Format("DELETE FROM Users WHERE Username='{0}'", username);
        return AccessData.ExecuteNonQuery(query);
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
            tel + "', Email='" + email + "', BirthDay='" + birthDay + "',Address=N'" + address + "', IDCard='" + idCard + "', Decentralize='" +
            decentralize + "', IsActived="+isActived+" Where Username='" + username + "'";
            AccessData.ExecuteNonQuery(sql);
            return true;
        }
    }

    public static void UpdateIsActived(string _username, int _isActived)
    {
        string sql = String.Format("UPDATE Users SET IsActived={0} WHERE Username='{1}'", _isActived, _username);
        AccessData.ExecuteNonQuery(sql);
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

    /*
     * Tìm kiếm dựa vào các thông số : username, fullname, decentralize
     * Được dùng ở trang AddAccount
     */
    public DataTable Search(string _username, string _fullname, string _email, string _decentralize, string _isActived)
    {

        string query = String.Format("SELECT * FROM Users WHERE Username LIKE N'%{0}%' AND Fullname LIKE N'%{1}%' AND Email LIKE N'%{2}%'",
                                    _username, _fullname, _email);
        DataTable dt = AccessData.GetTable(query);
        if (_decentralize != "Tất cả")
        {
            DataRow[] rows;
            string filter = String.Format("Decentralize='{0}'", _decentralize);
            rows=dt.Select(filter);
            dt = dt.Clone();
            foreach(DataRow row in rows)
            {
                dt.ImportRow(row);
            }
            
        }

        if (_isActived != "Tất cả")
        {
            int temp = int.Parse(_isActived);
            DataRow[] rows;
            string filter = String.Format("IsActived={0}", temp);
            rows = dt.Select(filter);
            dt = dt.Clone();
            foreach (DataRow row in rows)
            {
                dt.ImportRow(row);
            }
        }
        return dt;
    }

    // Hàm mã khóa mật khẩu
    public string EncryptionPassword(string password)
    {
        UnicodeEncoding encoding = new UnicodeEncoding();
        Byte[] hashBytes = encoding.GetBytes(password);
        // Compute the SHA-1 hash
        SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
        Byte[] cryptPassword = sha1.ComputeHash(hashBytes);
        return BitConverter.ToString(cryptPassword);
    }

    
}
