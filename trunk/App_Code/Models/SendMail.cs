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


public class SendMail
{
	public SendMail()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// sHost: IP hoặc địa chỉ Severmail 
    /// nPort: Port của Mail server (Thông thường là 25 là mặc định) 
    /// sUserName: Tài khoản Mail của bạn 
    /// sPassword: mật khẩu mail của bạn 
    /// sFromName: Tên của người gửi 
    /// sFromEmail: Địa chỉ Gửi mail đi (Tương ứng với User và pass ở trên) 
    /// sToEmail: Địa chỉ Mail người nhận 
    /// sSubject: Tiêu đề mail 
    /// sMessage: Cuối cùng là nội dung cần gửi 
    /// </summary>
    public static void SendEMail(string sHost, int nPort, string sUserName, string sPassword, string sFromName, string sFromEmail,
     string sToEmail, string sSubject, string sMessage)
    {
        //if (sToName.Length == 0)
        //    sToName = sToEmail;
        if (sFromName.Length == 0)
            sFromName = sFromEmail;
        System.Web.Mail.MailMessage Mail = new System.Web.Mail.MailMessage();
        Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/smtpserver]http://schemas.microsoft.com/cdo/configuration/smtpserver[/link]"] = sHost;
        Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/sendusing]http://schemas.microsoft.com/cdo/configuration/sendusing[/link]"] = 2;
        Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/smtpserverport]http://schemas.microsoft.com/cdo/configuration/smtpserverport[/link]"] = nPort.ToString();
        if (sUserName.Length == 0)
        {
            //Ingen auth 
        }
        else
        {
            Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/smtpauthenticate]http://schemas.microsoft.com/cdo/configuration/smtpauthenticate[/link]"] = 1;
            Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/sendusername]http://schemas.microsoft.com/cdo/configuration/sendusername[/link]"] = sUserName;
            Mail.Fields["[link=http://schemas.microsoft.com/cdo/configuration/sendpassword]http://schemas.microsoft.com/cdo/configuration/sendpassword[/link]"] = sPassword;
        }
        Mail.To = sToEmail;
        Mail.From = sFromEmail;
        Mail.Subject = sSubject;
        Mail.Body = sMessage;
        Mail.BodyFormat = System.Web.Mail.MailFormat.Html;
        System.Web.Mail.SmtpMail.SmtpServer = sHost;
        System.Web.Mail.SmtpMail.Send(Mail);
    } 


    

    //xác định smtpserver để gửi mail, với gmail là smtp.gmail.com
    public string smtpServer = "";
    

    //Gửi từ mail nào, là một địa chỉ mail từ gmail ex: sunflower2441@gmail.com
    public string smtpMailFrom = "";
    

    //user đăng nhập vào gmail
    public string smtpUser = "";
   
    //mật khẩu đăng nhập gmail
    public string smtpPassword = "";
    

    //port của smtpserver khi dùng gmail là 587 hoặc 465
    public int smtpPort = 587;
    

    /// <summary>
    /// Hàm gửi mail với mail client là gmail
    /// </summary>
    /// <param name="strMailTo">Mail muốn gửi đến</param>
    /// <param name="strMailSubject">Tựa đề mail</param>
    /// <param name="strContent">Nội dung mail</param>
    /// <param name="bolIsHTMLFormat">Định dang mail gửi đi là HTML hay Text</param>
    /// <returns>Trả về thông tin sau khi gửi là thanh công hay thất bại và lỗi khi thất bại.</returns>
    public static int SendEMail2(string smtpServer, string smtpMailFrom, string smtpUser, string smtpPassword, int smtpPort, string strMailTo, string strMailSubject, string strContent, bool bolIsHTMLFormat)
    {
        SmtpClient sClient = new SmtpClient();
        try
        {
            MailMessage objMail = new MailMessage();
            //reg xác lập tính hợp lệ của mail
            Regex reg = new Regex(@"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$");
            objMail.From = new MailAddress(smtpMailFrom, "Website điện thoại di động", System.Text.Encoding.UTF8);
            objMail.ReplyTo = new MailAddress(smtpMailFrom, "Website điện thoại di động", System.Text.Encoding.UTF8); 

            if (reg.IsMatch(strMailTo))
            {
                objMail.To.Add(new MailAddress(strMailTo));
                objMail.Subject = strMailSubject;
                if (bolIsHTMLFormat)
                {
                    objMail.IsBodyHtml = true;
                    objMail.Body = string.Format("<html><head><title>{0}</title></head><body>{1}</body></html>", strMailSubject, strContent);
                }
                else
                {
                    objMail.IsBodyHtml = false;
                    objMail.Body = strContent;
                }
                objMail.BodyEncoding = System.Text.Encoding.UTF8;
                sClient = new SmtpClient();

                sClient.Host = smtpServer;
        
                sClient.Port = smtpPort;
                sClient.Credentials = new System.Net.NetworkCredential(smtpUser, smtpPassword);
                sClient.EnableSsl = true;
                sClient.Send(objMail);

                return 1;
            }
            else
            {
                return 0;
            }
        }
        catch (Exception ex)
        {
            return -1;
        }
    }
}