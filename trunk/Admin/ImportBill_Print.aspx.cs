using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ImportBill_Print : System.Web.UI.Page
{
    static int id;    
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Request.QueryString["id"]);
        lbImporter.Text = ImportBill.GetImporterFullname(id);
        lbCreatedDate.Text = ImportBill.GetCreatedDate(id);
        lSum.Text = String.Format("{0:0,##0} VND",ImportBill.GetSumPrice(id));
        DateTime date = ImportBill.GetCreatedDateEx(id);
        lDayFooter.Text = String.Format("ngày {0:dd}, tháng {0:MM}, năm {0:yyyy}", date);
        if (!IsPostBack)
        {
            FillData();
        }
    }
    private void FillData()
    {
        gridPhone.DataSource = ImportBillDt.GetAllByID(id, true);
        gridAccessory.DataSource = ImportBillDt.GetAllByID(id, false);
        gridPhone.DataBind();
        gridAccessory.DataBind();
        
        if (gridPhone.Rows.Count == 0) lPhone.Visible = false;
        
        if (gridAccessory.Rows.Count == 0) lAcc.Visible = false;
    }
}