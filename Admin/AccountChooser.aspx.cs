using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

/* *Hướng dẫn sử dụng
 * 
 * Bên phía trang cần chọn, link jquery vào.
 * Thêm đoạn code sau dưới sự kiện Page_Load
 * bChooseCustomer.OnClientClick = "window.open(\"AccountChooser.aspx?receiveID=tCustomerName\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;";
 * Với bChooseCustomer là nút khi nhấn thì sẽ bật trang này lên
 * tCustomerName là ID của textbox sẽ hiện thông tin trả về.
 * 
 * Tham khảo file SaleBillManager.aspx và .cs
 * 
 * */

public partial class Admin_AccountChooser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData();
        }
        string receiveID = Request.QueryString["receiveID"];
        string javascript = String.Format("window.opener.$('#{0}').val($('#hChoosed').val()); self.close();", receiveID);
        bClose.OnClientClick = javascript;
    }

    void FillData(string sortExp)
    {
        DataTable dtUser;
        if (dDecentralize.SelectedIndex == 0)
        {
            dtUser = Account.GetAllWithKeyword(tKeyword.Text);
        }
        else
        {
            dtUser = Account.GetUsersWithKeyword(tKeyword.Text, dDecentralize.SelectedValue.ToString());
        }
        if (sortExp != "")
        {
            dtUser.DefaultView.Sort = sortExp;
        }
        gShow.DataSource = dtUser;
        gShow.DataBind();
    }

    void FillData()
    {
        FillData("");
    }

    protected void bRefresh_Click(object sender, EventArgs e)
    {
        FillData();
    }
    protected void gShow_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillData(e.SortExpression);
    }
    protected void gShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gShow.PageIndex = e.NewPageIndex;
        FillData();
    }
    protected void gShow_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        
    }
    protected void gShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        hChoosed.Value = gShow.SelectedRow.Cells[0].Text;
        
    }
}
