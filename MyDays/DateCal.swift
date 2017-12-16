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
        
        /** Vertical alignment **/
        //        textField.contentVerticalAlignment = .Top     //Vertical upwards alignment
        //        textField.contentVerticalAlignment = .Center  //align vertical center
        textField.contentVerticalAlignment = .bottom    //Vertical downward alignment
        
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
    
    
    //Click on the screen to hide the keyboard
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

