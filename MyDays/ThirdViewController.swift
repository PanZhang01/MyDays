//
//  ThirdViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var DOBlabel: UILabel!
    @IBOutlet weak var Constelabel: UILabel!
    @IBOutlet weak var Zodlabel: UILabel!
    @IBOutlet weak var Countlabel: UILabel!

    /*   @IBOutlet weak var SettingsButton: UIBarButtonItem!

    @IBAction func onClick(_ sender: Any) {
        let settingsView = SettingsViewController()
        present(settingsView,animated: true,completion: nil)
    } */
    
    func ConstelCal() {
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
        // 月以100倍之月作为一个数字计算出来
        let mmdd = Int(mm)! * 100 + Int(dd)!;
    //   print(mm)
    //    print(dd)
    //    print(mmdd)
        var result = ""
        
        if ((mmdd >= 321 && mmdd <= 331) ||
            (mmdd >= 401 && mmdd <= 419)) {
            result = "白羊座"
        } else if ((mmdd >= 420 && mmdd <= 430) ||
            (mmdd >= 501 && mmdd <= 520)) {
            result = "金牛座"
        } else if ((mmdd >= 521 && mmdd <= 531) ||
            (mmdd >= 601 && mmdd <= 621)) {
            result = "双子座"
        } else if ((mmdd >= 622 && mmdd <= 630) ||
            (mmdd >= 701 && mmdd <= 722)) {
            result = "巨蟹座"
        } else if ((mmdd >= 723 && mmdd <= 731) ||
            (mmdd >= 801 && mmdd <= 822)) {
            result = "狮子座"
        } else if ((mmdd >= 823 && mmdd <= 831) ||
            (mmdd >= 901 && mmdd <= 922)) {
            result = "处女座"
        } else if ((mmdd >= 923 && mmdd <= 930) ||
            (mmdd >= 1001 && mmdd <= 1023)) {
            result = "天秤座"
        } else if ((mmdd >= 1024 && mmdd <= 1031) ||
            (mmdd >= 1101 && mmdd <= 1122)) {
            result = "天蝎座"
        } else if ((mmdd >= 1123 && mmdd <= 1130) ||
            (mmdd >= 1201 && mmdd <= 1221)) {
            result = "射手座"
        } else if ((mmdd >= 1222 && mmdd <= 1231) ||
            (mmdd >= 101 && mmdd <= 119)) {
            result = "摩羯座"
        } else if ((mmdd >= 120 && mmdd <= 131) ||
            (mmdd >= 201 && mmdd <= 218)) {
            result = "水瓶座"
        } else if ((mmdd >= 219 && mmdd <= 229) ||
            (mmdd >= 301 && mmdd <= 320)) {
            //考虑到2月闰年有29天的
            result = "双鱼座"
        }else{
       //     print(mmdd)
            result = "日期错误"
        }
        Constelabel.text = result
    }
    
    func ZodiaCal(){
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
            let dob = String(DOBlabel.text!)
     //       print(dob)
            //获取日期
            let start = dob.index(dob.startIndex, offsetBy: 3)
            let end = dob.index(dob.endIndex, offsetBy:-5)
            let range = start..<end
            let mm = dob[range]
            
            //获取月份
            let start2 = dob.index(dob.startIndex,offsetBy: 0)
            let end2 = dob.index(dob.startIndex, offsetBy: 2)
            let range2 = start2..<end2
            let dd = dob[range2]
            
            //获取年份
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
        ConstelCal()
        ZodiaCal()
        BirthdayCountdown()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background4.png")!)
        
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
