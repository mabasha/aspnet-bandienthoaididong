using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ImportBillDt
/// </summary>
public class ImportBillDt
{
    private int id;
    private int IbID;
    private string pID;
    private string isphone;
    private string number;
    private string price;
    
	public ImportBillDt()
	{		
	}
    public ImportBillDt(int id)
    {
        this.id = id;
    }
    public ImportBillDt(int id, int IbID, string pID,  string isphone, string number, string price)
    {
        this.id = id;
        this.IbID = IbID;
        this.pID = pID;
        this.isphone = isphone;
        this.number = number;
        this.price = price;
    }
    public static DataTable GetAll()
    {
        string query = "SELECT ImportBillDt.ImportBillID, ImportBillDt.ID, ImportBillDt.ImportBillID, ImportBillDt.ProductID , ImportBillDt.IsPhone, ImportBillDt.Number, ImportBillDt.Price"
                      + " FROM ImportBillDt";
                      //+ " WHERE ImportBillDt.ProductID=Phone.ID";
        return AccessData.GetTable(query);
    }
    public void Insert()
    {                        
        id = GetMaxID() + 1;
        string query = String.Format("insert into ImportBillDt(ID, ImportBillID, ProductID, IsPhone, Number, Price) values('{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}')", id, IbID, pID, isphone, number, price );
        AccessData.ExecuteNonQuery(query);                
    }   
    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from ImportBillDt");
        try
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }
    public void Delete()
    {
        string query = String.Format("delete from ImportBillDt where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }
    public void Update()
    {
        string query = String.Format("update ImportBillDt "
                                   + "SET ProductID = '{0}', IsPhone = '{1}', Number = '{2}', Price = '{3}' "
                                   + "WHERE ID = '{4}'", pID, isphone, number, price, id);
        AccessData.ExecuteNonQuery(query);
    }
}
