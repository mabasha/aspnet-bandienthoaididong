using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_ImageManager : System.Web.UI.Page
{
    /*
     * 
     * Bên phía cần lấy Image Name viết hàm gán JavaScript cho button lấy,
     * truyền tham số là tên textInput cần nhận.
       
     bChooseImage.OnClientClick = "window.open(\"ImageManager.aspx?receiveInputID=tDescription\", 'mypopup', "+
                "'width=600, height=400, toolbar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no, menubar=no, location=no'); ";
     * 
     */

    List<string> fileSelected = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lThongBao.Text = "";
            ViewState["folder"] = "Phone/";
            LoadImage();
        }
        else
        {
            LoadImage();
        }
        string receiveInputID = Request.QueryString["receiveInputID"];
        if (receiveInputID == null)
        {
            receiveInputID = "tImageName";
        }
        string javascript = String.Format("window.opener.$(\"#{0}\").val($(\"#hChoosedImage\").val()); self.close();", receiveInputID);
        bClose.OnClientClick = javascript;
        
    }
    private void LoadImage()
    {
        pImage.Controls.Clear();
        DirectoryInfo dir = Directory.CreateDirectory(Server.MapPath("~/Images/")+ViewState["folder"]);
        FileInfo[] files = dir.GetFiles();
        foreach (FileInfo file in files)
        {
            
            Image img = new Image();
            string imageURL = "~/Images/" + ViewState["folder"] + file.Name;
            img.ImageUrl = imageURL;
            img.Width = 50;
            img.Height = 75;

            CheckBox chk = new CheckBox();
            chk.Text = file.Name;

            pImage.Controls.Add(img);
            pImage.Controls.Add(chk);
        }
    }
    protected void bUpload_Click(object sender, EventArgs e)
    {
        if (CheckFileType(fileUpload.FileName) == true)
        {
            fileUpload.SaveAs(Server.MapPath("~/Images/") + ViewState["folder"] + fileUpload.FileName);
            lThongBao.Text = "<p class = info>Upload thành công<p>";
            LoadImage();
        }
        else
        {
            lThongBao.Text = "<p class = error>Loại tệp không đúng</p>";
        }
    }

    private bool CheckFileType(String fileName)
    {
        string ext = Path.GetExtension(fileName);
        if (ext == ".jpg" || ext == ".png" || ext == ".bmp" || ext == ".jpeg")
        {
            return true;
        }
        return false;
    }

    void GetListImageChecked()
    {
        fileSelected.Clear();
        foreach (Control c in pImage.Controls)
        {
            if (c.ToString() == "System.Web.UI.WebControls.CheckBox")
            {
                CheckBox chk = (CheckBox)c;
                if (chk.Checked == true)
                {
                    fileSelected.Add(chk.Text);
                }
            }
        }
    }

    protected void bSelect_Click(object sender, EventArgs e)
    {
        GetListImageChecked();
        if (fileSelected.Count > 0)
        {
            hChoosedImage.Value = fileSelected[0];
        }
        //LoadImage();
    }
    protected void bDelete_Click(object sender, EventArgs e)
    {
        GetListImageChecked();
        foreach (string fileName in fileSelected)
        {
            FileInfo file = new FileInfo(Server.MapPath("~/Images/") + ViewState["folder"] + fileName);
            file.Delete();
            LoadImage();
        }
        
    }
    protected void bChangeFolder_Click(object sender, EventArgs e)
    {
        if (rPhone.Checked == true)
        {
            ViewState["folder"] = "Phone/";
            LoadImage();
        }
        else if (rAccessory.Checked == true)
        {
            ViewState["folder"] = "Accessory/";
            LoadImage();
        }
    }
    protected void bRename_Click(object sender, EventArgs e)
    {
        GetListImageChecked();
        if (fileSelected.Count != 0)
        {
            ViewState["fileChoose"] = fileSelected[0];
            tNewName.Text = (string)ViewState["fileChoose"];
            tNewName.Visible = true;
            bDone.Visible = true;
        }
    }

    //Nhấn để đổi tên
    protected void bDone_Click(object sender, EventArgs e)
    {
        string fileName = (string)ViewState["fileChoose"];
        FileInfo file = new FileInfo(Server.MapPath("~/Images/") + ViewState["folder"] + fileName);
        string folderName = Path.GetDirectoryName(file.FullName) ;
        file.MoveTo(folderName + "/" + tNewName.Text);
        LoadImage();
        tNewName.Visible = false;
        bDone.Visible = false;
    }
}
