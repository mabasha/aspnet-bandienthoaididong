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
    public static string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load username
        HttpCookie cookie = Request.Cookies["login"];
        if (Session["username"] != null)
        {
            username = Session["username"].ToString();
        }
        else if (cookie != null)
        {
            username = cookie["username"].ToString();
        }
        lbUsername.Text = username;
        //end Load username
        if (rDienthoai.Checked == true)
        {
            btnTenSp.OnClientClick = String.Format("window.open(\"PhoneChooser.aspx?receiveID={0}\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", txtTenSp.ClientID);
        }
        else if (rPhukien.Checked == true)
        {
            btnTenSp.OnClientClick = String.Format("window.open(\"AccessoryChooser.aspx?receiveID={0}\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", txtTenSp.ClientID);
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
    private void FillData(string sort)
    {
        DataTable dt = ImportBill.GetAll();
        if (sort!= "")
        {
            dt.DefaultView.Sort = sort;
        }
        gridImportBill.DataSource = dt;
        gridImportBill.DataBind();
    }
    private void FillData()
    {
        FillData("");
    }
    private void FillDataDt(string sort)
    {
        if (gridImportBill.Rows.Count > 0)
        {
            if (gridImportBill.SelectedIndex == -1)
            {
                gridImportBill.SelectedIndex = 0;
            }

            if (gridImportBill.SelectedRow.Cells[0].Text != "")
            {
                DataTable dt = ImportBillDt.GetAll(gridImportBill.SelectedRow.Cells[0].Text);
                if (sort != "")
                {
                    dt.DefaultView.Sort = sort;
                }
                gridImportBillDt.DataSource = dt;
                gridImportBillDt.DataBind();
            }
        }
    }
    private void FillDataDt()
    {
        FillDataDt("");
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
    protected void gridImportBillDt_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gridImportBillDt.Rows[e.RowIndex].Cells[1].Text);

        ImportBillDt impdt = new ImportBillDt(id);
        impdt.Delete();
        lbThongbaoCTHD.Text = "<p class=valid_box>Bạn đã xóa thành công Chi tiết hóa đơn.</p>";
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
    protected void gridImportBill_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {        
        foreach (GridViewRow r in gridImportBillDt.Rows)
        {
            if (r.Cells[0].Text == gridImportBill.Rows[e.RowIndex].Cells[0].Text)
            {                
                ImportBillDt impdt = new ImportBillDt(Convert.ToInt32(r.Cells[1].Text));
                impdt.Delete();
                FillDataDt();               
            }
        }
        ImportBill imp = new ImportBill(Convert.ToInt32(gridImportBill.Rows[e.RowIndex].Cells[0].Text));
        imp.Delete();      
        lbThongbaoHD.Text = "<p class=valid_box> Bạn đã xóa thành công hóa đơn.</p>";
        FillData();
        //FillDataDt();
    }

    protected void gridViewState_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtAddBillDt.Rows[e.RowIndex].Delete();
        ViewState["dtAddBillDt"] = dtAddBillDt;
        FillDataViewstate();
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
        btnCapnhat.Visible = false;
        btnHuy.Visible = false;
    }
    protected void btnThemHD_Click(object sender, EventArgs e)
    {
        if (gridViewState.Rows.Count > 0)
        {
            ImportBill imp = new ImportBill(0, username, getCurrentTime());
            imp.Insert();
            lbThongbaoHD.Text = "<p class=valid_box>* Thêm thành công Hóa đơn.</p>";
            FillData();

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
            }
        }
        FillDataDt();
        FillDataViewstate();
        btnThemHD.Visible = false;
        btnCapnhat.Visible = false;
        btnHuy.Visible = false;
    }
     
    static string isPhoneEdit = "False"; 
    private string getrLoaisp()
    {
        if (rDienthoai.Checked == true)
            return "True";
        return "False";
    }
    private string getCurrentTime()
    {
        return DateTime.Now.ToShortDateString();
    }
    static int id;
    protected void gridImportBillDt_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnCapnhat.Visible = true;
        btnHuy.Visible = true;

        id = Convert.ToInt32(gridImportBillDt.SelectedRow.Cells[1].Text);
        Label productID=(Label) gridImportBillDt.SelectedRow.FindControl("lbProductID");
        Label isphone=(Label) gridImportBillDt.SelectedRow.FindControl("lbIsPhone");
        string number = gridImportBillDt.SelectedRow.Cells[4].Text;
        string price = gridImportBillDt.SelectedRow.Cells[5].Text;
        if (isphone.Text == "Điện thoại")
        {
            rDienthoai.Checked = true;
            rPhukien.Checked = false;
        }
        else
        {
            rPhukien.Checked = true;
            rDienthoai.Checked = false;
        }
        txtTenSp.Text = productID.Text;
        txtNumber.Text = number;
        txtPrice.Text = price;
    }
    protected void btnCapnhat_Click(object sender, EventArgs e)
    {
        ImportBillDt imp = new ImportBillDt(id, txtTenSp.Text, getrLoaisp(), txtNumber.Text, txtPrice.Text);
        imp.Update();
        FillDataDt();
        btnCapnhat.Visible = false;
        btnHuy.Visible = false;
    }
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        rDienthoai.Checked = true;
        rPhukien.Checked = false;
        txtTenSp.Text = "";
        txtNumber.Text = "";
        txtPrice.Text = "";
        btnCapnhat.Visible = false;
        btnHuy.Visible = false;
    }
    protected void gridImportBill_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridImportBill.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gridImportBillDt_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridImportBillDt.PageIndex = e.NewPageIndex;
        FillDataDt();
    }
    protected void gridImportBill_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gridImportBillDt_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataDt(e.SortExpression);
    }
    protected void gridImportBill_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillData();
        FillDataDt();
    }
    protected void gridImportBill_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "PrintBill")
        {
            id = Convert.ToInt32(gridImportBill.SelectedRow.Cells[0].Text);
            Response.Redirect("~/Admin/ImportBill_Print.aspx?id="+id);
        }
    }
}
