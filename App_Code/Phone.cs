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
        //AccessData (string)AccessData = new AccessData();
        this.id = _id;
        name = (string)AccessData.ExecuteScalar("SELECT Name FROM Phone WHERE id=" + id);
        producerID = int.Parse((string)AccessData.ExecuteScalar("SELECT ProducerID FROM Phone WHERE id=" + id));
        image = (string)AccessData.ExecuteScalar("SELECT Image FROM Phone WHERE id=" + id);
        price = int.Parse((string)AccessData.ExecuteScalar("SELECT Price FROM Phone WHERE id=" + id));
        specialFeature = (string)AccessData.ExecuteScalar("SELECT SpecialFeature FROM Phone WHERE id=" + id);
        camera = (string)AccessData.ExecuteScalar("SELECT Camera FROM Phone WHERE id=" + id);
        videoCall = (string)AccessData.ExecuteScalar("SELECT VideoCall FROM Phone WHERE id=" + id);
        recorderCamera = (string)AccessData.ExecuteScalar("SELECT RecorderCamera FROM Phone WHERE id=" + id);
        subCamera = (string)AccessData.ExecuteScalar("SELECT SubCamera FROM Phone WHERE id=" + id);
        videoPlayer = (string)AccessData.ExecuteScalar("SELECT VideoPlayer FROM Phone WHERE id=" + id);
        musicPlayer = (string)AccessData.ExecuteScalar("SELECT MusicPlayer FROM Phone WHERE id=" + id);
        fM = (string)AccessData.ExecuteScalar("SELECT FM FROM Phone WHERE id=" + id);
        tV = (string)AccessData.ExecuteScalar("SELECT TV FROM Phone WHERE id=" + id);
        recorder = (string)AccessData.ExecuteScalar("SELECT Recorder FROM Phone WHERE id=" + id);
        callingRecorder = (string)AccessData.ExecuteScalar("SELECT CallingRecorder FROM Phone WHERE id=" + id);
        fMRecorder = (string)AccessData.ExecuteScalar("SELECT FMRecorder FROM Phone WHERE id=" + id);
        java = (string)AccessData.ExecuteScalar("SELECT Java FROM Phone WHERE id=" + id);
        game = (string)AccessData.ExecuteScalar("SELECT Game FROM Phone WHERE id=" + id);
        tVConnection = (string)AccessData.ExecuteScalar("SELECT TVConnection FROM Phone WHERE id=" + id);
        officeApps = (string)AccessData.ExecuteScalar("SELECT OfficeApps FROM Phone WHERE id=" + id);
        otherApp = (string)AccessData.ExecuteScalar("SELECT OtherApp FROM Phone WHERE id=" + id);
        screen = (string)AccessData.ExecuteScalar("SELECT Screen FROM Phone WHERE id=" + id);
        ringtone = (string)AccessData.ExecuteScalar("SELECT Ringtone FROM Phone WHERE id=" + id);
        downloadRingtone = (string)AccessData.ExecuteScalar("SELECT DownloadRingtone FROM Phone WHERE id=" + id);
        speakerPhone = (string)AccessData.ExecuteScalar("SELECT SpeakerPhone FROM Phone WHERE id=" + id);
        vibrate = (string)AccessData.ExecuteScalar("SELECT Vibrate FROM Phone WHERE id=" + id);
        jackPhone = (string)AccessData.ExecuteScalar("SELECT JackPhone FROM Phone WHERE id=" + id);
        internalStore = (string)AccessData.ExecuteScalar("SELECT InternalStore FROM Phone WHERE id=" + id);
        ram = (string)AccessData.ExecuteScalar("SELECT Ram FROM Phone WHERE id=" + id);
        cPU = (string)AccessData.ExecuteScalar("SELECT CPU FROM Phone WHERE id=" + id);
        memoryCard = (string)AccessData.ExecuteScalar("SELECT MemoryCard FROM Phone WHERE id=" + id);
        maximumMemoryCapacity = (string)AccessData.ExecuteScalar("SELECT MaximumMemoryCapacity FROM Phone WHERE id=" + id);
        contact = (string)AccessData.ExecuteScalar("SELECT Contact FROM Phone WHERE id=" + id);
        message = (string)AccessData.ExecuteScalar("SELECT Message FROM Phone WHERE id=" + id);
        email = (string)AccessData.ExecuteScalar("SELECT Email FROM Phone WHERE id=" + id);
        secondGband = (string)AccessData.ExecuteScalar("SELECT [2Gband] FROM Phone WHERE id=" + id);
        threeGband = (string)AccessData.ExecuteScalar("SELECT [3Gband] FROM Phone WHERE id=" + id);
        mutilSimcard = (string)AccessData.ExecuteScalar("SELECT MutilSimcard FROM Phone WHERE id=" + id);
        gPRS = (string)AccessData.ExecuteScalar("SELECT GPRS FROM Phone WHERE id=" + id);
        eDGE = (string)AccessData.ExecuteScalar("SELECT EDGE FROM Phone WHERE id=" + id);
        threeG = (string)AccessData.ExecuteScalar("SELECT [3G] FROM Phone WHERE id=" + id);
        wifi = (string)AccessData.ExecuteScalar("SELECT Wifi FROM Phone WHERE id=" + id);
        browser = (string)AccessData.ExecuteScalar("SELECT Browser FROM Phone WHERE id=" + id);
        gPS = (string)AccessData.ExecuteScalar("SELECT GPS FROM Phone WHERE id=" + id);
        bluetooth = (string)AccessData.ExecuteScalar("SELECT Bluetooth FROM Phone WHERE id=" + id);
        ultrared = (string)AccessData.ExecuteScalar("SELECT Ultrared FROM Phone WHERE id=" + id);
        uSB = (string)AccessData.ExecuteScalar("SELECT USB FROM Phone WHERE id=" + id);
        resolution = (string)AccessData.ExecuteScalar("SELECT Resolution FROM Phone WHERE id=" + id);
        sizeScreen = (string)AccessData.ExecuteScalar("SELECT SizeScreen FROM Phone WHERE id=" + id);
        sensor = (string)AccessData.ExecuteScalar("SELECT Sensor FROM Phone WHERE id=" + id);
        oS = (string)AccessData.ExecuteScalar("SELECT OS FROM Phone WHERE id=" + id);
        style = (string)AccessData.ExecuteScalar("SELECT Style FROM Phone WHERE id=" + id);
        qwertyKeyboard = (string)AccessData.ExecuteScalar("SELECT QwertyKeyboard FROM Phone WHERE id=" + id);
        size = (string)AccessData.ExecuteScalar("SELECT Size FROM Phone WHERE id=" + id);
        weight = (string)AccessData.ExecuteScalar("SELECT Weight FROM Phone WHERE id=" + id);
        warranty = (string)AccessData.ExecuteScalar("SELECT Warranty FROM Phone WHERE id=" + id);
        language = (string)AccessData.ExecuteScalar("SELECT Language FROM Phone WHERE id=" + id);
        battery = (string)AccessData.ExecuteScalar("SELECT Battery FROM Phone WHERE id=" + id);
        capabilityBattery = (string)AccessData.ExecuteScalar("SELECT CapabilityBattery FROM Phone WHERE id=" + id);
        callingTime = (string)AccessData.ExecuteScalar("SELECT CallingTime FROM Phone WHERE id=" + id);
        waittingTime = (string)AccessData.ExecuteScalar("SELECT WaittingTime FROM Phone WHERE id=" + id);
        standarBox = (string)AccessData.ExecuteScalar("SELECT StandarBox FROM Phone WHERE id=" + id);

    }
}