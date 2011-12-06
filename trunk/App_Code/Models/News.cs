using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for News
/// </summary>
public class News
{
    public int id;
    public string title;
    public string introContent;
    public string content;
    public string author;
    public string category;
    public DateTime createdDate;
    public int views;

	public News()
	{
	}

    public News(int id)
    {
        this.id = id;
    }

    public News(int id, string title, string introContent, 
        string content, string author,
        string category, DateTime createdDate)
    {
        this.id = id;
        this.title = title;
        this.introContent = introContent;
        this.content = content;
        this.author = author;
        this.category = category;
        this.createdDate = createdDate;
    }

    public void GetInfoByID()
    {
        string query = String.Format("select * from News where ID =  {0}", id);
        DataTable dt = AccessData.GetTable(query);
        title = (string)dt.Rows[0]["title"];
        introContent = (string)dt.Rows[0]["introContent"];
        content = (string)dt.Rows[0]["contents"];
        author = (string)dt.Rows[0]["author"];
        category = (string)dt.Rows[0]["category"];
        createdDate = (DateTime)(dt.Rows[0]["createdDate"]);
        views = Convert.ToInt32((dt.Rows[0]["views"]));
    }

    public void Insert()
    {
        id = AccessData.GetMaxID("News") + 1;
        string query = String.Format("insert into News(ID, Contents, "+
            "Author, Category, CreatedDate, Views, IntroContent, Title) "+
            "values({0},N'{1}',N'{2}',N'{3}','{4}',{5},N'{6}', N'{7}')", id, content, 
            author, category, createdDate, views, introContent,title);
        
        AccessData.ExecuteNonQuery(query);
    }

    public void Update()
    {
        string query = String.Format("update News set Contents = N'{0}', Author = N'{1}', "+
            "Category = N'{2}', CreatedDate = '{3}', Views = {4}, IntroContent = N'{5}', Title = N'{6}' where ID = {7}",
            content, author, category, createdDate, views, introContent, title, id);
        AccessData.ExecuteNonQuery(query);
    }

    public void Delete()
    {
        string query = String.Format("delete from News where ID = '{0}'", id);
        AccessData.ExecuteNonQuery(query);
    }

    public static DataTable GetAll()
    {
        return AccessData.GetTable("select * from News");
    }

    public static DataTable GetAllWithKeyword(string keyword)
    {
        String query = String.Format("select * from News where Title like N'%{0}%' "+
            "or Author like N'%{0}%' or IntroContent like N'%{0}%'", keyword);
        return AccessData.GetTable(query);
    }
}
