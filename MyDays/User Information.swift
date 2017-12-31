//
//  User Information.swift
//  MyDays
//
//  Created by Jack Zhang on 17/12/2017.
//  Copyright © 2017 Jack Zhang. All rights reserved.
//

import UIKit

class User_Information: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    
    var db :OpaquePointer? = nil
    
    var SubmitButton = UIButton()
    
    
    
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
    
    
    func clearDB() {
        var statement :OpaquePointer? = nil
        let sql = "delete from user_information;"
        print(sql)
        if sqlite3_prepare_v2(db, (sql as NSString).utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Delete successful")
            }
        }
        sqlite3_finalize(statement)
    }
    
    func insertData(firstName: String, lastName: String, gender: String, dob: String) {
        var statement :OpaquePointer? = nil
        let st = "insert into user_information "
            + "(first_name, last_name, gender, dob) " + "values ('" + firstName + "', '" + lastName + "', '" + gender + "', '" + dob + "');"
        let sql = st as NSString
        print(sql)
        if sqlite3_prepare_v2(
            db, sql.utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("新增資料成功")
            }
            sqlite3_finalize(statement)
        }
    }
    
    func createTable() {
        let sql = "create table if not exists user_information "
            + "( id integer primary key autoincrement, "
            + "first_name text, last_name text, gender text, dob text);" as NSString
        
        if sqlite3_exec(db, sql.utf8String, nil, nil, nil)
            == SQLITE_OK{
            print("建立資料表成功")
        }
        else {
            print("table create error")
        }
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
    
    //获取当前textField的内容
    func getTextFromField(textField:UITextField)->String{
        genderField.inputView = Picker
        let str = textField.text
        return str!
    }
    
    
   @objc func Dateinput(_ sender: Any) {
        dformat.dateFormat = "MM.dd.YYYY"
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
    
    @objc func submit(_ sender: Any) {
        let f_name = getTextFromField(textField: firstNameField)
        let l_name = getTextFromField(textField: lastNameField)
        let gender = getTextFromField(textField: genderField)
        let dob = getTextFromField(textField: dobField)
        clearDB()
        insertData(firstName: f_name, lastName: l_name, gender: gender, dob: dob)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  self.view.endEditing(true)
        let datestr = dformat.string(from: Picker.date)
        dobField.text = datestr
        dobField.resignFirstResponder()
        HidePicker.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let urls = FileManager.default
            .urls(
                for: .documentDirectory,
                in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString
            + "sqlite3.db"
        print(sqlitePath)
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK {
            print("資料庫連線成功")
            clearDB()
            createTable()
        } else {
            print("資料庫連線失敗")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dobField.addTarget(self, action: #selector(User_Information.Dateinput(_:)), for: .editingDidBegin)
        HidePicker = createButton(x: 30, y: 431, w: 50, h: 20, r: 55, g: 55, b: 55, a: 1, ti: "Finish")
        HidePicker.isHidden = true
        HidePicker.addTarget(self, action: #selector(User_Information.ClicktoFinish(_:)), for: .touchUpInside)
        
        createTable()
        
        SubmitButton = createButton(x: 87, y: 538, w: 200, h: 35, r: 55, g: 70, b: 112, a: 1, ti: "Save")
        SubmitButton.setTitleColor(UIColor.white, for: .normal)
        SubmitButton.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 210/255, alpha: 1)
        SubmitButton.layer.cornerRadius = 5
        SubmitButton.layer.shadowColor = UIColor.lightGray.cgColor
        SubmitButton.layer.shadowOpacity = 0.8
        SubmitButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        SubmitButton.addTarget(self, action: #selector(User_Information.submit(_:)), for: .touchUpInside)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background6")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

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
