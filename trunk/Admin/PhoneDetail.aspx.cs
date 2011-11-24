//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Admin_PhoneDetail : System.Web.UI.Page
{
    public static int id = 1;
    public Phone phone = new Phone(id);
    protected void Page_Load(object sender, EventArgs e)
    {
        img_Phone.ImageUrl = "~/Images/Phone/" + phone.image + ".jpg";
        lb_PhoneName.Text = phone.name;
        //lb_Price.Text = System.String.Format(phone.price.ToString(), "#,##0 VNĐ");
        string temp = String.Format("{0:0,0 VNĐ}", phone.price);
        lb_Price.Text = temp;
    }
}