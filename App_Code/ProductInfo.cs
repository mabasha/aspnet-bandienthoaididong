using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// Summary description for ProductInfo
/// </summary>
public class ProductInfo
{
    int productID;
    bool isPhone;

    public int ProductID
    {
        get { return productID; }
    }

    public bool IsPhone
    {
        get { return isPhone; }
    }

	public ProductInfo(int productID, bool isPhone)
	{
        this.productID = productID;
        this.isPhone = isPhone;
	}

    public static void AddProductList(int productID, bool isPhone, ref List<ProductInfo> productList)
    {
        ProductInfo info = new ProductInfo(productID, isPhone);
        productList.Add(info);
    }

    public static List<int> GetSeperateList(List<ProductInfo>li, bool isPhone)
    {
        List<int> idList= new List<int>();

        foreach(ProductInfo info in li)
        {
            if(info.isPhone == isPhone)
                idList.Add(info.productID);
        }

        return idList;
    }
}