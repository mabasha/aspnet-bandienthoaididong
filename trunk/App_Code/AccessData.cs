using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AccessData
/// </summary>
public class AccessData
{
    public static string ConnectString = ConfigurationManager.ConnectionStrings["MobileShopConnectionString"].ConnectionString;
    public static SqlConnection GetConnect()
    {
        return new SqlConnection(ConnectString);
    }
    //hàm trả về 1 datatable
    public static DataTable GetTable(string sql)
    {
        SqlConnection con = GetConnect();
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        con.Close();
        return dt;
    }
    //hàm thực thi lệnh executenonquery
    public static void ExecuteNonQuery(string sql)
    {
        SqlConnection con = GetConnect();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
    }
    //Hàm thực thi lệnh ExecuteScalar để trả về 1 giá trị
    public static object ExecuteScalar(string sql)
    {
        SqlConnection con = GetConnect();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        object kq = cmd.ExecuteScalar();
        con.Close();
        cmd.Dispose();
        return kq;
    }
    public static SqlDataReader ExecuteReader(string sql)
    {
        SqlConnection con = GetConnect();
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static int GetMaxID(string table)
    {
        object result = ExecuteScalar("SELECT MAX(ID) FROM " + table);
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }
}