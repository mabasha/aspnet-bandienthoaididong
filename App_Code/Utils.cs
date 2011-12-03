using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Utils
/// </summary>
public class Utils
{
	public Utils()
	{

	}

    public static DataTable CreateDataTable(params String[] columnNames)
    {
        DataTable dt = new DataTable();
        foreach (String columnName in columnNames)
        {
            dt.Columns.Add(columnName);
        }

        return dt;
    }

    public static bool SetIsPhoneRadioButton(bool isPhone)
    {
        return isPhone;
    }
}
