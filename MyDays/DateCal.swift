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
        
        /* Border style */
        textField.borderStyle = UITextBorderStyle.roundedRect //Rounded rectangle border
        //        textField.borderStyle = UITextBorderStyle.None //No border
        //        textField.borderStyle = UITextBorderStyle.Line //Straight line border
        //        textField.borderStyle = UITextBorderStyle.Bezel //side boundary + shadow
        /* Hint text */
        let Title = ti
        textField.placeholder = Title
        textField.adjustsFontSizeToFitWidth=true  //Automatically resize text when text exceeds text box width
        textField.minimumFontSize = 14                  //The smallest size that can be reduced
        
        /** Horizontal alignment **/
        //        textField.textAlignment = .Right  //align horizontal right
        //        textField.textAlignment = .Center //align horizontal center
        textField.textAlignment = .left     //align horizontal left
        
        /** 垂直对齐 **/
        //        textField.contentVerticalAlignment = .Top     //垂直向上对齐
                textField.contentVerticalAlignment = .center  //垂直居中对齐
        //textField.contentVerticalAlignment = .bottom    //垂直向下对齐
        
        /* Clear button（A small fork on the right input box）*/
        //textField.clearButtonMode=UITextFieldViewMode.whileEditing  //Clear buttons appear when editing
        //        textField.clearButtonMode=UITextFieldViewMode.UnlessEditing  //Clear button did not appear when    editing，but appear after editing
        //        textField.clearButtonMode=UITextFieldViewMode.Always  //Always display the clear button
        
        //textField.becomeFirstResponder()//Make the text box get the focus point when the interface is open and pop up the input keyboard
        
        /* Setting the style of return */
        //textField.returnKeyType = UIReturnKeyType.done //Complete input
        //        textField.returnKeyType = UIReturnKeyType.Go //Represents the completion of the input and will jump to the other page
        //        textField.returnKeyType = UIReturnKeyType.Search //Search
        //        textField.returnKeyType = UIReturnKeyType.Join //Representing a registered user or adding data
        //        textField.returnKeyType = UIReturnKeyType.Next //Continue to the next step
        //        textField.returnKeyType = UIReturnKeyType.Send //Send
        
        // textField.delegate = self as! UITextFieldDelegate //Look at the above cited UITextFieldDelegate method is sepersted by using ","  rather than "< >"
        
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
        label.font = .systemFont(ofSize: 24.0)
        label.textColor = UIColor(red: vRed/255, green: vGreen/255, blue: vBlue/255, alpha: vAlpha)
        label.shadowColor=UIColor.gray//设置阴影颜色
        label.layer.shadowOffset = CGSize(width: -2, height: -2)
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
    
    //print the content of Datepicker into textfield
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
    
    //Click on the screen to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        Dateinput()
    }
    
    //获取屏幕宽度
//    func getTrueLength(isWidth:Bool)->CGFloat{
//
//        var myRect:CGRect = UIScreen.main.bounds;
//
//        //得到系统的版本号
//        var myDeviceVersion:Float = (UIDevice.current.systemVersion as NSString).floatValue
//
//        var length:CGFloat = 0.0
//
//        //如果版本号小于8.0，而且是横屏的话
//        if(myDeviceVersion < 8.0&&(self.interfaceOrientation == UIInterfaceOrientation.landscapeLeft||self.interfaceOrientation == UIInterfaceOrientation.landscapeRight)){
//
//            if(isWidth){
//                length = myRect.size.height
//            }else{
//                length = myRect.size.width
//            }
//        }
//        else{
//
//            if(isWidth){
//                length = myRect.size.width
//            }
//            else{
//                length = myRect.size.height
//            }
//
//        }
//
//        return length;
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        DateField.inputView = Picker
        Picker.datePickerMode = .date
        Picker.backgroundColor = UIColor.white
        let myNewView=UIView(frame: CGRect(x: 12, y: 183, width: 350, height: 300))
        
        // Change UIView background colour
        myNewView.backgroundColor=UIColor(red: 165/255, green: 185/255, blue: 200/255, alpha: 0.7)
        
        // Add rounded corners to UIView
        myNewView.layer.cornerRadius=25
        
        // Add border to UIView
        myNewView.layer.borderWidth=1
        
        // Change UIView Border Color to Red
        myNewView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Add UIView as a Subview
        self.view.addSubview(myNewView)
        self.view.sendSubview(toBack: myNewView)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background1")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
       
        dayLabel = createLabel(x: 225, y: 230, w: 60, h: 25, r: 255, g: 255, b: 255, a: 1, ti: "Days")
        isLabel = createLabel(x: 90, y: 350, w: 50, h: 20, r: 255, g: 255, b: 255, a: 1, ti: "is")
        DateLabel = createLabel(x: 160, y: 350, w: 155, h: 23, r: 255, g: 255, b: 255, a: 1, ti: "DD.MM.YYYY")
        CalButton = createButton(x: 87, y: 398, w: 200, h: 35, r: 55, g: 70, b: 112, a: 1, ti: "Calculate!")
        CalButton.setTitleColor(UIColor.white, for: .normal)
        CalButton.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 240/255, alpha: 0.7)
        CalButton.layer.cornerRadius = 5
        CalButton.layer.shadowColor = UIColor.lightGray.cgColor
        CalButton.layer.shadowOpacity = 0.8
        CalButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        CalButton.addTarget(self, action: #selector(DateCal.OnclickCal(_:)), for: .touchUpInside)
        NumberText = createTextField(x: 65, y: 230, w: 105, h: 33, ti: "How many")
        DateField = createTextField(x: 195, y: 295, w: 120, h: 33, ti: "DD.MM.YYYY")
        DateField.addTarget(self, action: #selector(DateCal.showPicker(_:)), for: .editingDidBegin)
        BAButton = createButton(x: 70, y: 295, w: 75, h: 33, r: 30, g: 100, b: 255, a: 1, ti: "Before")
        BAButton.setTitleColor(UIColor.white, for: .normal)
        BAButton.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 240/255, alpha: 0.9)
        BAButton.layer.cornerRadius = 5
        BAButton.layer.shadowColor = UIColor.lightGray.cgColor
        BAButton.layer.shadowOpacity = 0.8
        BAButton.layer.shadowOffset = CGSize(width: 2, height: 2)

        BAButton.addTarget(self, action: #selector(DateCal.SwitchButton(_:)), for: .touchUpInside)
        
//        var width:CGFloat = getTrueLength(isWidth: true)
//        print("宽度是\(width)")
//
//        //得到高度
//        var height:CGFloat = getTrueLength(isWidth: false)
//        print("高度是\(height)")
        
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

