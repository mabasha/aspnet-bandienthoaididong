using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
	public Login()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Summary description for CheckLogin
    /// * Hàm login với các giá trị trả về sau
    /// * 0:Tài khoản chưa được kích hoạt
    /// * 1: không tồn tại username
    /// * 2: password không đúng
    /// * 3: login thành công
    /// </summary>
    public static int CheckLogin(string username, string password)
    {
        string query = String.Format("SELECT Count(*) FROM Users WHERE Username='{0}'", username);
        int temp = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (temp < 1)
        {
            return 1;
        }

        query = String.Format("SELECT Count(*) FROM Users WHERE Username='{0}' and Password='{1}'", username, password);
        temp = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (temp < 1)
        {
            return 2;
        }
        Account user = new Account();
        user.username = username;
        user.GetInfoByUsername();
        if (user.isActived==0)
        {
            return 0;
        }
        return 3;
    }
}