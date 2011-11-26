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

/// <summary>
/// Summary description for Phone
/// </summary>
public class Phone
{
    public int id;
    public string name;
    public int producerID;
    public string image;
    public int price;
    public string specialFeature;
    public string camera;
    public string videoCall;
    public string recorderCamera;
    public string subCamera;
    public string videoPlayer;
    public string musicPlayer;
    public string FM;
    public string TV;
    public string recorder;
    public string callingRecorder;
    public string FMRecorder;
    public string java;
    public string game;
    public string TVConnection;
    public string officeApps;
    public string otherApp;
    public string screen;
    public string ringtone;
    public string downloadRingtone;
    public string speakerPhone;
    public string vibrate;
    public string jackPhone;
    public string internalStore;
    public string ram;
    public string CPU;
    public string memoryCard;
    public string maximumMemoryCapacity;
    public string contact;
    public string message;
    public string email;
    public string secondGband;
    public string threeGband;
    public string mutilSimcard;
    public string GPRS;
    public string EDGE;
    public string threeG;
    public string wifi;
    public string browser;
    public string GPS;
    public string bluetooth;
    public string ultrared;
    public string USB;
    public string resolution;
    public string sizeScreen;
    public string sensor;
    public string OS;
    public string style;
    public string qwertyKeyboard;
    public string size;
    public string weight;
    public string warranty;
    public string language;
    public string battery;
    public string capabilityBattery;
    public string callingTime;
    public string waittingTime;
    public string standarBox;
    
	public Phone()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Phone(int _id)
    {
        this.id = _id;
        DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
        name = dt.Rows[0]["Name"].ToString();
        producerID = int.Parse(dt.Rows[0]["ProducerID"].ToString());
        image = dt.Rows[0]["Image"].ToString();
        price = int.Parse(dt.Rows[0]["Price"].ToString());
        specialFeature = dt.Rows[0]["SpecialFeature"].ToString();
        camera = dt.Rows[0]["Camera"].ToString();
        videoCall = dt.Rows[0]["VideoCall"].ToString();
        recorderCamera = dt.Rows[0]["RecorderCamera"].ToString();
        subCamera = dt.Rows[0]["SubCamera"].ToString();
        videoPlayer = dt.Rows[0]["VideoPlayer"].ToString();
        musicPlayer = dt.Rows[0]["MusicPlayer"].ToString();
        FM = dt.Rows[0]["FM"].ToString();
        TV = dt.Rows[0]["TV"].ToString();
        recorder = dt.Rows[0]["Recorder"].ToString();
        callingRecorder = dt.Rows[0]["CallingRecorder"].ToString();
        FMRecorder = dt.Rows[0]["FMRecorder"].ToString();
        java = dt.Rows[0]["Java"].ToString();
        game = dt.Rows[0]["Game"].ToString();
        TVConnection = dt.Rows[0]["TVConnection"].ToString();
        officeApps = dt.Rows[0]["OfficeApps"].ToString();
        otherApp = dt.Rows[0]["OtherApp"].ToString();
        screen = dt.Rows[0]["Screen"].ToString();
        ringtone = dt.Rows[0]["Ringtone"].ToString();
        downloadRingtone = dt.Rows[0]["DownloadRingtone"].ToString();
        speakerPhone = dt.Rows[0]["SpeakerPhone"].ToString();
        vibrate = dt.Rows[0]["Vibrate"].ToString();
        jackPhone = dt.Rows[0]["JackPhone"].ToString();
        internalStore = dt.Rows[0]["InternalStore"].ToString();
        ram = dt.Rows[0]["Ram"].ToString();
        CPU = dt.Rows[0]["CPU"].ToString();
        memoryCard = dt.Rows[0]["MemoryCard"].ToString();
        maximumMemoryCapacity = dt.Rows[0]["MaximumMemoryCapacity"].ToString();
        contact = dt.Rows[0]["Contact"].ToString();
        message = dt.Rows[0]["Message"].ToString();
        email = dt.Rows[0]["Email"].ToString();
        secondGband = dt.Rows[0]["2Gband"].ToString();
        threeGband = dt.Rows[0]["3Gband"].ToString();
        mutilSimcard = dt.Rows[0]["MutilSimcard"].ToString();
        GPRS = dt.Rows[0]["GPRS"].ToString();
        EDGE = dt.Rows[0]["EDGE"].ToString();
        threeG = dt.Rows[0]["3G"].ToString();
        wifi = dt.Rows[0]["Wifi"].ToString();
        browser = dt.Rows[0]["Browser"].ToString();
        GPS = dt.Rows[0]["GPS"].ToString();
        bluetooth = dt.Rows[0]["Bluetooth"].ToString();
        ultrared = dt.Rows[0]["Ultrared"].ToString();
        USB = dt.Rows[0]["USB"].ToString();
        resolution = dt.Rows[0]["Resolution"].ToString();
        sizeScreen = dt.Rows[0]["SizeScreen"].ToString();
        sensor = dt.Rows[0]["Sensor"].ToString();
        OS = dt.Rows[0]["OS"].ToString();
        style = dt.Rows[0]["Style"].ToString();
        qwertyKeyboard = dt.Rows[0]["QwertyKeyboard"].ToString();
        size = dt.Rows[0]["Size"].ToString();
        weight = dt.Rows[0]["Weight"].ToString();
        warranty = dt.Rows[0]["Warranty"].ToString();
        language = dt.Rows[0]["Language"].ToString();
        battery = dt.Rows[0]["Battery"].ToString();
        capabilityBattery = dt.Rows[0]["CapabilityBattery"].ToString();
        callingTime = dt.Rows[0]["CallingTime"].ToString();
        waittingTime = dt.Rows[0]["WaittingTime"].ToString();
        standarBox = dt.Rows[0]["StandarBox"].ToString();

    }
}