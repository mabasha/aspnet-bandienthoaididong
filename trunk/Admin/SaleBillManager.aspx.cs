using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_SaleBillManager : System.Web.UI.Page
{

    DataTable dtAddBillDt;

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

            dtAddBillDt = Utils.CreateDataTable("ProductID", "ProductName",
            "ProductIMEI", "Number", "Price");

            ViewState["dtAddBillDt"] = dtAddBillDt;

            if (rRegisted.Checked == true)
            {
                tAddress.Enabled = false;
                tPhone.Enabled = false;
            }
        }
        else
        {
            dtAddBillDt = (DataTable)ViewState["dtAddBillDt"];
        }

        lInfoDt.Text = "";

    }

    private void FillData()
    {
        gAddDetail.DataSource = dtAddBillDt;
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

            dtAddBillDt.Rows.Add(row);
            ViewState["dtAddBillDt"] = dtAddBillDt;

            FillData();

            tProductID.Text = "";
            lProductName.Text = "";
            lPrice.Text = "";
            tIMEI.Text = "";
            tNumber.Text = "";
        }
        else
        {
            lInfoDt.Text = "<span class=error>Chưa hiện chi tiết sản phẩm.</span>";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {

        if (gAddDetail.Rows.Count > 0)
        {
            //Chèn saleBill.
            string salerUsername = dSaler.SelectedValue.ToString();
            string customName = tCustomerName.Text;
            string address = tAddress.Text;
            string tel = tPhone.Text;
            DateTime now = DateTime.Now;

            SaleBill saleBill=null;

            if (rRegisted.Checked == true)
            {
                saleBill = new SaleBill(0, salerUsername, customName, now);
            }
            else if (rUnregisted.Checked == true)
            {
                saleBill = new SaleBill(0, salerUsername, customName, address, tel, now);
            }
            saleBill.Insert();

            //Chèn saleBillDt
            foreach (GridViewRow row in gAddDetail.Rows)
            {
                int saleBillID = saleBill.id;
                int productID = Convert.ToInt32(row.Cells[0].Text);
                string sIMEI = row.Cells[2].Text;
                int productIMEI=0;
                bool isPhone;
                if (sIMEI != "&nbsp;")     //điện thoại
                {
                    productIMEI = Convert.ToInt32(sIMEI);
                    isPhone = true;
                }
                else
                {
                    isPhone = false;
                }
                int number = Convert.ToInt32(row.Cells[3].Text);
                double price = Convert.ToDouble(row.Cells[4].Text);

                SaleBillDt saleBillDt = new SaleBillDt(0, saleBillID, productID,
                    productIMEI, isPhone, number, price);
                saleBillDt.Insert();
            }

            dtAddBillDt.Rows.Clear();
            ViewState["dtAddBillDt"] = dtAddBillDt;
            
        }
        else
        {
            lInfoDt.Text = "<span class=error>Chưa có sản phẩm nào.</span>";
        }


    }
    protected void rPhone_CheckedChanged(object sender, EventArgs e)
    {
        if (rPhone.Checked == true)
        {
            tIMEI.Enabled = true;
        }
    }
    protected void rAccessory_CheckedChanged(object sender, EventArgs e)
    {
        if (rAccessory.Checked == true)
        {
            tIMEI.Enabled = false;
            tIMEI.Text = "";
        }
    }
    protected void rRegisted_CheckedChanged(object sender, EventArgs e)
    {
        if (rRegisted.Checked == true)
        {
            tAddress.Enabled = false;
            tPhone.Enabled = false;
        }
    }
    protected void rUnregisted_CheckedChanged(object sender, EventArgs e)
    {
        if (rUnregisted.Checked == true)
        {
            tAddress.Enabled = true;
            tPhone.Enabled = true;
        }
    }
    protected void gAddDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtAddBillDt.Rows[e.RowIndex].Delete();
        ViewState["dtAddBillDt"] = dtAddBillDt;
        FillData();
    }
}
