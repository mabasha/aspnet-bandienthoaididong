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
    public int distributorID;
    public string image;
    public double price;
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
    public string screen;
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
    public int residualAmount;
    public string oldName;// Dùng để kiểm tra mỗi khi Update, sẽ lưu giá trị tên của phone trước khi sửa để khi nhấn Submit 
    //thì sẽ kiểm tra xem là tên mới và tên cũ có giống nhau không, nếu không giống nhau thì phải xem tên mới đã có trong 
    //database chưa thì mới cho update.
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
        oldName = dt.Rows[0]["Name"].ToString();
        producerID = int.Parse(dt.Rows[0]["ProducerID"].ToString());
        //distributorID = int.Parse(dt.Rows[0]["DistributorID"].ToString());
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

    public Phone(int id, string name, int producerID, int distributorID, string image, double price, string specialFeature, string camera,
                string videoCall, string recorderCamera, string subCamera, string videoPlayer, string musicPlayer, string FM,
                string TV, string recorder, string callingRecorder, string FMRecorder, string java, string game, string TVConnection,
                string officeApps, string otherApp, string screen, string ringtone, string downloadRingtone, string speakerPhone,
                string vibrate, string jackPhone, string internalStore, string ram, string CPU, string memoryCard,
                string maximumMemoryCapacity, string contact, string message, string email, string secondGband, string threeGband,
                string mutilSimcard, string GPRS, string EDGE, string threeG, string wifi, string browser, string GPS, string bluetooth,
                string ultrared, string USB, string resolution, string sizeScreen, string sensor, string OS, string style,
                string qwertyKeyboard, string size, string weight, string warranty, string language, string battery, string capabilityBattery,
                string callingTime, string waittingTime, string standarBox, int residualAmount)
    {
        this.id = id;
        this.name = name;
        this.producerID = producerID;
        this.distributorID = distributorID;
        this.image = image;
        this.price = price;
        this.specialFeature = specialFeature;
        this.camera = camera;
        this.videoCall = videoCall;
        this.recorderCamera = recorderCamera;
        this.subCamera = subCamera;
        this.videoPlayer = videoPlayer;
        this.musicPlayer = musicPlayer;
        this.FM = FM;
        this.TV = TV;
        this.recorder = recorder;
        this.callingRecorder = callingRecorder;
        this.FMRecorder = FMRecorder;
        this.java = java;
        this.game = game;
        this.TVConnection = TVConnection;
        this.officeApps = officeApps;
        this.otherApp = otherApp;
        this.screen = screen;
        this.ringtone = ringtone;
        this.downloadRingtone = downloadRingtone;
        this.speakerPhone = speakerPhone;
        this.vibrate = vibrate;
        this.jackPhone = jackPhone;
        this.internalStore = internalStore;
        this.ram = ram;
        this.CPU = CPU;
        this.memoryCard = memoryCard;
        this.maximumMemoryCapacity = maximumMemoryCapacity;
        this.contact = contact;
        this.message = message;
        this.email = email;
        this.secondGband = secondGband;
        this.threeGband = threeGband;
        this.mutilSimcard = mutilSimcard;
        this.GPRS = GPRS;
        this.EDGE = EDGE;
        this.threeG = threeG;
        this.wifi = wifi;
        this.browser = browser;
        this.GPS = GPS;
        this.bluetooth = bluetooth;
        this.ultrared = ultrared;
        this.USB = USB;
        this.resolution = resolution;
        this.sizeScreen = sizeScreen;
        this.sensor = sensor;
        this.OS = OS;
        this.style = style;
        this.qwertyKeyboard = qwertyKeyboard;
        this.size = size;
        this.weight = weight;
        this.warranty = warranty;
        this.language = language;
        this.battery = battery;
        this.capabilityBattery = capabilityBattery;
        this.callingTime = callingTime;
        this.waittingTime = waittingTime;
        this.standarBox = standarBox;
        this.residualAmount = residualAmount;
    }

    public bool Insert()
    {
        //id=AccessData.GetMaxID("Users");
        bool isExit = IsExistName();
        if (isExit == false)
        {
            string query = String.Format("INSERT INTO Phone(Name, ProducerID, DistributorID, Image, Price," +
                                                        "SpecialFeature, Camera, VideoCall, RecorderCamera, SubCamera, VideoPlayer," +
                                                        "MusicPlayer, FM, TV, Recorder, CallingRecorder, FMRecorder, Java, Game, TVConnection," +
                                                        "OfficeApps, OtherApp, Ringtone, DownloadRingtone, SpeakerPhone, Vibrate, JackPhone," +
                                                        "InternalStore, Ram, CPU, MemoryCard, MaximumMemoryCapacity, Contact, Message, Email," +
                                                        "[2Gband], [3Gband], MutilSimcard, GPRS, EDGE, [3G], Wifi, Browser, GPS, Bluetooth, Ultrared," +
                                                        "USB, Screen, Resolution, SizeScreen, Sensor, OS, Style, QwertyKeyboard, Size, Weight," +
                                                        "Warranty, Language, Battery, CapabilityBattery, CallingTime, WaittingTime, StandarBox, ResidualAmount)" +
                                        "VALUES(N'{0}', {1}, {2}, N'{3}', {4}, N'{5}', N'{6}', N'{7}', N'{8}', N'{9}', N'{10}'," +
                                                "N'{11}', N'{12}', N'{13}', N'{14}', N'{15}', N'{16}', N'{17}', N'{18}', N'{19}', N'{20}'," +
                                                "N'{21}', N'{22}', N'{23}', N'{24}', N'{25}', N'{26}', N'{27}', N'{28}', N'{29}', N'{30}'," +
                                                "N'{31}', N'{32}', N'{33}', N'{34}', N'{35}', N'{36}', N'{37}', N'{38}', N'{39}', N'{40}'," +
                                                "N'{41}', N'{42}', N'{43}', N'{44}', N'{45}', N'{46}', N'{47}', N'{48}', N'{49}', N'{50}'," +
                                                "N'{51}', N'{52}', N'{53}', N'{54}', N'{55}', N'{56}', N'{57}', N'{58}', N'{59}', N'{60}'," +
                                                "N'{61}', N'{62}', {63})",
                                        name, producerID, distributorID, image, price, specialFeature, camera, videoCall,
                                        recorderCamera, subCamera, videoPlayer, musicPlayer, FM, TV, recorder, callingRecorder,
                                        FMRecorder, java, game, TVConnection, officeApps, otherApp, ringtone, downloadRingtone,
                                        speakerPhone, vibrate, jackPhone, internalStore, ram, CPU, memoryCard, maximumMemoryCapacity,
                                        contact, message, email, secondGband, threeGband, mutilSimcard, GPRS, EDGE, threeG, wifi,
                                        browser, GPS, bluetooth, ultrared, USB, screen, resolution, sizeScreen, sensor, OS, style,
                                        qwertyKeyboard, size, weight, warranty, language, battery, capabilityBattery, callingTime,
                                        waittingTime, standarBox, residualAmount);
            //string query = "INSERT INTO Phone(ID, Name, ProducerID, DistributorID, Image, Price,SpecialFeature, Camera, VideoCall, RecorderCamera, SubCamera, VideoPlayer,MusicPlayer, FM, TV, Recorder, CallingRecorder, FMRecorder, Java, Game, TVConnection,OfficeApps, OtherApp, Ringtone, DownloadRingtone, SpeakerPhone, Vibrate, JackPhone,InternalStore, Ram, CPU, MemoryCard, MaximumMemoryCapacity, Contact, Message, Email,2Gband, 3Gband, MutilSimcard, GPRS, EDGE, 3G, Wifi, Browser, GPS, Bluetooth, Ultrared,USB, Screen, Resolution, SizeScreen, Sensor, OS, Style, QwertyKeyboard, Size, Weight,Warranty, Language, Battery, CapabilityBattery, CallingTime, WaittingTime, StandarBox, ResidualAmount) VALUES('23',N'dfdfdf', '1', '1', N'~/Images/Phone/', '223333', N'ẻwrwfewfef', N'ưefwfwf', N'fwefwef', N'fwfwe', N'fwfwe', N'v',N'fwfwe', N'fwfwe', N'fwfwe', N'v', N'vfwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe',N'fwfwe', N'fwfwe', N'fwfwe', N'vfwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe',N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe',N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'vfwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe',N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe', N'fwfwe',N'fwfwe', N'fwfwe', '4555')";

            AccessData.ExecuteNonQuery(query);
        }

        return !isExit;
    }

    public bool Update()
    {
        bool isExit = IsExistName();
        DataTable dt = AccessData.GetTable("SELECT * FROM Phone WHERE id=" + id);
        //name = dt.Rows[0]["Name"].ToString();
        //oldName = dt.Rows[0]["Name"].ToString();
        if (String.Compare(oldName, name) != 0 && isExit == true)
        {
            return false;
        }else{
            string sql = String.Format("UPDATE Phone SET Name=N'{0}', ProducerID={1}, DistributorID={2}," +
                "Image=N'{3}', Price={4}, SpecialFeature=N'{5}', Camera=N'{6}', VideoCall=N'{7}'," +
                "RecorderCamera=N'{8}', SubCamera=N'{9}', VideoPlayer=N'{10}', MusicPlayer=N'{11}', FM=N'{12}'," + 
                "TV=N'{13}', Recorder=N'{14}', CallingRecorder=N'{15}', FMRecorder=N'{16}', Java=N'{17}'," +
                "Game=N'{18}', TVConnection=N'{19}', OfficeApps=N'{20}', OtherApp=N'{21}', Ringtone=N'{22}'," +
                "DownloadRingtone=N'{23}', SpeakerPhone=N'{24}', Vibrate=N'{25}', JackPhone=N'{26}'," +
                "InternalStore=N'{27}', Ram=N'{28}', CPU=N'{29}', MemoryCard=N'{30}', MaximumMemoryCapacity=N'{31}'," +
                "Contact=N'{32}', Message=N'{33}', Email=N'{34}', [2Gband]=N'{35}', [3Gband]=N'{36}', MutilSimcard=N'{37}'," +
                "GPRS=N'{38}', EDGE=N'{39}', [3G]=N'{40}', Wifi=N'{41}', Browser=N'{42}', GPS=N'{43}', Bluetooth=N'{44}'," +
                "Ultrared=N'{45}', USB=N'{46}', Screen=N'{47}', Resolution=N'{48}', SizeScreen=N'{49}', Sensor=N'{50}'," +
                "OS=N'{51}', Style=N'{52}', QwertyKeyboard=N'{53}', Size=N'{54}', Weight=N'{55}', Warranty=N'{56}'," +
                "Language=N'{57}', Battery=N'{58}', CapabilityBattery=N'{59}', CallingTime=N'{60}', WaittingTime=N'{61}'," +
                "StandarBox=N'{62}', ResidualAmount={63} WHERE ID={64}",
                name, producerID, distributorID, image, price, specialFeature, camera, videoCall,
                recorderCamera, subCamera, videoPlayer, musicPlayer, FM, TV, recorder, callingRecorder,
                FMRecorder, java, game, TVConnection, officeApps, otherApp, ringtone, downloadRingtone,
                speakerPhone, vibrate, jackPhone, internalStore, ram, CPU, memoryCard, maximumMemoryCapacity,
                contact, message, email, secondGband, threeGband, mutilSimcard, GPRS, EDGE, threeG, wifi,
                browser, GPS, bluetooth, ultrared, USB, screen, resolution, sizeScreen, sensor, OS, style,
                qwertyKeyboard, size, weight, warranty, language, battery, capabilityBattery, callingTime,
                waittingTime, standarBox, residualAmount, id);
            AccessData.ExecuteNonQuery(sql);
            return true;
        }
        //return isExit;
    }

    public void GetInfoByID()
    {
        String query = String.Format("select * from Phone where ID = N'{0}'", id);
        DataTable dt = AccessData.GetTable(query);
        name = (string)dt.Rows[0]["Name"];
        price = Convert.ToDouble(dt.Rows[0]["Price"]);
    }

    public bool IsExistName()
    {
        string query = String.Format("select count(ID) from Phone where name = N'{0}'", name);
        int count = Convert.ToInt32(AccessData.ExecuteScalar(query));
        if (count > 0) return true;
        return false;
    }

    public int GetAmount()
    {
        String query = String.Format("select ResidualAmount from Phone where ID = N'{0}'", id);
        return (int)AccessData.ExecuteScalar(query);
    }

    public void SetAmount(int amount)
    {
        String query = String.Format("Update Phone set ResidualAmount = {0} where ID = {1}", amount, id);
        AccessData.ExecuteNonQuery(query);
    }

    public static DataTable GetAllWithKeyword(string keyword)
    {
        String query = String.Format("select * from Phone where Name like N'%{0}%'", keyword);
        return AccessData.GetTable(query);
    }

    public string GetNameFromID(int id)
    {
        string query = String.Format("select Name from Phone where ID = N'{0}'", id);
        object re = AccessData.ExecuteScalar(query);
        return Convert.ToString(re);
    }
}