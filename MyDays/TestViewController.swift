//
//  TestViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 10/12/2017.
//  Copyright © 2017 Jack Zhang. All rights reserved.
//

import UIKit

class TestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var toDoList: UITableView!
    


    var listofpeople = ["佳哥","奥卢","最帅"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(listofpeople.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDoList")
        cell.textLabel?.text = listofpeople[indexPath.row]
        return (cell)
    }
   

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete {
            listofpeople.remove(at: indexPath.row)
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
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickbutton(sender:))), animated: true)
        
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
