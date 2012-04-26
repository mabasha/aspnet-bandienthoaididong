using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SaleBillPrint : System.Web.UI.Page
{
    static int id;

    protected void Page_Load(object sender, EventArgs e)
    {

        id = Convert.ToInt32(Request.QueryString["id"]);
        SaleBill saleBill = new SaleBill(id);

        saleBill.GetInfoByID();
        Account saler = new Account(saleBill.salerUsername);
        saler.GetInfoByUsername();
        lSaler.Text = saler.fullname;

        lbCreatedDate.Text = String.Format("{0:dd/MM/yyyy}", saleBill.createdDate);

        if (saleBill.customUsername != null)
        {
            Account customer = new Account(saleBill.customUsername);
            customer.GetInfoByUsername();

            lCustomerName.Text = customer.fullname;
            lTel.Text = customer.tel;
            lAddress.Text = customer.address;
        }
        else
        {
            lCustomerName.Text = saleBill.customName;
            lTel.Text = saleBill.tel;
            lAddress.Text = saleBill.address;
        }

        if (!IsPostBack)
        {
            FillData();
        }
        lSum.Text = String.Format("{0:0,##0} VND", SaleBill.GetSumPrice(id));
    }

    void FillData()
    {
        gridPhone.DataSource = SaleBillDt.GetAllByID(id, true);
        gridPhone.DataBind();

        gridAccessory.DataSource = SaleBillDt.GetAllByID(id, false);
        gridAccessory.DataBind();

        if (gridPhone.Rows.Count == 0) lPhone.Visible = false;

        if (gridAccessory.Rows.Count == 0) lAcc.Visible = false;
    }
}