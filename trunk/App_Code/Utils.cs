﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

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

    public static string RandomPassword()
    {
        // số ks tự của password
        const byte LENGTH = 6;
        // chiều dài chuỗi để lấy các kí tự sẽ sử dụng cho captcha
        const string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder result = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < LENGTH; i++)
        {
            // Lấy kí tự ngẫu nhiên từ mảng chars
            string str = chars[rand.Next(chars.Length)].ToString();
            result.Append(str);
        }
        return result.ToString();
    }

    /// <summary>
    /// Hàm gửi mail với mail client là gmail
    /// </summary>
    /// <param name="emailto">Mail muốn gửi đến</param>
    /// <param name="subject">Tựa đề mail</param>
    /// <param name="content">Nội dung mail</param>
    public static void SendEMail(string emailto,string subject, string content)
    {
        SendMail.SendEMail2("smtp.googlemail.com", "sieuthidienthoai.cnw@gmail.com", "sieuthidienthoai.cnw@gmail.com", "123456cnw",
                            587, emailto, subject, content, true);
    }
}
