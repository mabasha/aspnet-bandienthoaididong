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
    public ImportBillDt(int id, string pID, string isphone, string number, string price)
    {
        this.id = id;        
        this.pID = pID;
        this.isphone = isphone;
        this.number = number;
        this.price = price;
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
        //string query = "SELECT ImportBillID, ID, ImportBillID, ProductID , IsPhone, Number, Price"
        //              + " FROM ImportBillDt";                      
        return AccessData.GetTable("SELECT * FROM ImportBillDt");
    }
    public static DataTable GetAll(string ImportBillID)
    {
        string query = String.Format("select * from ImportBillDt where ImportBillID = {0}", ImportBillID);
        return AccessData.GetTable(query);
    }
    public static DataTable GetAllByID(int importBillID, bool isPhone)
    {   
        string query;
        if (isPhone == true)
        {
            query = String.Format("select Phone.Name, ImportBillDt.* from Phone, ImportBillDt "+
                "where ImportBillDt.ProductID = Phone.ID and ImportBillDt.ImportBillID = {0} and ImportBillDt.IsPhone = 'True'", importBillID);            
        }
        else
        {
            query = String.Format("select Accessory.Name, ImportBillDt.* from Accessory, ImportBillDt "+
                "where ImportBillDt.ProductID = Accessory.ID and ImportBillDt.ImportBillID = {0} and ImportBillDt.IsPhone = 'False'", importBillID); 
        }
        return AccessData.GetTable(query);
    }
    public void Insert()
    {                        
        id = GetMaxID() + 1;
        string query = String.Format("insert into ImportBillDt(ID, ImportBillID, ProductID, IsPhone, Number, Price) " 
                                    + "values('{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}')", id, IbID, pID, isphone, number, price );
        AccessData.ExecuteNonQuery(query);
        UpdateInsertResidualAmount();        
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
        getInfoFromID();
        UpdateDeleteResidualAmount();
        string query = String.Format("delete from ImportBillDt where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);        
    }
    public void Update()
    {
        UpdateEditResidualAmount();
        string query = String.Format("UPDATE ImportBillDt "
                                   + "SET ProductID = '{0}', IsPhone = '{1}', Number = '{2}', Price = '{3}' "
                                   + "WHERE ID = '{4}'", pID, isphone, number, price, id);
        AccessData.ExecuteNonQuery(query);        
    }
    // cập nhật số lượng tồn Accessory & Phone    
    public void UpdateInsertResidualAmount()
    {
        int proID = Convert.ToInt32(pID);
        int num = Convert.ToInt32(number);
        if (isphone == "True")
        {                        
            Phone phone = new Phone(proID);
            int slTon = phone.GetAmount();
            int slTonMoi = slTon + num;
            phone.SetAmount(slTonMoi);
        }        
        else if (isphone == "False")
        {            
            Accessory acc = new Accessory(proID);
            int slTon = acc.GetAmount();
            int slTonMoi = slTon + num;
            acc.SetAmount(slTonMoi);
        }
    }
    public void UpdateDeleteResidualAmount()
    {
        int proID = Convert.ToInt32(pID);
        int num = Convert.ToInt32(number);
        if (isphone == "True")
        {
            Phone phone = new Phone(proID);
            int slTon = phone.GetAmount();
            int slTonMoi = slTon - num;
            phone.SetAmount(slTonMoi);
        }
        else if (isphone == "False")
        {
            Accessory acc = new Accessory(proID);
            int slTon = acc.GetAmount();
            int slTonMoi = slTon - num;
            acc.SetAmount(slTonMoi);
        }
    }
    public void UpdateEditResidualAmount() 
    {
        Phone phone;
        Accessory acc;
        //trả về số lượng tồn ban đầu khi chưa thêm hóa đơn
        phone = new Phone(GetProducID());
        acc = new Accessory(GetProducID());
        if (GetIsPhone() == "True")
        {
            int slTonPhone = phone.GetAmount();
            phone.SetAmount(slTonPhone - GetNumber());
        }
        else if (GetIsPhone() == "False")
        {
            int slTonAcc = acc.GetAmount();
            acc.SetAmount(slTonAcc - GetNumber());
        }
        //sửa lại số lượng tồn khi đã Edit
        int proID = Convert.ToInt32(pID);
        int num = Convert.ToInt32(number);
        phone = new Phone(proID);
        acc = new Accessory(proID);
        if (isphone == "True")
        {
            int slTonPhone = phone.GetAmount();
            phone.SetAmount(slTonPhone + num);
        }
        else if (isphone == "False")
        {
            int slTonAcc = acc.GetAmount();
            acc.SetAmount(slTonAcc + num);
        }
    }
    //kết thúc cập nhật số lượng tồn
    public void getInfoFromID()
    {
        string query;
        object result;
        query = String.Format("select ImportBillID from ImportBillDt where ID = {0}", id);
        result = AccessData.ExecuteScalar(query);
        IbID = Convert.ToInt32(result);
        
        query = String.Format("select ProductID from ImportBillDt where ID = {0}", id);
        result = AccessData.ExecuteScalar(query);
        pID = Convert.ToString(result);
        
        query = String.Format("select IsPhone from ImportBillDt where ID = {0}", id);
        result = AccessData.ExecuteScalar(query);
        isphone = Convert.ToString(result);
        
        query = String.Format("select Number from ImportBillDt where ID = {0}", id);
        result = AccessData.ExecuteScalar(query);
        number = Convert.ToString(result);
        
        query = String.Format("select Price from ImportBillDt where ID = {0}", id);
        result = AccessData.ExecuteScalar(query);
        price = Convert.ToString(result);
    }
    private int GetNumber()
    {
        string query = String.Format("select Number from ImportBillDt where ID = {0}", id);
        object re = AccessData.ExecuteScalar(query);
        return Convert.ToInt32(re);
    }
    private string GetIsPhone()
    {
        string query = String.Format("select IsPhone from ImportBillDt where ID = {0}", id);
        object re = AccessData.ExecuteScalar(query);
        return Convert.ToString(re);
    }
    private int GetProducID()
    {
        string query = String.Format("select ProductID from ImportBillDt where ID = {0}", id);
        object re = AccessData.ExecuteScalar(query);
        return Convert.ToInt32(re);
    }
}
