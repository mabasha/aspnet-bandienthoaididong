using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;


public partial class Test_sendmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, System.EventArgs e)
    {
        bool temp = SendMail("sieuthidienthoai.cnw@gmail.com", "123456cnw", "Trần Minh Toàn", "minhtoan3101@gmail.com", "test mail", "Test mail body");
        if (temp)
        {
            TextBox1.Text = "Da gui";
        } 
        else
        {
            TextBox1.Text = "Chua gui";
        }
    }

    //--Phương thức gửi mail chứng thực dùng STMP Google-----------------------------|  
    public bool SendMail(string from_address, string from_password,
                        string from_displayName, string to_address,
                        string subject, string body)
    {
        //--Tạo mail -----------------------------------------------------|
        MailMessage msg = new MailMessage();
        msg.To.Add(to_address);
        msg.From = new MailAddress(from_address, from_displayName,
            System.Text.Encoding.UTF8);
        msg.Subject = subject;
        msg.SubjectEncoding = System.Text.Encoding.UTF8;
        msg.Body = body;
        msg.BodyEncoding = System.Text.Encoding.UTF8;
        //--Cho phép gửi mã HTML trong mail ------------------------------|
        msg.IsBodyHtml = true;
        //--Độ ưu tiên của mail ------------------------------------------|
        msg.Priority = MailPriority.High;
        //--Chứng thực bao gồm username + password -----------------------|
        SmtpClient client = new SmtpClient();
        client.Credentials = new System.Net.NetworkCredential (from_address, from_password);
        //--Cổng 587 của server SMTP Google để gửi mail-------------------|
        client.Port = 587;
        //--Địa chỉ server SMTP của google -------------------------------|
        client.Host = "smtp.gmail.com";
        //--Sử dụng mã hóa đường truyền SSL (Secure Sockets Layer)--------|
        client.EnableSsl = true;
        //--Bắt đầu quá trình gửi mail -----------------------------------|
        try {
            client.Send(msg); //--Gửi mail--|
        }catch
        {
            return false; 
        } //--Không thể gửi mail     
        return true; //--Gửi mail thành công
    }
    
}