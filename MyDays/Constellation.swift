//
//  Constellation.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/30.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
// 667*375

import UIKit
import WebKit

class Constellation: UIViewController, WKUIDelegate {

  //  @IBOutlet weak var HidePicker: UIButton!
  //  @IBOutlet weak var webView: UIWebView!
    
    let Picker = UIDatePicker()
    var label1 = UILabel()
    var DateField1 = UITextField()
    var HidePicker = UIButton ()
    var isLabel = UILabel()
    
    var calButton = UIButton()
    
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
    
    func createLabel(x:Int,y:Int,w:Int,h:Int,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,ti:String)->UILabel
        {
            let xAxis = x, yAxis = y, vWidth = w, vHeight = h
            let vRed:CGFloat = r, vGreen:CGFloat = g, vBlue:CGFloat = b, vAlpha:CGFloat = a
            let Title = ti
            let label = UILabel(frame: CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
            label.text = Title
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 18.0)
            label.textColor = UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha)
            label.shadowColor=UIColor.gray//设置阴影颜色
            label.layer.shadowOffset = CGSize(width: -2, height: -2)
            self.view.addSubview(label)
            return label
        }
    
    func createTextField(x:Int,y:Int,w:Int,h:Int,ti:String) -> UITextField
        {
            let xAxis = x, yAxis = y, vWidth = w, vHeight = h
            let textField = UITextField(frame: CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
    
            /* 边框样式 */
            textField.borderStyle = UITextBorderStyle.roundedRect //圆角矩形边框
            //        textField.borderStyle = UITextBorderStyle.None //无边框
            //        textField.borderStyle = UITextBorderStyle.Line //直线边框
            //        textField.borderStyle = UITextBorderStyle.Bezel //边线 + 阴影
    
            /* 提示文字 */
            let Title = ti
            textField.placeholder = Title
            textField.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
            textField.minimumFontSize = 14                  //最小可缩小的字号
    
            /** 水平对齐 **/
            //        textField.textAlignment = .Right  //水平右对齐
            //        textField.textAlignment = .Center //水平居中对齐
            textField.textAlignment = .left     //水平左对齐
    
            /** 垂直对齐 **/
            //        textField.contentVerticalAlignment = .Top     //垂直向上对齐
                 textField.contentVerticalAlignment = .center  //垂直居中对齐
           // textField.contentVerticalAlignment = .bottom    //垂直向下对齐
    
            /* 清除按钮（输入框内右侧小叉）*/
            //textField.clearButtonMode=UITextFieldViewMode.whileEditing  //编辑时出现清除按钮
            //        textField.clearButtonMode=UITextFieldViewMode.UnlessEditing  //编辑时不出现，编辑后才出现清除按钮
            //        textField.clearButtonMode=UITextFieldViewMode.Always  //一直显示清除按钮
    
            //textField.becomeFirstResponder()//使文本框在界面打开时就获取焦点，并弹出输入键盘
    
            /* 设置键盘return键的样式 */
            //textField.returnKeyType = UIReturnKeyType.done //表示完成输入
            //        textField.returnKeyType = UIReturnKeyType.Go //表示完成输入，同时会跳到另一页
            //        textField.returnKeyType = UIReturnKeyType.Search //表示搜索
            //        textField.returnKeyType = UIReturnKeyType.Join //表示注册用户或添加数据
            //        textField.returnKeyType = UIReturnKeyType.Next //表示继续下一步
            //        textField.returnKeyType = UIReturnKeyType.Send //表示发送
    
           // textField.delegate = self as! UITextFieldDelegate //注意看上边引用UITextFieldDelegate的方法是用“,”分隔，而不是用"<>"
    
            self.view.addSubview(textField)
            return textField
        }
    
    @objc func submit(_ sender:UIButton) {
       // print("submitted")
        Dateinput()
    }
    
    //点击按钮隐藏Datepicker
    @objc func HidePick(_ sender: Any) {
       // print("HidePick")
    DateField1.resignFirstResponder()
    Dateinput()
    HidePicker.isHidden = true
    }
    
    //点击按钮计算星座
    @objc func ClickToCal(_ sender: Any) {
        Dateinput()
        DateField1.resignFirstResponder()
        HidePicker.isHidden = true
    }
    
    
    //将Datepicker里的内容输入到textfield里面
    func Dateinput() {
        //print("DateInput")
        let dformat = DateFormatter()
        dformat.dateFormat = "MM.dd.YYYY"
        Picker.datePickerMode = UIDatePickerMode.date
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
        DateField1.text = datestr
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
      label1.text = result
    }
    
    
    //点击屏幕划下键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        HidePicker.isHidden = true
        Dateinput()
    }
    
    @objc func showPicker(_ sender:Any){
        DateField1.inputView = Picker
      //  print("showPicker")
        HidePicker.isHidden = false
        Picker.isHidden = false
        Picker.datePickerMode = .date
        Picker.backgroundColor = UIColor.white
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
    
        
//        let path = Bundle.main.path(forResource: "rect1", ofType: "svg")!
//        if path != "" {
//            let fileURL:URL = URL(fileURLWithPath: path)
//           // print(fileURL)
//            let req = URLRequest(url: fileURL)
//            self.webView.scalesPageToFit = false
//            self.webView.scrollView.isScrollEnabled = false
//            self.webView.loadRequest(req)
//        }
//        else {
//            print("Object not found")
//            //handle here if path not found
//        }
        
        
        HidePicker = createButton(x: 30, y: 431, w: 50, h: 20, r: 55, g: 55, b: 55, a: 1, ti: "Hide")
        HidePicker.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.addSubview(HidePicker)
        HidePicker.isHidden = true
        HidePicker.addTarget(self, action: #selector(Constellation.HidePick(_:)), for: .touchUpInside)
        calButton = createButton(x: 87, y: 398, w: 200, h: 35, r: 55, g: 70, b: 112, a: 1, ti: "Calculate!")
        calButton.setTitleColor(UIColor.white, for: .normal)
        calButton.backgroundColor = UIColor(red: 154/255, green: 118/255, blue: 157/255, alpha: 1)
        calButton.layer.cornerRadius = 5
        calButton.layer.shadowColor = UIColor.lightGray.cgColor
        calButton.layer.shadowOpacity = 0.8
        calButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        calButton.addTarget(self, action: #selector(Constellation.ClickToCal(_:)), for: .touchUpInside)
        
        isLabel = createLabel(x: 267, y: 248, w: 40, h: 40, r: 255, g: 255, b: 255, a: 1, ti: "is")
        isLabel.font = .systemFont(ofSize: 24.0)
        
        label1 = createLabel(x: 107, y: 328, w: 160, h: 30, r: 255, g: 255, b: 255, a: 1, ti: "Constellation")
        label1.font = .systemFont(ofSize: 26.0)
        DateField1 = createTextField(x: 47, y: 251, w: 180, h: 35, ti: "Please pick a date.")
        DateField1.addTarget(self, action: #selector(Constellation.showPicker(_:)), for: .editingDidBegin)
        let myNewView=UIView(frame: CGRect(x: 12, y: 183, width: 350, height: 300))
        
        // Change UIView background colour
        myNewView.backgroundColor=UIColor(red: 200/255, green: 161/255, blue: 187/255, alpha: 0.6)
        
        // Add rounded corners to UIView
        myNewView.layer.cornerRadius=25
        
        // Add border to UIView
        myNewView.layer.borderWidth=2
        
        // Change UIView Border Color to Red
        myNewView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Add UIView as a Subview
        self.view.addSubview(myNewView)
        self.view.sendSubview(toBack: myNewView)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background2")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
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
