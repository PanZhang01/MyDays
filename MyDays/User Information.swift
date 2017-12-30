//
//  User Information.swift
//  MyDays
//
//  Created by Jack Zhang on 17/12/2017.
//  Copyright © 2017 Jack Zhang. All rights reserved.
//

import UIKit

class User_Information: UIViewController {
    
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    
    var HidePicker:UIButton = {
        let button = UIButton()
        return button
    }()
    
    let Picker:UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.backgroundColor = UIColor.white
        return picker
    }()
    
    let dformat:DateFormatter = {
        let dFormat = DateFormatter()
        dFormat.dateFormat = "MM.dd.YYYY"
        return dFormat
    }()
    
    let picker2: UIPickerView = {
     let picker1 = UIPickerView()
      //  picker1.numberOfComponents = 2
        picker1.showsSelectionIndicator = true
        return picker1
    }()
    
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
    
    //获取当前textField的内容
    func getTextFromField(textField:UITextField)->String{
        genderField.inputView = Picker
        let str = textField.text
        return str!
    }
    
   @objc func Dateinput(_ sender: Any) {
    //    dformat.dateFormat = "MM.dd.YYYY"
        HidePicker.isHidden = false
        dobField.inputView = Picker
        let datestr = dformat.string(from: Picker.date)
        dobField.text = datestr
    }
    
    @objc func ClicktoFinish(_ sender: Any) {
        let datestr = dformat.string(from: Picker.date)
        dobField.text = datestr
        dobField.resignFirstResponder()
        HidePicker.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        HidePicker.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dobField.addTarget(self, action: #selector(User_Information.Dateinput(_:)), for: .editingDidBegin)
        HidePicker = createButton(x: 30, y: 431, w: 50, h: 20, r: 55, g: 55, b: 55, a: 1, ti: "Finish")
        HidePicker.isHidden = true
        HidePicker.addTarget(self, action: #selector(User_Information.ClicktoFinish(_:)), for: .touchUpInside)
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
