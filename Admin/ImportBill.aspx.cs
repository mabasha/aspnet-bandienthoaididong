﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ImportBill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            ImageButton btnDelete = (ImageButton)e.Row.Cells[4].Controls[0];
            btnDelete.OnClientClick = "if (!confirm('Bạn có đồng ý xóa Hóa đơn nhập?')) return false";
        }      
    }
    protected void gridImportBill_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridImportBill.EditIndex = e.NewEditIndex;
        FillData();
    }
    protected void gridImportBill_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridImportBill.EditIndex = -1;
        FillData();
    }
    protected void btnAddCTHD_Click(object sender, EventArgs e)
    {        
        ImportBillDt idt = new ImportBillDt(0, dMaHD.Text, txtTenSp.Text, getrLoaisp(), txtNumber.Text, txtPrice.Text);
        idt.Insert();
        lbThongbaoCTHD.Text = "<p class=info>* Thêm thành công Chi tiết hóa đơn.</p>";
        txtTenSp.Text = "";
        txtNumber.Text = "";
        txtPrice.Text = "";
        FillDataDt();
    }
    private string getrLoaisp()
    {
        if(rLoaiSp.Text == "Điện thoại")
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
        ImportBill imp = new ImportBill(0, dNguoiNhap.SelectedValue.ToString(),getCreatedDate()) ;
        imp.Insert();
        lbThongbaoHD.Text = "<p class=info>* Thêm thành công Hóa đơn.</p>";
        dNgay.Text = "1";
        dThang.Text = "1";
        txtNam.Text = "";        
        FillData();
    }
    private string getCreatedDate()
    {
        string cd = dThang.Text + "-" + dNgay.Text + "-" + txtNam.Text;
        return cd;
    }   
}