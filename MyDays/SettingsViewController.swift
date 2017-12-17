//
//  SettingsViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

let Profile = ["Edit User Information"]

let More = [
    ("Help"),
    ("About"),
]


class SettingsViewController: UIViewController,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return Profile.count
        }
        else {
            return More.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0{
            let EditUserInformation = Profile[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.textLabel?.text = EditUserInformation
        }
        else {
            let more = More[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.textLabel?.text = More[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Profile"
        }else{
            return "More"
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
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
