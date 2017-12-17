//
//  FirstViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TodayNavigationBar: UINavigationItem!
    @IBOutlet weak var toDoList: UITableView!
    
    var listofpeople = ["佳哥","奥卢","最帅"]
    
    var db :OpaquePointer? = nil
    func getCount() ->Int {
        var statement :OpaquePointer? = nil
        let sql = "SELECT * FROM task_data_table;" as NSString
        if sqlite3_prepare_v2(db, sql.utf8String, -1, &statement, nil)
            == SQLITE_OK{
            var count = 0
            while sqlite3_step(statement) == SQLITE_ROW{
                count += 1
            }
            return count
        }
        return 0;
    }
    
    func dropRow(title: String) {
        var statement :OpaquePointer? = nil
        let sql = "delete from task_data_table where title = \"" + title + "\";"
        print(sql)
        if sqlite3_prepare_v2(db, (sql as NSString).utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Delete successful")
            }
        }
        sqlite3_finalize(statement)
    }
    
    func getEvents() -> [ String] {
        var events = [String]()
        var statement :OpaquePointer? = nil
        let sql = "SELECT * FROM task_data_table;" as NSString
        if sqlite3_prepare_v2(db, sql.utf8String, -1, &statement, nil)
            == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW{
                let name = String(cString: sqlite3_column_text(statement, 1))
                events.append(name)
            }
        }
        return events;
    }
    
    func insertData(title: String) {
        var statement :OpaquePointer? = nil
        let sql = "insert into task_data_table "
            + "(title) "
            + "values ('" + title + "');" as NSString
        if sqlite3_prepare_v2(
            db, sql.utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("新增資料成功")
            }
            sqlite3_finalize(statement)
        }
    }
    
    func createTaskTable() {
        let sql = "create table if not exists task_data_table "
            + "( id integer primary key autoincrement, "
            + "title text, date DEFAULT CURRENT_TIMESTAMP, finished INTEGER DEFAULT 0);" as NSString
        
        if sqlite3_exec(db, sql.utf8String, nil, nil, nil)
            == SQLITE_OK{
            print("建立資料表成功")
        }
        else {
            print("table create error")
        }
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
            createTaskTable()
//            insertData(title: "Buy egg")
//            insertData(title: "Buy apple")
            print(getCount())
        } else {
            print("資料庫連線失敗")
            
        }
    }
    
    
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.getCount())
        return(self.getCount())
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventlist = getEvents()
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDoList")
        cell.textLabel?.text = eventlist[indexPath.row]
        return (cell)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        let eventlist = getEvents()
        if editingStyle == UITableViewCellEditingStyle.delete {
            let title = eventlist[indexPath.row]
            self.dropRow(title: title)
            toDoList.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoList.reloadData()
    }
    
    func noTextInput(){
        let noTextAlert = UIAlertController(title: "Notice!",
                                            message: "Please input your event!",
                                            preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "OK", style: .default) {
            (_) in
            self.addNewItem()
        }
        noTextAlert.addAction(okayAction)
        self.present(noTextAlert, animated: true, completion: nil)
        
    }
    
    
    func addNewItem() {
        //     print("按下按钮1")
        var newItem = UITextField()
        
        let alertController = UIAlertController(
            title: "Add A New Item",
            message: "Please input a new event.",
            preferredStyle: UIAlertControllerStyle.alert)
        
        let addAction = UIAlertAction(
        title: "Add", style: UIAlertActionStyle.default) {
            (_) in
            
            if ((newItem.text) != "") {
                //     print(newItem.text)
                self.insertData(title: newItem.text!)
                self.listofpeople.append(newItem.text!)
                self.toDoList.reloadData()
            } else {
                //     print("没有内容")
                self.noTextInput()
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField {
            (txtEvent) -> Void in
            newItem = txtEvent
            newItem.placeholder = "Your new event here"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    @objc func clickbutton(sender: UIBarButtonItem){
        //    print("按下按钮2")
        addNewItem()
    }
    
    override func viewDidLoad() {
        print("Loaded")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickbutton(sender:))), animated: true)

        super.viewDidLoad()
        
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

