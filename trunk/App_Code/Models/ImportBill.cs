using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ImportBill
/// </summary>
public class ImportBill
{
    private int id;
    string username;
    string createdDate;
	public ImportBill()
	{		
	}
    public ImportBill(int id)
    {
        this.id = id;
    }
    public ImportBill(int id, string username, string createdDate)
    {
        this.id = id;
        this.username = username;
        this.createdDate = createdDate;
    }
    public static DataTable GetAll()
    {
        string query = "SELECT ImportBill.ID, Users.Username, ImportBill.CreatedDate" 
                      + " FROM ImportBill, Users"
                      + " WHERE ImportBill.ImporterUsername = Users.Username";
        return AccessData.GetTable(query);
    }
    public void Delete()
    {        
        string query_imp = String.Format("delete from ImportBill where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query_imp);        
    }
    public void Insert()
    {
        id = GetMaxID() + 1;
        string query = String.Format("insert into ImportBill(ID, ImporterUsername, CreatedDate) values('{0}', N'{1}', N'{2}')", id, username, createdDate);
        AccessData.ExecuteNonQuery(query);                
    }
    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from ImportBill");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }
}
