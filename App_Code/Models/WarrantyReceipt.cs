﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for WarrantyReceipt
/// </summary>
public class WarrantyReceipt
{
    private int id;
    private bool isphone;
    private int proID;
    private string Imei;
    private string cDate;
    private string reason;
    private string cusName;
    private string tel;
    private bool isReturned;
    private string rDate;
    private string description;
    private string outofdate;

	public WarrantyReceipt(int id)
	{
        this.id = id;
	}
    public WarrantyReceipt(int id, string reason, bool isReturned, string rDate, string description)
    {
        this.id = id;        
        this.reason = reason;        
        this.isReturned = isReturned;
        this.rDate = rDate;
        this.description = description;        
    }
    public WarrantyReceipt(int id, bool isphone, int proID, string Imei, 
                            string cDate, string reason, string cusName,
                            string tel, bool isReturned, string rDate, string description, string outofdate)
    {
        this.id = id;
        this.isphone = isphone;
        this.proID = proID;
        this.Imei = Imei;
        this.cDate = cDate;
        this.reason = reason;
        this.cusName = cusName;
        this.tel = tel;
        this.isReturned = isReturned;
        this.rDate = rDate;
        this.description = description;
        this.outofdate = outofdate;
    }
    public static DataTable GetAll()
    {
        string query = "SELECT ID, IsPhone, ProductID, IMEI, CreatedDate, OutofDate, Reason, CustomerName, Tel, IsReturned, ReturnedDate, Description "
                      + "FROM WarrantyReceipt";

        return AccessData.GetTable(query);
    }
    public void Insert()
    {
        id = GetMaxID() + 1;
        string query = String.Format("INSERT INTO WarrantyReceipt(ID, IsPhone, ProductID, IMEI, CreatedDate, Reason, CustomerName, Tel, IsReturned, ReturnedDate, Description, OutOfDate) "
                                    + "VALUES ('{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}', N'{9}', N'{10}', N'{11}')", id, isphone, proID, Imei, cDate, reason, cusName, tel, isReturned, rDate, description, outofdate);               
        AccessData.ExecuteNonQuery(query);
    }
    public static int GetMaxID()
    {
        object result = AccessData.ExecuteScalar("select max(ID) from WarrantyReceipt");
        try     
        {
            return Convert.ToInt32(result);
        }
        catch (Exception) { }
        return 0;
    }
    public void Delete()
    {
        string query = String.Format("DELETE FROM WarrantyReceipt WHERE ID = {0}", id);
        AccessData.ExecuteNonQuery(query);
    }
    public void Update()
    {
        string query = String.Format("UPDATE WarrantyReceipt "
                                    + "SET IsReturned = '{0}', Reason = N'{1}', Description = N'{2}', ReturnedDate = '{3}' "
                                    + "WHERE ID = {4}", isReturned, reason, description, rDate, id);
        AccessData.ExecuteNonQuery(query);
    }
}
