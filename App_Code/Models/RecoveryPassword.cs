using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RecoveryPassword
/// </summary>
public class RecoveryPassword
{
	public RecoveryPassword()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Summary description for Recovery
    /// Phục hồi mật khẩu cho user
    /// Các giá trị trả về : 
    /// 0 : không tồn tại username.
    /// 1 : thành công
    /// </summary>
    public static int Recovery(string username)
    {
        string query = String.Format("SELECT Count(*) FROM Users WHERE Username='{0}'", username);
        int temp = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (temp <1)
        {
            return 0;
        }
        Account user = new Account();
        user.username = username;
        user.GetInfoByUsername();
        user.password = Utils.RandomPassword();
        user.Update();
        return 1;   
    }
}