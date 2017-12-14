//
//  Constellation.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/30.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit
import WebKit

class Constellation: UIViewController, WKUIDelegate {

    @IBOutlet weak var DateField: UITextField!
    @IBOutlet weak var HidePicker: UIButton!
    @IBOutlet weak var Displaylabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    let Picker = UIDatePicker(frame: CGRect(x:0, y:0, width:320, height:216))
   
    
    func createButton(x:Int,y:Int,w:Int,h:Int,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,ti:String) -> UIButton{
        let xAxis = x, yAxis = y, vWidth = w, vHeight = h
        let vRed:CGFloat = r, vGreen:CGFloat = g, vBlue:CGFloat = b, vAlpha:CGFloat = a
        let Title = ti
        let Button = UIButton(frame:CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
                Button.setTitle(Title, for:.normal)
                Button.setTitleColor(UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha), for: .normal)
                self.view.addSubview(Button)
                return Button
            }
    
    @objc func submit(_ sender:UIButton) {
        print("submitted")
        Dateinput()
    }
    
    //当Datepicker出现时显示隐藏按钮
    @IBAction func DatePick(_ sender: Any) {
    HidePicker.isHidden = false
    }
    
    //点击按钮隐藏Datepicker
    @IBAction func HidePick(_ sender: Any) {
    DateField.resignFirstResponder()
    Dateinput()
    HidePicker.isHidden = true
    }
    
    //点击按钮计算星座
    @IBAction func ClickToCal(_ sender: Any) {
        Dateinput()
        DateField.resignFirstResponder()
        HidePicker.isHidden = true
    }
    
    
    //将Datepicker里的内容输入到textfield里面
    func Dateinput() {
        print("DateInput")
        let dformat = DateFormatter()
        dformat.dateFormat = "MM.dd.YYYY"
        let datestr = dformat.string(from: Picker.date)
        
        let start = datestr.index(datestr.startIndex,offsetBy: 0)
        let end = datestr.index(datestr.startIndex, offsetBy: 2)
        let range = start..<end
        let mm = datestr[range]
        
        let start2 = datestr.index(datestr.startIndex, offsetBy: 3)
        let end2 = datestr.index(datestr.endIndex, offsetBy:-5)
        let range2 = start2..<end2
        let dd = datestr[range2]
    //    print(mm)
    //    print(dd)
        constellcal(mm: Int(mm)!,dd: Int(dd)!)
        DateField.text = datestr
    }
    
    //计算星座
    func constellcal(mm: Int,dd: Int) {
        let month = mm
        let day = dd
   //     print(month)
   //     print(day)
        // 月以100倍之月作为一个数字计算出来
        let mmdd = month * 100 + day;
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
            print(mmdd)
            result = "日期错误"
        }
      Displaylabel.text = result
    }
    
    
    //点击屏幕划下键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        HidePicker.isHidden = true
        Dateinput()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        HidePicker.isHidden = true
        DateField.inputView = Picker
        Picker.datePickerMode = .date
        Picker.backgroundColor = UIColor.white
       
        
        let path = Bundle.main.path(forResource: "rect1", ofType: "svg")!
        if path != "" {
            let fileURL:URL = URL(fileURLWithPath: path)
           // print(fileURL)
            let req = URLRequest(url: fileURL)
            self.webView.scalesPageToFit = false
            self.webView.scrollView.isScrollEnabled = false
            self.webView.loadRequest(req)
        }
        else {
            print("Object not found")
            //handle here if path not found
        }
        
        let button1 = createButton(x: 100, y: 100, w: 50, h: 20, r: 55, g: 55, b: 55, a: 1, ti: "button1")
        button1.addTarget(self, action: #selector(Constellation.submit(_:)), for: .touchUpInside)
        
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
