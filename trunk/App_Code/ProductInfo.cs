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
    int number;

    public int ProductID
    {
        get { return productID; }
    }

    public bool IsPhone
    {
        get { return isPhone; }
    }

    public int Number
    {
        get { return number; }
    }

	public ProductInfo(int productID, bool isPhone, int number)
	{
        this.productID = productID;
        this.isPhone = isPhone;
        this.number = number;
	}

    public static void AddProductList(int productID, bool isPhone, int number, ref List<ProductInfo> productList)
    {
        ProductInfo info = new ProductInfo(productID, isPhone, number);
        productList.Add(info);
    }

    public static List<ProductInfo> GetSeperateList(List<ProductInfo> li, bool isPhone)
    {
        List<ProductInfo> sepList = new List<ProductInfo>();

        foreach(ProductInfo info in li)
        {
            if(info.isPhone == isPhone)
                sepList.Add(info);
        }

        return sepList;
    }
}