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
        string salerUsername = null;
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
            salerUsername = Session["username"].ToString();
        else if (cookie != null)
            salerUsername = cookie["username"].ToString();
        lSalerUsername.Text = salerUsername;

        bChooseCustomer.OnClientClick = String.Format("window.open(\"AccountChooser.aspx?receiveID={0}\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tCustomerName.ClientID);

        if (rPhone.Checked == true)
        {
            bChooseProduct.OnClientClick = String.Format("window.open(\"PhoneChooser.aspx?receiveID={0}\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tProductID.ClientID);
        }
        else if (rAccessory.Checked == true)
        {
            bChooseProduct.OnClientClick = String.Format("window.open(\"AccessoryChooser.aspx?receiveID={0}\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tProductID.ClientID);
        }

        if (IsPostBack == false)
        {
            FillDataAddSaleDt();
            FillDataSale();
            FillDataSaleDt();

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

    private void FillDataAddSaleDt()
    {
        gAddDetail.DataSource = dtAddBillDt;
        gAddDetail.DataBind();
    }

    private void FillDataSale(string sortExp)
    {
        DataTable dt = SaleBill.GetAll();
        if (sortExp != "")
        {
            dt.DefaultView.Sort = sortExp;
        }
        gShowBill.DataSource = dt;
        gShowBill.DataBind();
    }

    private void FillDataSale()
    {
        FillDataSale("");
    }

    private void FillDataSaleDt(string sortExp)
    {
        if (gShowBill.Rows.Count > 0)
        {
            if (gShowBill.SelectedIndex == -1)
            {
                gShowBill.SelectedIndex = 0;
            }

            if (gShowBill.SelectedRow.Cells[0].Text != "")
            {
                DataTable dt = SaleBillDt.GetAll(gShowBill.SelectedRow.Cells[0].Text);
                if (sortExp != "")
                {
                    dt.DefaultView.Sort = sortExp;
                }
                gShowBillDt.DataSource = dt;
                gShowBillDt.DataBind();
            }
        }
    }

    private void FillDataSaleDt()
    {
        FillDataSaleDt("");
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
                lPrice.Text = String.Format("{0:0,##0}",phone.price)+" đồng";
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

            int productID = Convert.ToInt32(tProductID.Text);
            int number = Convert.ToInt32(tNumber.Text);

            if (rPhone.Checked == true)
            {
                Phone phone = new Phone(productID);         //kiểm tra số lượng tồn có đủ hay không
                phone.GetInfoByID();
                if (phone.residualAmount < number)
                {
                    lInfoDt.Text = "<span style=\"color:red;\">Mặt hàng không đủ số lượng bán</span>";
                    return;
                }
            }
            else
            {
                Accessory acc = new Accessory(productID);
                acc.GetInfoByID();
                if (acc.residualAmount < number)
                {
                    lInfoDt.Text = "<span style=\"color:red;\">Mặt hàng không đủ số lượng bán</span>";
                    return;
                }
            }

            dtAddBillDt.Rows.Add(row);
            ViewState["dtAddBillDt"] = dtAddBillDt;

            FillDataAddSaleDt();

            tProductID.Text = "";
            lProductName.Text = "";
            lPrice.Text = "";
            tIMEI.Text = "";
            tNumber.Text = "";
        }
        else
        {
            lInfoDt.Text = "<div class=error_box>Chưa hiển thị chi tiết sản phẩm </div>";
        }
    }
    protected void bAdd_Click(object sender, EventArgs e)
    {

        if (gAddDetail.Rows.Count > 0)
        {
            //Chèn saleBill.
            //string salerUsername = dSaler.SelectedValue.ToString();
            string salerUsername = null;
            HttpCookie cookie = Request.Cookies["login"];
            if (Session["username"] != null)
                salerUsername = Session["username"].ToString();
            else if (cookie != null)
                salerUsername = cookie["username"].ToString();

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
                string productIMEI="";
                int number = Convert.ToInt32(row.Cells[3].Text);
                bool isPhone;
                if (sIMEI != "&nbsp;")     //điện thoại
                {
                    productIMEI = sIMEI;
                    isPhone = true;
                }
                else
                {
                    isPhone = false;
                }
                
                double price = Convert.ToDouble(row.Cells[4].Text);
                

                SaleBillDt saleBillDt = new SaleBillDt(0, saleBillID, productID,
                    productIMEI, isPhone, number, price);
                saleBillDt.Insert();

                

                dtAddBillDt.Rows.Clear();
                ViewState["dtAddBillDt"] = dtAddBillDt;
                FillDataSale();
                FillDataSaleDt();

                tCustomerName.Text = "";
                tAddress.Text = "";
                tPhone.Text = "";
            }
        }
        else
        {
            lInfoDt.Text = "<div class=error_box>Chưa có sản phẩm nào</div>";
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
            bChooseCustomer.Visible = true;
            bShowCustomerInfo.Visible = true;
        }
    }
    protected void rUnregisted_CheckedChanged(object sender, EventArgs e)
    {
        if (rUnregisted.Checked == true)
        {
            tAddress.Enabled = true;
            tPhone.Enabled = true;
            bChooseCustomer.Visible = false;
            bShowCustomerInfo.Visible = false;
        }
    }
    protected void gAddDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtAddBillDt.Rows[e.RowIndex].Delete();
        ViewState["dtAddBillDt"] = dtAddBillDt;
        FillDataSale();
        FillDataAddSaleDt();
    }
    protected void gShowBillDt_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void gShowBill_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBill_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SaleBill sale = new SaleBill(Convert.ToInt32(gShowBill.Rows[e.RowIndex].Cells[0].Text));
        sale.Delete();
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBill_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[8].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa hóa đơn này không ?')) return false;";
        }
    }
    protected void gShowBill_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gShowBill.EditIndex = -1;
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBill_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gShowBill.EditIndex = e.NewEditIndex;
        FillDataSale();
        FillDataSaleDt();

        //Lấy dữ liệu từ trang popup
        Button bChooseCustomUsername = (Button)gShowBill.Rows[gShowBill.EditIndex].FindControl("bChooseCustomUsername");
        TextBox tCustomUsernameTmp = (TextBox)gShowBill.Rows[gShowBill.EditIndex].FindControl("tCustomUsernameTmp");
        bChooseCustomUsername.OnClientClick = String.Format("window.open(\"AccountChooser.aspx?receiveID={0}\", 'mypopup', " +
            "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tCustomUsernameTmp.ClientID);
    }
    protected void gShowBill_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gShowBill.Rows[e.RowIndex].Cells[0].Text);
        SaleBill bill = new SaleBill(id);
        bill.GetInfoByID();

        TextBox tCustomerUsernameUpd = (TextBox)(TextBox)gShowBill.Rows[gShowBill.EditIndex].FindControl("tCustomUsernameTmp");
        TextBox tCustomerNameUpd = (TextBox)gShowBill.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox tAddressUpd = (TextBox)gShowBill.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox tTelUpd = (TextBox)gShowBill.Rows[e.RowIndex].Cells[5].Controls[0];

        if (tCustomerUsernameUpd.Text != "")
        {
            bill.customUsername = tCustomerUsernameUpd.Text;
        }
        else
        {
            bill.customName = tCustomerNameUpd.Text;
            bill.address = tAddressUpd.Text;
            bill.tel = tTelUpd.Text;
            bill.customUsername = "";
        }

        bill.Update();
        gShowBill.EditIndex = -1;
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBillDt_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState == DataControlRowState.Alternate ||
            e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton bDelete = (ImageButton)e.Row.Cells[7].Controls[0];
            bDelete.OnClientClick = "if(!confirm('Bạn có chắc muốn xóa chi tiết hóa đơn này không ?')) return false;";

        }
    }
    protected void gShowBillDt_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SaleBillDt sale = new SaleBillDt(Convert.ToInt32(gShowBillDt.Rows[e.RowIndex].Cells[0].Text));
        sale.Delete();
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBillDt_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gShowBillDt.EditIndex = e.NewEditIndex;
        FillDataSale();
        FillDataSaleDt();

        //Lấy dữ liệu từ trang popup
        RadioButton rPhoneTmp = (RadioButton)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("rPhoneTmp");
        Button bChoosePhoneIDTmp = (Button)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("bChoosePhoneIDTmp");
        Button bChooseAccessoryIDTmp = (Button)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("bChooseAccessoryIDTmp");
        TextBox tProductIDTmp = (TextBox)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("tProductIDTmp");
        bChoosePhoneIDTmp.OnClientClick = String.Format("window.open(\"PhoneChooser.aspx?receiveID={0}\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tProductIDTmp.ClientID);

        bChooseAccessoryIDTmp.OnClientClick = String.Format("window.open(\"AccessoryChooser.aspx?receiveID={0}\", 'mypopup', " +
            "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tProductIDTmp.ClientID);
    }
    protected void gShowBillDt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gShowBillDt.EditIndex = -1;
        FillDataSale();
        FillDataSaleDt();
    }
    protected void gShowBillDt_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox tProductIDUpd = (TextBox)(TextBox)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("tProductIDTmp");
        TextBox tIMEIUpd = (TextBox)gShowBillDt.Rows[e.RowIndex].Cells[3].Controls[0];
        RadioButton rIsPhoneUpd = (RadioButton)gShowBillDt.Rows[gShowBillDt.EditIndex].FindControl("rPhoneTmp");
        TextBox tNumberUpd = (TextBox)gShowBillDt.Rows[e.RowIndex].Cells[5].Controls[0];

        if (tProductIDUpd.Text != "" && tNumberUpd.Text != "")
        {
            Phone phone;
            Accessory accessory;
            
            //Lấy thông tin đầy đủ của BillDt hiện tại
            int id = Convert.ToInt32(gShowBillDt.Rows[e.RowIndex].Cells[0].Text);
            SaleBillDt bill = new SaleBillDt(id);
            bill.GetInfoByID();

            //Lấy giá sản phẩm, id
            int productID = Convert.ToInt32(tProductIDUpd.Text);
            double price;

            if (rIsPhoneUpd.Checked == true)
            {
                phone = new Phone(productID);
                phone.GetInfoByID();
                price = phone.price;
            }
            else
            {
                accessory = new Accessory(productID);
                accessory.GetInfoByID();
                price = accessory.price;
            }

            bill.productID = productID;
            bill.productIMEI = tIMEIUpd.Text;
            bill.isPhone = rIsPhoneUpd.Checked;
            bill.number = Convert.ToInt32(tNumberUpd.Text);
            bill.price = price;

            bill.Update();

            gShowBillDt.EditIndex = -1;
            FillDataSaleDt();
        }
        else
        {
            lInfoDt.Text = "<div class=error_box> Chưa nhập đầy đủ thông tin </div>";
        }
        
    }
    protected void gShowBill_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowBill.PageIndex = e.NewPageIndex;
        FillDataSale();
    }
    protected void gShowBill_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataSale(e.SortExpression);
    }
    protected void gShowBillDt_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShowBillDt.PageIndex = e.NewPageIndex;
        FillDataSaleDt();
    }
    protected void gShowBillDt_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataSaleDt(e.SortExpression);
    }
}
