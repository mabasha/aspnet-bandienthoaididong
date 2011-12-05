using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ImportBill : System.Web.UI.Page
{
    DataTable dtAddBillDt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (rDienthoai.Checked == true)
        {
            btnTenSp.OnClientClick = "window.open(\"PhoneChooser.aspx?receiveID=txtTenSp\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
        }
        else if (rPhukien.Checked == true)
        {
            btnTenSp.OnClientClick = "window.open(\"AccessoryChooser.aspx?receiveID=txtTenSp\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
        }        
        if (IsPostBack == false)
        {
            FillData();
            FillDataDt();
            FillDataViewstate();
            dtAddBillDt = Utils.CreateDataTable("ProductID", "ProductName", "IsPhone", "Number", "Price");

            ViewState["dtAddBillDt"] = dtAddBillDt;
        }
        else
        {
            dtAddBillDt = (DataTable)ViewState["dtAddBillDt"];
        }
    }
    private void FillData()
    {
        gridImportBill.DataSource = ImportBill.GetAll();
        gridImportBill.DataBind();
    }
    private void FillDataDt()
    {
        gridImportBillDt.DataSource = ImportBillDt.GetAll();
        gridImportBillDt.DataBind();
    }
    private void FillDataViewstate()
    {
        gridViewState.DataSource = dtAddBillDt;
        gridViewState.DataBind();
    }
    protected void gridImportBillDt_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
                   e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnDelete = (ImageButton)e.Row.Cells[7].Controls[0];
            btnDelete.OnClientClick = "if (!confirm('Bạn có đồng ý xóa Chi Tiết Hóa đơn nhập?')) return false";
        }
    }   
    protected void gridImportBillDt_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridImportBillDt.EditIndex = e.NewEditIndex;
        FillDataDt();
        
        RadioButton rDt = (RadioButton)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("rPkTemp");
        RadioButton rPk = (RadioButton)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("rPkTemp");
        Button btnChonDtTemp = (Button)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("btnChonDtTemp");
        Button btnChonPkTemp = (Button)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("btnChonPkTemp");
        TextBox txtMaTemp = (TextBox)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("txtMaSpTemp");

        btnChonDtTemp.OnClientClick = String.Format("window.open(\"PhoneChooser.aspx?receiveID={0}\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", txtMaTemp.ClientID);

        btnChonPkTemp.OnClientClick = String.Format("window.open(\"AccessoryChooser.aspx?receiveID=txtMaTemp\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", txtMaTemp.ClientID);               
    }
    protected void gridImportBillDt_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox maSp = (TextBox)gridImportBillDt.Rows[gridImportBillDt.EditIndex].FindControl("txtMaSpTemp");
        TextBox sl = (TextBox)gridImportBillDt.Rows[gridImportBillDt.EditIndex].Cells[4].Controls[0];
        TextBox price = (TextBox)gridImportBillDt.Rows[gridImportBillDt.EditIndex].Cells[5].Controls[0];
        int id= Convert.ToInt32(gridImportBillDt.Rows[e.RowIndex].Cells[1].Text);
        int ImpId = Convert.ToInt32(gridImportBillDt.Rows[e.RowIndex].Cells[0].Text);
        //string iphone = "True";     
        
        ImportBillDt iDt = new ImportBillDt(id, ImpId, maSp.Text, isPhoneEdit, sl.Text, price.Text);
        iDt.Update();
        gridImportBillDt.EditIndex = -1;
        FillDataDt();        
    }
    protected void gridImportBillDt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridImportBillDt.EditIndex = -1;
        FillDataDt();
    }
    protected void gridImportBill_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Alternate ||
                    e.Row.RowState == DataControlRowState.Normal))
        {
            ImageButton btnDelete = (ImageButton)e.Row.Cells[3].Controls[0];
            btnDelete.OnClientClick = "if (!confirm('Bạn có đồng ý xóa Hóa đơn nhập?')) return false";
        }      
    }
    //protected void gridImportBill_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    gridImportBill.EditIndex = e.NewEditIndex;
    //    FillData();
    //}
    //protected void gridImportBill_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    gridImportBill.EditIndex = -1;
    //    FillData();
    //}
    //protected void btnAddCTHD_Click(object sender, EventArgs e)
    //{      
    //    object re = AccessData.ExecuteScalar("select max(ID) from ImportBill");
    //    int cMaHD = Convert.ToInt32(re);              
    //    ImportBillDt idt = new ImportBillDt(0, cMaHD, txtTenSp.Text, getrLoaisp(), txtNumber.Text, txtPrice.Text);
    //    idt.Insert();
    //    lbThongbaoCTHD.Text = "<p class=info>* Thêm thành công Chi tiết hóa đơn.</p>";
    //    txtTenSp.Text = "";
    //    txtNumber.Text = "";
    //    txtPrice.Text = "";
    //    FillDataDt();
    //}
    private string getrLoaisp()
    {
        if(rDienthoai.Checked == true)
            return "True";
        return "False";
    }
    protected void gridImportBillDt_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ImportBillDt impdt = new ImportBillDt(Convert.ToInt32(gridImportBillDt.Rows[e.RowIndex].Cells[0].Text));
        impdt.Delete();
        lbThongbaoCTHD.Text = "<p class=info>* Bạn đã xóa thành công Chi tiết hóa đơn.</p>";
        FillDataDt();
    }

    protected void gridImportBill_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ImportBill imp = new ImportBill(Convert.ToInt32(gridImportBill.Rows[e.RowIndex].Cells[0].Text));
        imp.Delete();
        lbThongbaoHD.Text = "<p class=info>* Bạn đã xóa thành công hóa đơn.</p>";
        FillData();
        FillDataDt();
    }
    protected void dNguoiNhap_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    //protected void btnAddHD_Click(object sender, EventArgs e)
    //{
    //    ImportBill imp = new ImportBill(0, dNguoiNhap.SelectedValue.ToString(), getCurrentTime());
    //    imp.Insert();
    //    lbThongbaoHD.Text = "<p class=info>* Thêm thành công Hóa đơn.</p>";              
    //    FillData();
    //}   
    private string getCurrentTime()
    {
        return DateTime.Now.ToShortDateString();       
    }    
    protected void btnAddViewstate_Click(object sender, EventArgs e)
    {
        string query = null;
        if (rDienthoai.Checked == true)
        {
            query = String.Format("select Name from Phone where ID = {0}", txtTenSp.Text);
        }
        else if (rPhukien.Checked == true)
        {
            query = String.Format("select Name from Accessory where ID = {0}", txtTenSp.Text);            
        }
        object re = AccessData.ExecuteScalar(query);
        string productName = Convert.ToString(re);

        object[] row = new object[5];
        row[0] = txtTenSp.Text;
        row[1] = productName;
        row[2] = getrLoaisp();
        row[3] = txtNumber.Text;
        row[4] = txtPrice.Text;
        
        dtAddBillDt.Rows.Add(row);
        ViewState["dtAddBillDt"] = dtAddBillDt;

        FillDataViewstate();

        txtTenSp.Text = "";
        txtNumber.Text = "";
        txtPrice.Text = "";
        if (gridViewState.Rows.Count > 0)
            btnThemHD.Visible = true;
        else btnThemHD.Visible = false;
    }
    protected void btnThemHD_Click(object sender, EventArgs e)
    {
        if (gridViewState.Rows.Count > 0)
        {
            ImportBill imp = new ImportBill(0, dNguoiNhap.SelectedValue.ToString(), getCurrentTime());
            imp.Insert();
            lbThongbaoHD.Text = "<p class=info>* Thêm thành công Hóa đơn.</p>";
            FillData();
        }
        object re = AccessData.ExecuteScalar("select max(ID) from ImportBill");
        int cMaHD = Convert.ToInt32(re);
        foreach (GridViewRow r in gridViewState.Rows)
        {            
            string maSp = r.Cells[0].Text;
            string loaiSp = r.Cells[2].Text;
            string sl = r.Cells[3].Text;
            string price = r.Cells[4].Text;
            ImportBillDt idt = new ImportBillDt(0, cMaHD, maSp, loaiSp, sl, price);
            idt.Insert();

            dtAddBillDt.Rows.Clear();
            ViewState["dtAddBillDt"] = dtAddBillDt;

            FillDataDt();
        }
    }
    protected void gridViewState_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtAddBillDt.Rows[e.RowIndex].Delete();
        ViewState["dtAddBillDt"] = dtAddBillDt;
        FillDataViewstate();
    }
    private string isPhoneEdit = "false";    
    protected void btnChonDtTemp_Click(object sender, EventArgs e)
    {
        isPhoneEdit = "true";
    }
    protected void btnChonPkTemp_Click(object sender, EventArgs e)
    {
        isPhoneEdit = "false";
    }
    protected void rDtTemp_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void rPkTemp_CheckedChanged(object sender, EventArgs e)
    {

    }
}
