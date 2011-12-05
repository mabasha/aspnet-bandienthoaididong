using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Admin_PhoneManager : System.Web.UI.Page
{
    int id;
    Phone phone = new Phone();
    //public string oldName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataInGrid("Name");
            id = Convert.ToInt32(grid_Phone.DataKeys[0].Value);
            FillDataInDetailsView(id);
        }
    }

    
    //DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
    protected void FillDataInDetailsView(int id)
    {
        DataTable dt = AccessData.GetTable("SELECT Phone.*, Distributor.Name as DistributorName, Producer.Name as ProducerName FROM Phone, Distributor, Producer WHERE Phone.ID=" + id + " and Phone.DistributorID=Distributor.ID and Phone.ProducerID=Producer.ID");
        dtview_Phone.DataSource = dt;
        dtview_Phone.DataBind();
    }

    protected void FillDataInGrid(object sort)
    {
        DataTable dt = AccessData.GetTable("SELECT ID,Name FROM Phone");
        dt.DefaultView.Sort = sort.ToString();
        grid_Phone.DataSource = dt;
        grid_Phone.DataBind();
    }
    protected void grid_Phone_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_Phone.PageIndex = e.NewPageIndex;
        FillDataInGrid("Name");
    }
    protected void grid_Phone_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ChoosePhone")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            id = Convert.ToInt32(grid_Phone.DataKeys[index].Value);
            if (dtview_Phone.CurrentMode != DetailsViewMode.ReadOnly)
            {
                dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
            }
            FillDataInDetailsView(id);
        }
    }
    protected void dtview_Phone_DataBound(object sender, EventArgs e)
    {
        if (dtview_Phone.Rows.Count>0 && dtview_Phone.CurrentMode == DetailsViewMode.ReadOnly)
        {
            ImageButton delete = (ImageButton)dtview_Phone.Rows[0].Cells[0].FindControl("imgBtn_Delete");
           delete.OnClientClick = "if(!confirm('Bạn có đồng ý xóa điện thoại này không?')) return false;";
        }

        //ẩn ID khi sửa hoặc thêm mới một điện thoại.
        if (dtview_Phone.CurrentMode == DetailsViewMode.Edit || dtview_Phone.CurrentMode == DetailsViewMode.Insert)
        {
            TextBox txtID = (TextBox)dtview_Phone.Rows[1].Cells[1].Controls[0];
            txtID.Enabled = false;
            //txtID.Attributes("style") = "visibility:hidden";
            // Lấy ảnh từ database.
            Button bChooseImageTemplate = (Button)dtview_Phone.Rows[6].Cells[1].FindControl("btn_InsertImage");
            TextBox tImageNameTemplate = (TextBox)dtview_Phone.Rows[6].Cells[1].FindControl("txt_Image");
            bChooseImageTemplate.OnClientClick = String.Format("window.open(\"ImageManager.aspx?receiveInputID={0}\", 'mypopup', " +
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); return false;", tImageNameTemplate.ClientID);
        
        }
    }
    protected void dtview_Phone_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        string query = String.Format("DELETE FROM Phone WHERE ID='{0}'", Convert.ToInt32(dtview_Phone.DataKey.Value));
        AccessData.ExecuteNonQuery(query);
        FillDataInGrid("Name");
        id = Convert.ToInt32(grid_Phone.DataKeys[0].Value);
        FillDataInDetailsView(id);
    }
    protected void grid_Phone_Sorting(object sender, GridViewSortEventArgs e)
    {
        FillDataInGrid(e.SortExpression);
    }
    protected void dtview_Phone_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit": 
                dtview_Phone.ChangeMode(DetailsViewMode.Edit);
                FillDataInDetailsView(Convert.ToInt32(dtview_Phone.DataKey.Value));
                ConvertHtmlToTextBox(dtview_Phone);
                //oldName = ((TextBox)dtview_Phone.Rows[2].Cells[1].FindControl("txt_Name")).Text;
                break;
            case "Cancel":
                dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
                FillDataInDetailsView(Convert.ToInt32(grid_Phone.DataKeys[0].Value));
                break;
            case "New":
                dtview_Phone.ChangeMode(DetailsViewMode.Insert);
                break;
        }
    }
    protected void dtview_Phone_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //ConvertTextBoxToHtml
        //int id=
        //string specialFuture = ((TextBox)dtview_Phone.Rows[8].Cells[1].FindControl("txt_SpecialFeature")).Text.Replace("\n", "</br>");
        //string officeApps = ((TextBox)dtview_Phone.Rows[23].Cells[1].FindControl("txt_OfficeApps")).Text.Replace("\n", "</br>");
        //string otherApp = ((TextBox)dtview_Phone.Rows[24].Cells[1].FindControl("txt_OtherApp")).Text.Replace("\n", "</br>");
        //string query = String.Format("UPDATE Phone SET SpecialFeature=N'{0}' WHERE ID='{1}'", specialFuture, dtview_Phone.DataKey.Value);
        //AccessData.ExecuteNonQuery(query);
        GetDataFromDetailViewToPhone();
        if (phone.Update())
        {
            //Label lb_Note = (Label)dtview_Phone.Rows[0].Cells[0].FindControl("lb_Note");
            
            dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
            FillDataInDetailsView(Convert.ToInt32(dtview_Phone.DataKey.Value));
            FillDataInGrid("Name");
            lb_Note.ForeColor = Color.Green;
            lb_Note.Text = "Cập nhật thành công";
            //Note_Seccessfull(dtview_Phone);
            
        }
        else
        {
            //Label lb_Note = (Label)dtview_Phone.Rows[0].Cells[0].FindControl("lb_Note");
            lb_Note.ForeColor = Color.Red;
            lb_Note.Text = "Cập nhật lỗi. Tên điện thoại đã có trong dữ liệu, vui lòng nhập tên khác.";
            //lb_Note.Text += " Old Name : " + phone.oldName + " name : " + phone.name;
        }
        
    }
    protected void dtview_Phone_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }

    private void ConvertHtmlToTextBox(DetailsView dtview_Phone)
    {
        TextBox specialFuture = (TextBox)dtview_Phone.Rows[8].Cells[0].FindControl("txt_SpecialFeature");
        specialFuture.Text = specialFuture.Text.Replace("</br>", "\n");
        TextBox officeApps = (TextBox)dtview_Phone.Rows[23].Cells[0].FindControl("txt_OfficeApps");
        officeApps.Text = officeApps.Text.Replace("</br>", "\n");
        TextBox otherApp = (TextBox)dtview_Phone.Rows[24].Cells[0].FindControl("txt_OtherApp");
        otherApp.Text = otherApp.Text.Replace("</br>", "\n");
        //oldName = ((TextBox)dtview_Phone.Rows[2].Cells[1].FindControl("txt_Name")).Text;
    }

    private void ConvertTextBoxToHtml(DetailsView dtview_Phone)
    {
        
    }

    protected void dtview_Phone_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        GetDataFromDetailViewToPhone();
        if (phone.Insert())
        {
            dtview_Phone.ChangeMode(DetailsViewMode.ReadOnly);
            FillDataInGrid("Name");
            FillDataInDetailsView(AccessData.GetMaxID("Phone"));
            //Label lb_Note = (Label)dtview_Phone.Rows[0].Cells[0].FindControl("lb_Note");
            lb_Note.ForeColor = Color.Green;
            lb_Note.Text = "Cập nhật thành công";
        } 
        else
        {
            //Label lb_Note = (Label)dtview_Phone.Rows[0].Cells[0].FindControl("lb_Note");
            lb_Note.ForeColor = Color.Red;
            lb_Note.Text = "Cập nhật lỗi. Tên điện thoại đã có trong dữ liệu, vui lòng nhập tên khác.";
        }
        
        
    }

    private void GetDataFromDetailViewToPhone()
    {
        if (dtview_Phone.CurrentMode==DetailsViewMode.Edit)
        {
            phone.id = Convert.ToInt32(((TextBox)dtview_Phone.Rows[1].Cells[1].Controls[0]).Text);
            //phone.oldName = oldName;
        }
        //phone.id = Convert.ToInt32(((TextBox)dtview_Phone.Rows[1].Cells[1].Controls[0]).Text);
        phone.name = ((TextBox)dtview_Phone.Rows[2].Cells[1].FindControl("txt_Name")).Text;
        phone.producerID = Convert.ToInt32(((DropDownList)dtview_Phone.Rows[3].Cells[1].FindControl("ddl_Producer")).SelectedValue);
        phone.distributorID = Convert.ToInt32(((DropDownList)dtview_Phone.Rows[4].Cells[1].FindControl("ddl_Distributor")).SelectedValue);
        phone.residualAmount = Convert.ToInt32(((TextBox)dtview_Phone.Rows[5].Cells[1].Controls[0]).Text);
        phone.image = ((TextBox)dtview_Phone.Rows[6].Cells[1].FindControl("txt_Image")).Text;
        phone.price = Convert.ToInt32(((TextBox)dtview_Phone.Rows[7].Cells[1].FindControl("txt_Price")).Text);
        phone.specialFeature = ((TextBox)dtview_Phone.Rows[8].Cells[1].FindControl("txt_SpecialFeature")).Text.Replace("\n", "</br>");
        phone.camera = ((TextBox)dtview_Phone.Rows[9].Cells[1].Controls[0]).Text;
        phone.videoCall = ((TextBox)dtview_Phone.Rows[10].Cells[1].Controls[0]).Text;
        phone.recorderCamera = ((TextBox)dtview_Phone.Rows[11].Cells[1].Controls[0]).Text;
        phone.subCamera = ((TextBox)dtview_Phone.Rows[12].Cells[1].Controls[0]).Text;
        phone.videoPlayer = ((TextBox)dtview_Phone.Rows[13].Cells[1].Controls[0]).Text;
        phone.musicPlayer = ((TextBox)dtview_Phone.Rows[14].Cells[1].Controls[0]).Text;
        phone.FM = ((TextBox)dtview_Phone.Rows[15].Cells[1].Controls[0]).Text;
        phone.TV = ((TextBox)dtview_Phone.Rows[16].Cells[1].Controls[0]).Text;
        phone.recorder = ((TextBox)dtview_Phone.Rows[17].Cells[1].Controls[0]).Text;
        phone.callingRecorder = ((TextBox)dtview_Phone.Rows[18].Cells[1].Controls[0]).Text;
        phone.FMRecorder = ((TextBox)dtview_Phone.Rows[19].Cells[1].Controls[0]).Text;
        phone.java = ((TextBox)dtview_Phone.Rows[20].Cells[1].Controls[0]).Text;
        phone.game = ((TextBox)dtview_Phone.Rows[21].Cells[1].Controls[0]).Text;
        phone.TVConnection = ((TextBox)dtview_Phone.Rows[22].Cells[1].Controls[0]).Text;
        phone.officeApps = ((TextBox)dtview_Phone.Rows[23].Cells[1].FindControl("txt_OfficeApps")).Text.Replace("\n", "</br>");
        phone.otherApp = ((TextBox)dtview_Phone.Rows[24].Cells[1].FindControl("txt_OtherApp")).Text.Replace("\n", "</br>");
        phone.ringtone = ((TextBox)dtview_Phone.Rows[25].Cells[1].FindControl("txt_Ringtone")).Text;
        phone.downloadRingtone = ((TextBox)dtview_Phone.Rows[26].Cells[1].Controls[0]).Text;
        phone.speakerPhone = ((TextBox)dtview_Phone.Rows[27].Cells[1].FindControl("txt_SpeakerPhone")).Text;
        phone.vibrate = ((TextBox)dtview_Phone.Rows[28].Cells[1].FindControl("txt_Vibrate")).Text;
        phone.jackPhone = ((TextBox)dtview_Phone.Rows[29].Cells[1].FindControl("txt_JackPhone")).Text;
        phone.internalStore = ((TextBox)dtview_Phone.Rows[30].Cells[1].FindControl("txt_InternalStore")).Text;
        phone.ram = ((TextBox)dtview_Phone.Rows[31].Cells[1].Controls[0]).Text;
        phone.CPU = ((TextBox)dtview_Phone.Rows[32].Cells[1].Controls[0]).Text;
        phone.memoryCard = ((TextBox)dtview_Phone.Rows[33].Cells[1].FindControl("txt_MemoryCard")).Text;
        phone.maximumMemoryCapacity = ((TextBox)dtview_Phone.Rows[34].Cells[1].Controls[0]).Text;
        phone.contact = ((TextBox)dtview_Phone.Rows[35].Cells[1].FindControl("txt_Contact")).Text;
        phone.message = ((TextBox)dtview_Phone.Rows[36].Cells[1].FindControl("txt_Message")).Text;
        phone.email = ((TextBox)dtview_Phone.Rows[37].Cells[1].FindControl("txt_Email")).Text;
        phone.secondGband = ((TextBox)dtview_Phone.Rows[38].Cells[1].Controls[0]).Text;
        phone.threeGband = ((TextBox)dtview_Phone.Rows[39].Cells[1].Controls[0]).Text;
        phone.mutilSimcard = ((TextBox)dtview_Phone.Rows[40].Cells[1].Controls[0]).Text;
        phone.GPRS = ((TextBox)dtview_Phone.Rows[41].Cells[1].Controls[0]).Text;
        phone.EDGE = ((TextBox)dtview_Phone.Rows[42].Cells[1].Controls[0]).Text;
        phone.threeG = ((TextBox)dtview_Phone.Rows[43].Cells[1].Controls[0]).Text;
        phone.wifi = ((TextBox)dtview_Phone.Rows[44].Cells[1].Controls[0]).Text;
        phone.browser = ((TextBox)dtview_Phone.Rows[45].Cells[1].Controls[0]).Text;
        phone.GPS = ((TextBox)dtview_Phone.Rows[46].Cells[1].Controls[0]).Text;
        phone.bluetooth = ((TextBox)dtview_Phone.Rows[47].Cells[1].Controls[0]).Text;
        phone.ultrared = ((TextBox)dtview_Phone.Rows[48].Cells[1].Controls[0]).Text;
        phone.USB = ((TextBox)dtview_Phone.Rows[49].Cells[1].Controls[0]).Text;
        phone.screen = ((TextBox)dtview_Phone.Rows[50].Cells[1].FindControl("txt_Screen")).Text;
        phone.resolution = ((TextBox)dtview_Phone.Rows[51].Cells[1].FindControl("txt_Resolution")).Text;
        phone.sizeScreen = ((TextBox)dtview_Phone.Rows[52].Cells[1].FindControl("txt_SizeScreen")).Text;
        phone.sensor = ((TextBox)dtview_Phone.Rows[53].Cells[1].Controls[0]).Text;
        phone.OS = ((TextBox)dtview_Phone.Rows[54].Cells[1].Controls[0]).Text;
        phone.style = ((TextBox)dtview_Phone.Rows[55].Cells[1].Controls[0]).Text;
        phone.qwertyKeyboard = ((TextBox)dtview_Phone.Rows[56].Cells[1].Controls[0]).Text;
        phone.size = ((TextBox)dtview_Phone.Rows[57].Cells[1].FindControl("txt_Size")).Text;
        phone.weight = ((TextBox)dtview_Phone.Rows[58].Cells[1].FindControl("txt_Weight")).Text;
        phone.warranty = ((TextBox)dtview_Phone.Rows[59].Cells[1].FindControl("txt_Warranty")).Text;
        phone.language = ((TextBox)dtview_Phone.Rows[60].Cells[1].FindControl("txt_Language")).Text;
        phone.battery = ((TextBox)dtview_Phone.Rows[61].Cells[1].FindControl("txt_Battery")).Text;
        phone.capabilityBattery = ((TextBox)dtview_Phone.Rows[62].Cells[1].FindControl("txt_CapabilityBattery")).Text;
        phone.callingTime = ((TextBox)dtview_Phone.Rows[63].Cells[1].FindControl("txt_CallingTime")).Text;
        phone.waittingTime = ((TextBox)dtview_Phone.Rows[64].Cells[1].FindControl("txt_WaittingTime")).Text;
        phone.standarBox = ((TextBox)dtview_Phone.Rows[65].Cells[1].FindControl("txt_StandarBox")).Text;


    }

}