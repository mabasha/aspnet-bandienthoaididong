using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ImportBill : System.Web.UI.Page
{
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
    protected void btnAddCTHD_Click(object sender, EventArgs e)
    {      
        object re = AccessData.ExecuteScalar("select max(ID) from ImportBill");
        int cMaHD = Convert.ToInt32(re);              
        ImportBillDt idt = new ImportBillDt(0, cMaHD, txtTenSp.Text, getrLoaisp(), txtNumber.Text, txtPrice.Text);
        idt.Insert();
        lbThongbaoCTHD.Text = "<p class=info>* Thêm thành công Chi tiết hóa đơn.</p>";
        txtTenSp.Text = "";
        txtNumber.Text = "";
        txtPrice.Text = "";
        FillDataDt();
    }
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
    protected void btnAddHD_Click(object sender, EventArgs e)
    {
        ImportBill imp = new ImportBill(0, dNguoiNhap.SelectedValue.ToString(), getCurrentTime());
        imp.Insert();
        lbThongbaoHD.Text = "<p class=info>* Thêm thành công Hóa đơn.</p>";              
        FillData();
    }   
    private string getCurrentTime()
    {
        return DateTime.Now.ToShortDateString();       
    }    
}
