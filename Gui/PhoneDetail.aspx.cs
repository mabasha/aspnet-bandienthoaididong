
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


public partial class Admin_PhoneDetail : System.Web.UI.Page
{
    //Request.QueryString("id")
    public static int id;
    public Phone phone;
    //AccessData ac = new AccessData();
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataTable dt = AccessData.GetTable("select * from Phone where id="+id);
        //lb_Price.Text = dt.Rows[0]["Price"].ToString();
        if (Request.QueryString["id"] != "")
        {
            id = int.Parse(Request.QueryString["id"]);
            phone = new Phone(id);
            img_Phone.ImageUrl = "~/Images/Phone/" + phone.image + ".jpg";
            //int price = phone.price;
            //string temp = String.Format("{0:0,0 VNĐ}", phone.price);
            lb_Price.Text = String.Format("{0:0,0 VNĐ}", phone.price);
            lb_PhoneName.Text = phone.name;
            lb_StandarBox.Text = phone.standarBox;
            lb_Warranty.Text = phone.warranty;

            lb_SpecialFeature.Text = phone.specialFeature;

            lb_Camera.Text = phone.camera;
            lb_SubCamera.Text = phone.subCamera;
            lb_VideoCall.Text = phone.videoCall;
            lb_RecorderCamera.Text = phone.recorderCamera;
            lb_VideoPlayer.Text = phone.videoPlayer;
            lb_MusicPlayer.Text = phone.musicPlayer;
            lb_FM.Text = phone.FM;
            lb_TV.Text = phone.TV;

            lb_Recoder.Text = phone.recorder;
            lb_CallingRecorder.Text = phone.callingRecorder;
            lb_FMRecorder.Text = phone.FMRecorder;
            lb_Java.Text = phone.java;
            lb_Game.Text = phone.game;
            lb_TVConnection.Text = phone.TVConnection;
            lb_OfficeApps.Text = phone.officeApps;
            lb_OtherApp.Text = phone.otherApp;

            lb_Ringtone.Text = phone.ringtone;
            lb_DownloadRingtone.Text = phone.downloadRingtone;
            lb_SpeakerPhone.Text = phone.speakerPhone;
            lb_Vibrate.Text = phone.vibrate;
            lb_JackPhone.Text = phone.jackPhone;

            lb_InternalStore.Text = phone.internalStore;
            lb_Ram.Text = phone.ram;
            lb_CPU.Text = phone.CPU;
            lb_MemoryCard.Text = phone.memoryCard;
            lb_MaximumMemoryCapacity.Text = phone.maximumMemoryCapacity;
        }
        
    }
}