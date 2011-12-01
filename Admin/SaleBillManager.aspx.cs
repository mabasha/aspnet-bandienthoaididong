using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_SaleBillManager : System.Web.UI.Page
{

    

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtSaler = Account.GetUsers("Administrator", "Employee", "Manager");
        dtSaler.DefaultView.Sort = "Username";
        dSaler.DataSource = dtSaler;
        dSaler.DataTextField = "Username";
        dSaler.DataValueField = "Username";
        dSaler.DataBind();

        bChooseCustomer.OnClientClick = "window.open(\"AccountChooser.aspx?receiveID=tCustomerName\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
    }
    protected void bShowCustomerInfo_Click(object sender, EventArgs e)
    {
        if (tCustomerName.Text != "")
        {
            Account customer = new Account(tCustomerName.Text);
            customer.GetInfoByUsername();

            tAddress.Text = customer.address;
            tPhone.Text = customer.tel;
        }
    }
}
