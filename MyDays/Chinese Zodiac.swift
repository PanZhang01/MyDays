//
//  Chinese Zodiac.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class Chinese_Zodiac: UIViewController {

  //  @IBOutlet weak var InputField: UITextField!
  //  @IBOutlet weak var LabelYear: UILabel!
  //  @IBOutlet weak var CalulateButton: UIButton!
    
    var InputField = UITextField()
    var LabelYear = UILabel()
    var CalculateButton = UIButton()
    
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
    
    
    func calczodiac () {
        let Year = InputField.text
   //     print(Year)
        let i = Int(Year!)
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
            LabelYear.text = "Dragon Year"
        case 1:
            LabelYear.text = "Snake Year"
        case 2:
            LabelYear.text = "Horse Year"
        case 3:
            LabelYear.text = "Goat Year"
        case 4:
            LabelYear.text = "Monkey Year"
        case 5:
            LabelYear.text = "Rooster Year"
        case 6:
            LabelYear.text = "Dog Year"
        case 7:
            LabelYear.text = "Pig Year"
        case 8:
            LabelYear.text = "Rat Year"
        case 9:
            LabelYear.text = "Ox Year"
        case 10:
            LabelYear.text = "Tiger Year"
        case 11:
            LabelYear.text = "Rabbit Year"
        default:
            LabelYear.text = "The number of the year must be in digits!"
        }
     }
    }

    
    
    @objc func CalZodiac(_ sender: UIButton) {
        
        calczodiac()
        self.InputField.resignFirstResponder() //点击按钮划下键盘
    }

    
    
    //点击屏幕划下键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
       calczodiac()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let myNewView=UIView(frame: CGRect(x: 20, y: 100, width: 350, height: 300))
       
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background3")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
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
        
        InputField = createTextField(x: 100, y: 200, w: 150, h: 30, ti: "Input year here.")
        InputField.keyboardType = .numberPad
        
        LabelYear = createLabel(x: 150, y: 300, w: 200, h: 30, r: 0, g: 0, b: 0, a: 1, ti: "Year")
        
        CalculateButton = createButton(x: 250, y: 200, w: 120, h: 30, r: 0, g: 0, b: 0, a: 1, ti: "Calculate!")
        CalculateButton.addTarget(self, action: #selector(Chinese_Zodiac.CalZodiac(_:)), for: .touchUpInside)
        
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


