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
        
        // textField.delegate = self as! UITextFieldDelegate //Look at the above cited UITextFieldDelegate method is   sepersted by using ","  rather than "< >"
        
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
        self.InputField.resignFirstResponder() //Click on the button to hide the keyboard

    }

    
    
    //Click on the screen to hide the keyboard
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


