//
//  DateCal.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/12/1.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class DateCal: UIViewController {

    @IBOutlet weak var NumberText: UITextField!
    @IBOutlet weak var BAButton: UIButton!
    @IBOutlet weak var DateField: UITextField!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var CalButton: UIButton!
    
    let Picker = UIDatePicker(frame: CGRect(x:0, y:0, width:320, height:216))
    let dformat = DateFormatter()
    
    //将Datepicker里的内容输入到textfield里面
    func Dateinput() {
        dformat.dateFormat = "MM.dd.YYYY"
        let datestr = dformat.string(from: Picker.date)
  /*      let start = datestr.index(datestr.startIndex,offsetBy: 0)     //取得月份
        let end = datestr.index(datestr.startIndex, offsetBy: 2)
        let range = start..<end
        let mm = datestr[range]
        let start2 = datestr.index(datestr.startIndex, offsetBy: 3) //取得日子
        let end2 = datestr.index(datestr.endIndex, offsetBy:-5)
        let range2 = start2..<end2
        let dd = datestr[range2]
        //    print(mm)
        //    print(dd) */
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
    
    @IBAction func OnclickCal(_ sender: Any) {
        DateCalculation()
        Dateinput()
        NumberText.resignFirstResponder()
        DateField.resignFirstResponder()
    }
    
    @IBAction func SwitchButton(_ sender: Any) {
      //  print(BAButton.currentTitle)
        if(BAButton.currentTitle == "Before"){
            BAButton.setTitle("After", for: .normal)}
        else {BAButton.setTitle("Before", for: .normal)}
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
