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
        string query = "SELECT ImportBill.ID, ImportBill.CreatedDate, Phone.Name, ImportBillDt.IsPhone, ImportBillDt.Number, ImportBillDt.Price FROM ImportBill, ImportBillDt,Phone WHERE (ImportBill.ID=ImportBillDt.ImportBillID AND ImportBillDt.ProductID=Phone.ID)";
        return AccessData.GetTable(query);
    }
}
