//
//  DateCal.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/12/1.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class DateCal: UIViewController {

  //  @IBOutlet weak var NumberText: UITextField!
 //   @IBOutlet weak var BAButton: UIButton!
  //  @IBOutlet weak var DateField: UITextField!
 //   @IBOutlet weak var DateLabel: UILabel!
 //  @IBOutlet weak var CalButton: UIButton!
    
    let Picker = UIDatePicker(frame: CGRect(x:0, y:0, width:320, height:216))
    let dformat = DateFormatter()
    var dayLabel = UILabel()
    var isLabel = UILabel()
    var DateLabel = UILabel()
    var CalButton = UIButton()
    var NumberText = UITextField()
    var DateField = UITextField()
    var BAButton = UIButton()

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
        //        textField.contentVerticalAlignment = .Center  //垂直居中对齐
        textField.contentVerticalAlignment = .bottom    //垂直向下对齐
        
        /* 清除按钮（输入框内右侧小叉）*/
        textField.clearButtonMode=UITextFieldViewMode.whileEditing  //编辑时出现清除按钮
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
    
    func createLabel(x:Int,y:Int,w:Int,h:Int,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,ti:String) -> UILabel
    {
        let xAxis = x, yAxis = y, vWidth = w, vHeight = h
        let vRed:CGFloat = r, vGreen:CGFloat = g, vBlue:CGFloat = b, vAlpha:CGFloat = a
        let Title = ti
        let label = UILabel(frame: CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
        label.text = Title
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18.0)
        label.textColor = UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha)
        self.view.addSubview(label)
        return label
    }
    
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
    
    //将Datepicker里的内容输入到textfield里面
    func Dateinput() {
        dformat.dateFormat = "MM.dd.YYYY"
        let datestr = dformat.string(from: Picker.date)
        DateField.text = datestr
    }
    
    func DateCalculation(){
        dformat.dateFormat = "MM.dd.YYYY"
     //   let datestr = dformat.string(from: Picker.date)
      //  print(datestr)
     //   let inputdate = dformat.date(from: datestr)
     //   print(dformat.string(from: inputdate!))
        let number = Double(NumberText.text!)
        let number2:Double
        if (number == nil){}
        else{
          if (BAButton.currentTitle == "After")
          {number2 = number!}
          else{number2 = number! * -1}
            let date = NSDate(timeInterval: TimeInterval(number2*86400), since: Picker.date)
     //   print(dformat.string(from: date as Date))
        DateLabel.text = dformat.string(from: date as Date)
            
        }
    }
    
    @objc func OnclickCal(_ sender: Any) {
        DateCalculation()
        Dateinput()
        NumberText.resignFirstResponder()
        DateField.resignFirstResponder()
    }
    
    @objc func SwitchButton(_ sender: Any) {
      //  print(BAButton.currentTitle)
        if(BAButton.currentTitle == "Before"){
            BAButton.setTitle("After", for: .normal)}
        else {BAButton.setTitle("Before", for: .normal)}
    }
    
    @objc func showPicker(_ sender: Any) {
        DateField.inputView = Picker
        Picker.isHidden = false
    }
    
    //点击屏幕划下键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        Dateinput()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        DateField.inputView = Picker
        Picker.datePickerMode = .date
        Picker.backgroundColor = UIColor.white
        let myNewView=UIView(frame: CGRect(x: 20, y: 100, width: 350, height: 300))
        
        // Change UIView background colour
        myNewView.backgroundColor=UIColor.lightGray
        
        // Add rounded corners to UIView
        myNewView.layer.cornerRadius=25
        
        // Add border to UIView
        myNewView.layer.borderWidth=2
        
        // Change UIView Border Color to Red
        myNewView.layer.borderColor = UIColor.red.cgColor
        
        // Add UIView as a Subview
        self.view.addSubview(myNewView)
        self.view.sendSubview(toBack: myNewView)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background1")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
       
        dayLabel = createLabel(x: 230, y: 200, w: 60, h: 20, r: 0, g: 0, b: 0, a: 1, ti: "Days")
        isLabel = createLabel(x: 100, y: 300, w: 50, h: 20, r: 0, g: 0, b: 0, a: 1, ti: "is")
        DateLabel = createLabel(x: 200, y: 300, w: 115, h: 20, r: 0, g: 0, b: 0, a: 1, ti: "DD.MM.YYYY")
        CalButton = createButton(x: 140, y: 350, w: 100, h: 20, r: 30, g: 111, b: 255, a: 1, ti: "Calculate!")
        CalButton.addTarget(self, action: #selector(DateCal.OnclickCal(_:)), for: .touchUpInside)
        NumberText = createTextField(x: 70, y: 200, w: 100, h: 30, ti: "How many")
        DateField = createTextField(x: 200, y: 250, w: 115, h: 30, ti: "DD.MM.YYYY")
        DateField.addTarget(self, action: #selector(DateCal.showPicker(_:)), for: .editingDidBegin)
        BAButton = createButton(x: 100, y: 250, w: 80, h: 20, r: 30, g: 111, b: 255, a: 1, ti: "Before")
        BAButton.addTarget(self, action: #selector(DateCal.SwitchButton(_:)), for: .touchUpInside)
        
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

//    func createButton(x:Int,y:Int,w:Int,h:Int,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,ti:String) -> UIButton{
//        let xAxis = x, yAxis = y, vWidth = w, vHeight = h
//        let vRed:CGFloat = r, vGreen:CGFloat = g, vBlue:CGFloat = b, vAlpha:CGFloat = a
//        let Title = ti
//        let Button = UIButton(frame:CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
//        Button.setTitle(Title, for:.normal)
//        Button.setTitleColor(UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha), for: .normal)
//        self.view.addSubview(Button)
//        return Button
//    }
//
//    func createLabel(x:Int,y:Int,w:Int,h:Int,r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat,ti:String)
//    {
//        let xAxis = x, yAxis = y, vWidth = w, vHeight = h
//        let vRed:CGFloat = r, vGreen:CGFloat = g, vBlue:CGFloat = b, vAlpha:CGFloat = a
//        let Title = ti
//        let label = UILabel(frame: CGRect(x:xAxis, y:yAxis, width:vWidth, height:vHeight))
//        label.text = Title
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 18.0)
//        label.textColor = UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha)
//        self.view.addSubview(label)
//    }
//
//    func createTextField()
//    {
//        let textField = UITextField(frame: CGRect(x: 100.0,y: 100.0,width: 200.0,height: 44.0))
//
//        /* 边框样式 */
//        textField.borderStyle = UITextBorderStyle.roundedRect //圆角矩形边框
//        //        textField.borderStyle = UITextBorderStyle.None //无边框
//        //        textField.borderStyle = UITextBorderStyle.Line //直线边框
//        //        textField.borderStyle = UITextBorderStyle.Bezel //边线 + 阴影
//
//        /* 提示文字 */
//        textField.placeholder = "placeholder"
//        textField.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
//        textField.minimumFontSize = 14                  //最小可缩小的字号
//
//        /** 水平对齐 **/
//        //        textField.textAlignment = .Right  //水平右对齐
//        //        textField.textAlignment = .Center //水平居中对齐
//        textField.textAlignment = .left     //水平左对齐
//
//        /** 垂直对齐 **/
//        //        textField.contentVerticalAlignment = .Top     //垂直向上对齐
//        //        textField.contentVerticalAlignment = .Center  //垂直居中对齐
//        textField.contentVerticalAlignment = .bottom    //垂直向下对齐
//
//        /* 清除按钮（输入框内右侧小叉）*/
//        textField.clearButtonMode=UITextFieldViewMode.whileEditing  //编辑时出现清除按钮
//        //        textField.clearButtonMode=UITextFieldViewMode.UnlessEditing  //编辑时不出现，编辑后才出现清除按钮
//        //        textField.clearButtonMode=UITextFieldViewMode.Always  //一直显示清除按钮
//
//        textField.becomeFirstResponder()//使文本框在界面打开时就获取焦点，并弹出输入键盘
//
//        /* 设置键盘return键的样式 */
//        textField.returnKeyType = UIReturnKeyType.done //表示完成输入
//        //        textField.returnKeyType = UIReturnKeyType.Go //表示完成输入，同时会跳到另一页
//        //        textField.returnKeyType = UIReturnKeyType.Search //表示搜索
//        //        textField.returnKeyType = UIReturnKeyType.Join //表示注册用户或添加数据
//        //        textField.returnKeyType = UIReturnKeyType.Next //表示继续下一步
//        //        textField.returnKeyType = UIReturnKeyType.Send //表示发送
//
//       // textField.delegate = self as! UITextFieldDelegate //注意看上边引用UITextFieldDelegate的方法是用“,”分隔，而不是用"<>"
//
//        self.view.addSubview(textField)
//    }

