using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_WarrantyReceipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (rDienthoai.Checked == true)
        {
            btnChonSp.OnClientClick = "window.open(\"PhoneChooser.aspx?receiveID=txtMasp\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
            txtIMEI.Enabled = true;
        }
        else if (rPhukien.Checked == true)
        {
            btnChonSp.OnClientClick = "window.open(\"AccessoryChooser.aspx?receiveID=txtMasp\", 'mypopup', " +
                    "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
            txtIMEI.Enabled = false;
        }        
    }
    protected void btnLapphieu_Click(object sender, EventArgs e)
    {
        int masp = Convert.ToInt32(txtMasp.Text);        
        
        lbLapphieuBh.Text = "PHIẾU BẢO HÀNH";
        lbLoaiSp.Text = "Loại sản phẩm : ";        
        if (rDienthoai.Checked == true)
        {
            Phone phone = new Phone();
            lbTenSp.Text = "Tên sản phẩm : " + phone.GetNameFromID(masp);
            lbLoaiSp.Text = lbLoaiSp.Text + "Điện thoại";
        }
        else
        {
            Accessory acc = new Accessory(Convert.ToInt32(txtMasp.Text));
            lbTenSp.Text = "Tên sản phẩm : " + acc.GetNameFromID(masp);
            lbLoaiSp.Text = lbLoaiSp.Text + "Phụ kiện";
        }
        lbIMEI.Text = "IMEI : " + txtIMEI.Text;
        lbNgay.Text = "Ngày lập phiếu : " + DateTime.Now.ToShortDateString();

        int thang = Convert.ToInt32(txtHanBH.Text);
        DateTime hanBh = DateTime.Now.AddMonths(thang);
        lbHanBH.Text = "Hạn bảo hành : " + txtHanBH.Text + " tháng" + " (đến hết ngày " + hanBh.Day.ToString() + "/" + hanBh.Month.ToString() + "/" + hanBh.Year.ToString() + ")";
        lbTenKH.Text = "Tên khách hàng : " + txtTenKH.Text;
        lbSoDt.Text = "Số điện thoại : " + txtSoDt.Text;
        lbLydo.Text = "Lý do : " + txtReason.Text;
        lbMota.Text = "Mô tả : " + txtMota.Text;
        btnAdd.Visible = true;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        bool isphone = true;
        string imei = "";
        if (rDienthoai.Checked == true)
        {
            imei = txtIMEI.Text;
            isphone = true;
        }
        else
        {
            isphone = false;           
        }
        int proID = Convert.ToInt32(txtMasp.Text);
        string cdate = DateTime.Now.ToShortDateString();
        string outofdate = DateTime.Now.AddMonths(Convert.ToInt32(txtHanBH.Text)).ToShortDateString();
        string reason = txtReason.Text;
        string cusName = txtTenKH.Text;
        string tel = txtSoDt.Text;
        string des = txtMota.Text;
        bool isRe = false;
        string rDate = "";
        WarrantyReceipt war = new WarrantyReceipt(0, isphone, proID, imei, cdate, reason, cusName, tel, isRe, rDate, des, outofdate);        
        war.Insert();
        txtMasp.Text = "";
        txtIMEI.Text = "";
        txtTenKH.Text = "";
        txtSoDt.Text = "";
        txtReason.Text = "";
        txtMota.Text = "";
        btnAdd.Visible = false;
        lbLapphieuBh.Text = "";
        lbLoaiSp.Text = "";
        lbTenSp.Text = "";
        lbIMEI.Text = "";
        lbNgay.Text = "";
        lbTenKH.Text = "";
        lbSoDt.Text = "";
        lbLydo.Text = "";
        lbMota.Text = "";
        lbHanBH.Text = "";
        lbThongbao.Text = "<p class=info>* Lập phiếu bảo hành thành công!!.</p>";
    }
}
