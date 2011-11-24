using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    public string fM;
    public string tV;
    public string recorder;
    public string callingRecorder;
    public string fMRecorder;
    public string java;
    public string game;
    public string tVConnection;
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
    public string cPU;
    public string memoryCard;
    public string maximumMemoryCapacity;
    public string contact;
    public string message;
    public string email;
    public string secondGband;
    public string threeGband;
    public string mutilSimcard;
    public string gPRS;
    public string eDGE;
    public string threeG;
    public string wifi;
    public string browser;
    public string gPS;
    public string bluetooth;
    public string ultrared;
    public string uSB;
    public string resolution;
    public string sizeScreen;
    public string sensor;
    public string oS;
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
        AccessData ac = new AccessData();
        this.id = _id;
        name = ac.ExecuteScalar("SELECT Name FROM Phone WHERE id=" + id);
        producerID = int.Parse(ac.ExecuteScalar("SELECT ProducerID FROM Phone WHERE id=" + id));
        image = ac.ExecuteScalar("SELECT Image FROM Phone WHERE id=" + id);
        price = int.Parse(ac.ExecuteScalar("SELECT Price FROM Phone WHERE id=" + id));
        specialFeature = ac.ExecuteScalar("SELECT SpecialFeature FROM Phone WHERE id=" + id);
        camera = ac.ExecuteScalar("SELECT Camera FROM Phone WHERE id=" + id);
        videoCall = ac.ExecuteScalar("SELECT VideoCall FROM Phone WHERE id=" + id);
        recorderCamera = ac.ExecuteScalar("SELECT RecorderCamera FROM Phone WHERE id=" + id);
        subCamera = ac.ExecuteScalar("SELECT SubCamera FROM Phone WHERE id=" + id);
        videoPlayer = ac.ExecuteScalar("SELECT VideoPlayer FROM Phone WHERE id=" + id);
        musicPlayer = ac.ExecuteScalar("SELECT MusicPlayer FROM Phone WHERE id=" + id);
        fM = ac.ExecuteScalar("SELECT FM FROM Phone WHERE id=" + id);
        tV = ac.ExecuteScalar("SELECT TV FROM Phone WHERE id=" + id);
        recorder = ac.ExecuteScalar("SELECT Recorder FROM Phone WHERE id=" + id);
        callingRecorder = ac.ExecuteScalar("SELECT CallingRecorder FROM Phone WHERE id=" + id);
        fMRecorder = ac.ExecuteScalar("SELECT FMRecorder FROM Phone WHERE id=" + id);
        java = ac.ExecuteScalar("SELECT Java FROM Phone WHERE id=" + id);
        game = ac.ExecuteScalar("SELECT Game FROM Phone WHERE id=" + id);
        tVConnection = ac.ExecuteScalar("SELECT TVConnection FROM Phone WHERE id=" + id);
        officeApps = ac.ExecuteScalar("SELECT OfficeApps FROM Phone WHERE id=" + id);
        otherApp = ac.ExecuteScalar("SELECT OtherApp FROM Phone WHERE id=" + id);
        screen = ac.ExecuteScalar("SELECT Screen FROM Phone WHERE id=" + id);
        ringtone = ac.ExecuteScalar("SELECT Ringtone FROM Phone WHERE id=" + id);
        downloadRingtone = ac.ExecuteScalar("SELECT DownloadRingtone FROM Phone WHERE id=" + id);
        speakerPhone = ac.ExecuteScalar("SELECT SpeakerPhone FROM Phone WHERE id=" + id);
        vibrate = ac.ExecuteScalar("SELECT Vibrate FROM Phone WHERE id=" + id);
        jackPhone = ac.ExecuteScalar("SELECT JackPhone FROM Phone WHERE id=" + id);
        internalStore = ac.ExecuteScalar("SELECT InternalStore FROM Phone WHERE id=" + id);
        ram = ac.ExecuteScalar("SELECT Ram FROM Phone WHERE id=" + id);
        cPU = ac.ExecuteScalar("SELECT CPU FROM Phone WHERE id=" + id);
        memoryCard = ac.ExecuteScalar("SELECT MemoryCard FROM Phone WHERE id=" + id);
        maximumMemoryCapacity = ac.ExecuteScalar("SELECT MaximumMemoryCapacity FROM Phone WHERE id=" + id);
        contact = ac.ExecuteScalar("SELECT Contact FROM Phone WHERE id=" + id);
        message = ac.ExecuteScalar("SELECT Message FROM Phone WHERE id=" + id);
        email = ac.ExecuteScalar("SELECT Email FROM Phone WHERE id=" + id);
        secondGband = ac.ExecuteScalar("SELECT [2Gband] FROM Phone WHERE id=" + id);
        threeGband = ac.ExecuteScalar("SELECT [3Gband] FROM Phone WHERE id=" + id);
        mutilSimcard = ac.ExecuteScalar("SELECT MutilSimcard FROM Phone WHERE id=" + id);
        gPRS = ac.ExecuteScalar("SELECT GPRS FROM Phone WHERE id=" + id);
        eDGE = ac.ExecuteScalar("SELECT EDGE FROM Phone WHERE id=" + id);
        threeG = ac.ExecuteScalar("SELECT [3G] FROM Phone WHERE id=" + id);
        wifi = ac.ExecuteScalar("SELECT Wifi FROM Phone WHERE id=" + id);
        browser = ac.ExecuteScalar("SELECT Browser FROM Phone WHERE id=" + id);
        gPS = ac.ExecuteScalar("SELECT GPS FROM Phone WHERE id=" + id);
        bluetooth = ac.ExecuteScalar("SELECT Bluetooth FROM Phone WHERE id=" + id);
        ultrared = ac.ExecuteScalar("SELECT Ultrared FROM Phone WHERE id=" + id);
        uSB = ac.ExecuteScalar("SELECT USB FROM Phone WHERE id=" + id);
        resolution = ac.ExecuteScalar("SELECT Resolution FROM Phone WHERE id=" + id);
        sizeScreen = ac.ExecuteScalar("SELECT SizeScreen FROM Phone WHERE id=" + id);
        sensor = ac.ExecuteScalar("SELECT Sensor FROM Phone WHERE id=" + id);
        oS = ac.ExecuteScalar("SELECT OS FROM Phone WHERE id=" + id);
        style = ac.ExecuteScalar("SELECT Style FROM Phone WHERE id=" + id);
        qwertyKeyboard = ac.ExecuteScalar("SELECT QwertyKeyboard FROM Phone WHERE id=" + id);
        size = ac.ExecuteScalar("SELECT Size FROM Phone WHERE id=" + id);
        weight = ac.ExecuteScalar("SELECT Weight FROM Phone WHERE id=" + id);
        warranty = ac.ExecuteScalar("SELECT Warranty FROM Phone WHERE id=" + id);
        language = ac.ExecuteScalar("SELECT Language FROM Phone WHERE id=" + id);
        battery = ac.ExecuteScalar("SELECT Battery FROM Phone WHERE id=" + id);
        capabilityBattery = ac.ExecuteScalar("SELECT CapabilityBattery FROM Phone WHERE id=" + id);
        callingTime = ac.ExecuteScalar("SELECT CallingTime FROM Phone WHERE id=" + id);
        waittingTime = ac.ExecuteScalar("SELECT WaittingTime FROM Phone WHERE id=" + id);
        standarBox = ac.ExecuteScalar("SELECT StandarBox FROM Phone WHERE id=" + id);

    }
}