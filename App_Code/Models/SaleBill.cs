using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for SaleBill
/// </summary>
public class SaleBill
{
	public int id;
    public string salerUsername;
    public string customName;
    public string address;
    public string tel;
    public DateTime createdDate;
    public string customUsername;

    public SaleBill()
    {
    }

	public SaleBill(int id)
	{
        this.id = id;
	}

    public SaleBill(int id, string salerUsername, string customUsername, DateTime createdDate)
    {
        this.id = id;
        this.salerUsername = salerUsername;
        this.customUsername = customUsername;
        this.createdDate = createdDate;
    }

    public SaleBill(int id, string salerUsername, string customName,
        string address, string tel, DateTime createdDate)
    {
        this.id = id;
        this.salerUsername = salerUsername;
        this.customName = customName;
        this.address = address;
        this.tel = tel;
        this.createdDate = createdDate;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from SaleBill where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        salerUsername = (string)dt.Rows[0]["SalerUsername"];
        customName = (string)dt.Rows[0]["CustomName"];
        address = (string)dt.Rows[0]["Address"];
        tel = (string)dt.Rows[0]["Tel"];
        createdDate = (DateTime)dt.Rows[0]["CreatedDate"];
        customUsername = (string)dt.Rows[0]["CustomUsername"];
    }

    public bool Insert()
    {
        id = GetMaxID() + 1;
        string query = String.Format("insert into SaleBill"+
            "(ID, SalerUsername, CustomName, Address, Tel, CreatedDate, CustomUsername) "+
            "values('{0}',N'{1}',N'{2}', N'{3}', '{4}', '{5}', N'{6}')",
            id, salerUsername, customName, address, tel, createdDate, customUsername);
        AccessData.ExecuteNonQuery(query);
        return true;
    }

    public bool Update()
    {
        string query = String.Format("update SaleBill "+
            "set SalerUsername = N'{0}', CustomName = N'{1}', Address = N'{2}', "+
            "Tel =  '{3}', CreatedDate = '{4}', CustomUsername = N'{5}' "+
            "where ID = {6}", salerUsername, customName, address, tel, createdDate, customUsername, id);
        AccessData.ExecuteNonQuery(query);
        return true;
    }

    public void Delete()
    {
        SaleBillDt.Delete(id);
        string query = String.Format("delete from SaleBill where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public int GetNumberDetail()
    {
        string query = String.Format("select count(SaleBillDt.ID) from SaleBillDt, SaleBill "+
            "where SaleBill.ID = SaleBillDt.SaleBillID and SaleBillID = {0}",id);
        object oNum = AccessData.ExecuteScalar(query);
        return Convert.ToInt32(oNum);
    }

    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from SaleBill");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from SaleBill");
    }

    public static DataTable EmployeeReport(string keyword)
    {
        string query = String.Format("select Users.Username, Users.Fullname, " +
            "SUM(price*number) as ValueSold, SUM(number) as NumberSold from Users, SaleBillDt, SaleBill " +
            "where SaleBillDt.SaleBillID = SaleBill.ID " +
            "and SaleBill.SalerUsername = Users.Username " +
            "and (Users.Decentralize = 'Administrator' or Users.Decentralize = 'Employee') " +
            "and (Username like '%{0}%' or FullName like '%{0}%')" +
            "group by Username, FullName", keyword);
        return AccessData.GetTable(query);
    }

    public static DataTable EmployeeReport(string keyword, DateTime from, DateTime to)
    {
        string query = String.Format("select Users.Username, Users.Fullname, " +
            "SUM(price*number) as ValueSold, SUM(number) as NumberSold from Users, SaleBillDt, SaleBill " +
            "where SaleBillDt.SaleBillID = SaleBill.ID " +
            "and SaleBill.SalerUsername = Users.Username " +
            "and (Users.Decentralize = 'Administrator' or Users.Decentralize = 'Employee') " +
            "and (Username like '%{0}%' or FullName like '%{0}%') "+
            "and CreatedDate between '{1}' and '{2}' " +
            "group by Username, FullName", keyword, from, to);
        return AccessData.GetTable(query);
    }
}
