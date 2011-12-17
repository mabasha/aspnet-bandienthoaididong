﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Text;
using System.Net;

public partial class Gui_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DeleteImages();
        }
    }
    protected void btn_Register_Click(object sender, EventArgs e)
    {
        Account user = new Account(txt_Username.Text, txt_Password.Text, txt_Fullname.Text, txt_Email.Text,
                                    Convert.ToDateTime(txt_BirthDay.Text), txt_Tel.Text, txt_Address.Text, Convert.ToInt32(txt_IDCard.Text));
        string captcha = txt_Captcha.Text;
        if (String.Compare(Session["captcha"].ToString(), captcha) != 0)
        {
            lb_Note.Text = "Captcha mà bạn vừa nhập không đúng. Vui lòng nhập lại Captcha khác.";
            DeleteImages();
        } 
        else
        {
            int temp = user.Insert();
            if (temp == 0)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = String.Format("Lỗi : username {0} đã có người sử dụng, vui lòng chọn username khác.", txt_Username.Text);
                DeleteImages();
            }
            else if (temp == 1)
            {
                lb_Note.ForeColor = System.Drawing.Color.Red;
                lb_Note.Text = String.Format("Lỗi : Email {0} đã có người sử dụng, vui lòng nhập email khác.", txt_Email.Text);
                DeleteImages();
            }
            else
            {
                Response.Redirect("../Gui/Redirect.aspx?todo=register");
            }
        }
        
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DeleteImages();
    }


    /*
     * Tạo capcha 
     */
    private void DeleteImages()
    {
        DirectoryInfo dr = new DirectoryInfo(Server.MapPath("~/Images/Apps/Captcha/"));
        foreach (FileInfo f in dr.GetFiles())
        {
            f.Delete();
        }
        captchaImage.ImageUrl = CreateCaptcha();
    }
    //Trả về đường dẫn của tập tin hình.
    public string CreateCaptcha()
    {
        const byte LENGTH = 5;
        // chiều dài chuỗi để lấy các kí tự sẽ sử dụng cho captcha
        const string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        using (Bitmap bmp = new Bitmap(120, 35))
        {
            using (Graphics g = Graphics.FromImage(bmp))
            {
                // Tạo nền cho ảnh dạng sóng
                HatchBrush brush = new HatchBrush(HatchStyle.Percent80, Color.White, Color.Tan);
                g.FillRegion(brush, g.Clip);
                // Lưu chuỗi captcha trong quá trình tạo
                StringBuilder strCaptcha = new StringBuilder();
                Random rand = new Random();
                float locationX = 3;
                for (int i = 0; i < LENGTH; i++)
                {
                    // Lấy kí tự ngẫu nhiên từ mảng chars
                    SolidBrush brushes = new SolidBrush(GetRandomColor());
                    string str = chars[rand.Next(chars.Length)].ToString();
                    strCaptcha.Append(str);
                    // Tạo font với tên font ngẫu nhiên chọn từ mảng fonts
                    Font font = new Font("Times New Roman", new Random().Next(14, 17), FontStyle.Bold);
                    // Lấy kích thước của kí tự
                    SizeF size = g.MeasureString(str, font);
                    // Vẽ kí tự đó ra ảnh tại vị trí tăng dần theo i, vị trí top ngẫu nhiên
                    g.DrawString(str, font, brushes, locationX, rand.Next(2, 10));
                    font.Dispose();
                    //định location X
                    locationX += size.Width + i;
                }
                // Lưu captcha vào session
                Session["captcha"] = strCaptcha.ToString();
                // Ghi ảnh trực tiếp ra luồng xuất theo định dạng gif
                //Response.ContentType = "image/GIF";4
                int numRandom = new Random().Next(1, 3000);
                string imgFile = "captcha" + numRandom + ".jpg";
                string directoryCaptcha = "~/Images/Apps/Captcha/";
                // Kiểm tra thư mục đã tồn tại
                if (!Directory.Exists(Server.MapPath(directoryCaptcha)))
                {
                    Directory.CreateDirectory(Server.MapPath(directoryCaptcha));
                }
                //lấy thông tin thư mục
                DirectoryInfo direcInfo = new DirectoryInfo(Server.MapPath(directoryCaptcha));
                foreach (FileInfo file in direcInfo.GetFiles(".jpg"))
                {
                    try
                    {
                        //Xóa tất cả các tập tin hình trong thư mục hiện tại
                        file.Delete();
                    }
                    catch { }
                }
                bmp.Save(Server.MapPath(directoryCaptcha + imgFile));
                return directoryCaptcha + imgFile;
            }
        }
    }
    int rrandom = 0;
    int grandom = 0;
    int brandom = 0;
    public Color GetRandomColor()
    {
        Random rnd = new Random();
        int ri = rnd.Next(255);
        if (ri == rrandom)
        {
            ri = rnd.Next(255);
        }
        else
        {
            rrandom = ri;
        }
        int gi = rnd.Next(255);
        if (gi == grandom)
        {
            gi = rnd.Next(255);
        }
        else
        {
            grandom = gi;
        }
        int bi = rnd.Next(255);
        if (bi == brandom)
        {
            bi = rnd.Next(255);
        }
        else
        {
            brandom = bi;
        }
        byte r = Convert.ToByte(ri);
        byte g = Convert.ToByte(gi);
        byte b = Convert.ToByte(bi);
        return Color.FromArgb(r, g, b);
    }
    
}