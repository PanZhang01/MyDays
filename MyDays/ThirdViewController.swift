//
//  ThirdViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var DOBlabel: UILabel!
    @IBOutlet weak var Constelabel: UILabel!
    @IBOutlet weak var Zodlabel: UILabel!
    @IBOutlet weak var Countlabel: UILabel!
    @IBOutlet weak var constellation: UILabel!
    @IBOutlet weak var chineZodi: UILabel!
    @IBOutlet weak var birthCount: UILabel!
    


    var db :OpaquePointer? = nil
    func createTable() {
        let sql = "create table if not exists user_information "
            + "( id integer primary key autoincrement, "
            + "first_name text, last_name text, gender text, dob text);" as NSString
        
        if sqlite3_exec(db, sql.utf8String, nil, nil, nil)
            == SQLITE_OK{
            print("建立資料表成功")
        }
        else {
            print("table create error")
        }
    }
    
    func getData() -> [ String ] {
        var statement :OpaquePointer? = nil
        let sql = "SELECT * FROM user_information;" as NSString
        if sqlite3_prepare_v2(db, sql.utf8String, -1, &statement, nil)
            == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW{
                let firstName = String(cString: sqlite3_column_text(statement, 1))
                let lastName = String(cString: sqlite3_column_text(statement, 2))
                let gender = String(cString: sqlite3_column_text(statement, 3))
                let dob = String(cString: sqlite3_column_text(statement, 4))
                return [firstName, lastName, gender, dob]
            }
        }
        return [];
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let urls = FileManager.default
            .urls(
                for: .documentDirectory,
                in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString
            + "sqlite3.db"
        print(sqlitePath)
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK {
            print("資料庫連線成功")
            let personal_information = getData()
            print(personal_information)
        } else {
            print("資料庫連線失敗")
            
        }
        
        var array1 : [String] = [String]()
        array1 = getData()
        userName.text = array1[0] + " " + array1[1]
        DOBlabel.text = array1[3]
        print(array1[3])
        
    }

    @IBOutlet weak var userBackground: UIView!
    @IBOutlet weak var constelBackground: UIView!
    @IBOutlet weak var zodiBackground: UIView!
    @IBOutlet weak var birthBackground: UIView!
    @IBOutlet weak var separatorLine: UIView!
    
    @IBOutlet weak var avatar: UIImageView!
    
    
    /*   @IBOutlet weak var SettingsButton: UIBarButtonItem!

    @IBAction func onClick(_ sender: Any) {
        let settingsView = SettingsViewController()
        present(settingsView,animated: true,completion: nil)
    } */
    
    func modifyBackground(view1:UIView,r:CGFloat,g:CGFloat,b:CGFloat) -> UIView{
        var view = UIView()
        view = view1
        let red = r, green = g, blue = b
        view.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        return view
    }
    
    func modifyFont(label1:UILabel,r:CGFloat,g:CGFloat,b:CGFloat) -> UILabel{
        var label = UILabel()
        label = label1
        let red = r, green = g, blue = b
        label.textColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return label
    }
    
    func ConstelCal() {
        var array1 : [String] = [String]()
        array1 = getData()
     //   let dob = String(array1[3])
        let dob = String(DOBlabel.text!)
     //   print("123123",dob)
        let start = dob.index(dob.startIndex,offsetBy: 0)
        let end = dob.index(dob.startIndex, offsetBy: 2)
        let range = start..<end
        let dd = dob[range]
    //    print(mm)
        let start2 = dob.index(dob.startIndex, offsetBy: 3)
        let end2 = dob.index(dob.endIndex, offsetBy:-5)
        let range2 = start2..<end2
        let mm = dob[range2]
    //    print(dd)
        let mmdd = Int(mm)! * 100 + Int(dd)!;
    //   print(mm)
    //    print(dd)
    //    print(mmdd)
        var result = ""
        
        if ((mmdd >= 321 && mmdd <= 331) ||
            (mmdd >= 401 && mmdd <= 419)) {
            result = "Ram"
        } else if ((mmdd >= 420 && mmdd <= 430) ||
            (mmdd >= 501 && mmdd <= 520)) {
            result = "Bull"
        } else if ((mmdd >= 521 && mmdd <= 531) ||
            (mmdd >= 601 && mmdd <= 621)) {
            result = "Twins"
        } else if ((mmdd >= 622 && mmdd <= 630) ||
            (mmdd >= 701 && mmdd <= 722)) {
            result = "Crab"
        } else if ((mmdd >= 723 && mmdd <= 731) ||
            (mmdd >= 801 && mmdd <= 822)) {
            result = "Lion"
        } else if ((mmdd >= 823 && mmdd <= 831) ||
            (mmdd >= 901 && mmdd <= 922)) {
            result = "Virgin"
        } else if ((mmdd >= 923 && mmdd <= 930) ||
            (mmdd >= 1001 && mmdd <= 1023)) {
            result = "Scales"
        } else if ((mmdd >= 1024 && mmdd <= 1031) ||
            (mmdd >= 1101 && mmdd <= 1122)) {
            result = "Scorpion"
        } else if ((mmdd >= 1123 && mmdd <= 1130) ||
            (mmdd >= 1201 && mmdd <= 1221)) {
            result = "Archer"
        } else if ((mmdd >= 1222 && mmdd <= 1231) ||
            (mmdd >= 101 && mmdd <= 119)) {
            result = "Sea Goat"
        } else if ((mmdd >= 120 && mmdd <= 131) ||
            (mmdd >= 201 && mmdd <= 218)) {
            result = "Water Carrier"
        } else if ((mmdd >= 219 && mmdd <= 229) ||
            (mmdd >= 301 && mmdd <= 320)) {
            //There are 29 days in a leap year in February
            result = "Fish"
        }else{
       //     print(mmdd)
            result = "Date error"
        }
        Constelabel.text = result
    }
    
    func ZodiaCal(){
        var array1 : [String] = [String]()
        array1 = getData()
     //   let dob = String(array1[3])
        let dob = String(DOBlabel.text!)
        
        let start = dob.index(dob.startIndex, offsetBy: 6)
        let end = dob.index(dob.endIndex, offsetBy:0)
        let range = start..<end
        let dd = dob[range]
       // print(dd)
        let Year = dd
        //     print(Year)
        let i = Int(Year)
        //     print(i)
        if (i == nil) {}
        else {
            var j = (i!-2000)%12
            if (j<0){
                j = j+12
                //            print(j)
            }
            switch j {
            case 0:
                Zodlabel.text = "Dragon Year"
            case 1:
                Zodlabel.text = "Snake Year"
            case 2:
                Zodlabel.text = "Horse Year"
            case 3:
                Zodlabel.text = "Goat Year"
            case 4:
                Zodlabel.text = "Monkey Year"
            case 5:
                Zodlabel.text = "Rooster Year"
            case 6:
                Zodlabel.text = "Dog Year"
            case 7:
                Zodlabel.text = "Pig Year"
            case 8:
                Zodlabel.text = "Rat Year"
            case 9:
                Zodlabel.text = "Ox Year"
            case 10:
                Zodlabel.text = "Tiger Year"
            case 11:
                Zodlabel.text = "Rabbit Year"
            default:
                Zodlabel.text = "The number of the year must be in digits!"
            }
        }
    }
    
    func getYear() ->Int {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day], from: Date())
        return comps.year!

    }
    
        func BirthdayCountdown(){
            var array1 : [String] = [String]()
            array1 = getData()
          //  userName.text = array1[0] + " " + array1[1]
         //   DOBlabel.text = array1[3]
            let dob = String(DOBlabel.text!)
     //       print(dob)
            //Get date
            let start = dob.index(dob.startIndex, offsetBy: 3)
            let end = dob.index(dob.endIndex, offsetBy:-5)
            let range = start..<end
            let mm = dob[range]
            
            //Get month
            let start2 = dob.index(dob.startIndex,offsetBy: 0)
            let end2 = dob.index(dob.startIndex, offsetBy: 2)
            let range2 = start2..<end2
            let dd = dob[range2]
            
            //Get year
            let yy = String(getYear()+1)
            
            let dob2 = yy+(".")+mm+(".")+dd
      //      print(dob2)
            let dformat = DateFormatter()
            dformat.dateFormat = "yyyy.MM.dd"
            let timeZone = NSTimeZone(name: "UTC")
            dformat.timeZone=timeZone as! TimeZone
            let objdate = dformat.date(from: dob2)
        //    let objdate2 = dformat.date(from: dob)
        //    print(objdate)
            
            let interval = objdate?.timeIntervalSinceNow
            let days = abs( (Int(interval!))/86400)+1
       //     print(days)
            Countlabel.text = String(days)+(" Day(s)")

    }
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        var array1 : [String] = [String]()
        array1 = getData()
       // userName.text = array1[0] + " " + array1[1]
       // DOBlabel.text = array1[3]
       
        ConstelCal()
        ZodiaCal()
        BirthdayCountdown()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background4.png")!)
        
        modifyBackground(view1: userBackground, r: 200, g: 200, b: 200)
        modifyBackground(view1: constelBackground, r: 230, g: 250, b: 255)
        modifyBackground(view1: zodiBackground, r: 230, g: 250, b: 255)
        modifyBackground(view1: birthBackground, r: 230, g: 250, b: 255)
        modifyBackground(view1: separatorLine, r: 0, g: 0, b: 0)
        
        modifyFont(label1: userName, r: 0, g: 0, b: 0)
        modifyFont(label1: DOBlabel, r: 0, g: 0, b: 0)
        modifyFont(label1: Constelabel, r: 0, g: 0, b: 0)
        modifyFont(label1: Zodlabel, r: 0, g: 0, b: 0)
        modifyFont(label1: Countlabel, r: 0, g: 0, b: 0)
        modifyFont(label1: constellation, r: 70, g: 70, b: 70)
        modifyFont(label1: chineZodi, r: 70, g: 70, b: 70)
        modifyFont(label1: birthCount, r: 70, g: 70, b: 70)
        
        let image : UIImage = UIImage(named:"user")!
        avatar.image = image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
