//
//  Chinese Zodiac.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class Chinese_Zodiac: UIViewController {

    @IBOutlet weak var InputField: UITextField!
    @IBOutlet weak var LabelYear: UILabel!
    @IBOutlet weak var CalulateButton: UIButton!
    
    
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

    
    
    @IBAction func CalZodiac(_ sender: UIButton) {
        
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
