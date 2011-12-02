using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_SaleBillManager : System.Web.UI.Page
{

    DataTable dtBillDt;

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

        if (rPhone.Checked == true)
        {
            bChooseProduct.OnClientClick = "window.open(\"PhoneChooser.aspx?receiveID=tProductID\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
        }
        else if (rAccessory.Checked == true)
        {
            bChooseProduct.OnClientClick = "window.open(\"AccessoryChooser.aspx?receiveID=tProductID\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
        }

        if (IsPostBack == false)
        {
            FillData();

            dtBillDt = Utils.CreateDataTable("ProductID", "ProductName",
            "ProductIMEI", "Number", "Price");

            ViewState["dtBillDt"] = dtBillDt;
        }
        else
        {
            dtBillDt = (DataTable)ViewState["dtBillDt"];
        }

        lInfoDt.Text = "";

    }

    private void FillData()
    {
        gAddDetail.DataSource = dtBillDt;
        gAddDetail.DataBind();
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
    protected void bShowName_Click(object sender, EventArgs e)
    {
        if (tProductID.Text != "")
        {
            if (rPhone.Checked == true)
            {
                Phone phone = new Phone(Convert.ToInt32(tProductID.Text));
                phone.GetInfoByID();
                lProductName.Text = phone.name;
                lPrice.Text = phone.price.ToString();
            }
            else if (rAccessory.Checked == true)
            {
                Accessory acc = new Accessory(Convert.ToInt32(tProductID.Text));
                acc.GetInfoByID();
                lProductName.Text = acc.name;
                lPrice.Text = acc.price.ToString();
            }
        }
    }
    protected void bAddBillDt_Click(object sender, EventArgs e)
    {
        if (lProductName.Text != "")
        {
            object[] row = new object[5];
            row[0] = tProductID.Text;
            row[1] = lProductName.Text;
            row[2] = tIMEI.Text;
            row[3] = tNumber.Text;
            row[4] = lPrice.Text;

            dtBillDt.Rows.Add(row);
            ViewState["dtBillDt"] = dtBillDt;

            FillData();
        }
        else
        {
            lInfoDt.Text = "<span class=error>Chưa hiện chi tiết sản phẩm.</span>";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {

    }
}
