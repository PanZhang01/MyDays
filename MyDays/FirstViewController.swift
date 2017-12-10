//
//  FirstViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    @IBOutlet weak var TodayNavigationBar: UINavigationItem!
    var db :OpaquePointer? = nil
    func selectData() ->Int {
        var statement :OpaquePointer? = nil
        let sql = "SELECT * FROM task_data_table;" as NSString
        if sqlite3_prepare_v2(db, sql.utf8String, -1, &statement, nil)
            == SQLITE_OK{
            var count = 0
            while sqlite3_step(statement) == SQLITE_ROW{
                count = Int(sqlite3_column_int(statement, 0))
                let name = String(cString: sqlite3_column_text(statement, 1))
                print(sqlite3_column_int(statement, 0), name)
            }
            return count
        }
        return 0;
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
            insertData(title: "Buy egg")
            insertData(title: "Buy apple")
            print(selectData())
        } else {
            print("資料庫連線失敗")
            
        }
    }
    
    override func viewDidLoad() {
        print("Loaded")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        super.viewDidLoad()

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

