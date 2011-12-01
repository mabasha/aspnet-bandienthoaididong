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
	public ImportBill()
	{		
	}    
    public static DataTable GetAll()
    {
        string query = "SELECT ImportBill.ID, Users.FullName, ImportBill.CreatedDate" 
                      + " FROM ImportBill, Users"
                      + " WHERE ImportBill.ImporterUsername = Users.Username";
        return AccessData.GetTable(query);
    }
}
