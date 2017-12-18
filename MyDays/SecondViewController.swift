//
//  SecondViewController.swift
//  MyDays
//
//  Created by Jack Zhang on 2017/11/29.
//  Copyright © 2017年 Jack Zhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var dateCal: UIButton!
    @IBOutlet weak var constellation: UIButton!
    @IBOutlet weak var ChineseZodiac: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 175/255,blue: 226/255, alpha: 0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background7")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        dateCal.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 210/255, alpha: 1)
        dateCal.layer.cornerRadius = 5
        dateCal.layer.shadowColor = UIColor.lightGray.cgColor
        dateCal.layer.shadowOpacity = 0.8
        dateCal.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        constellation.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 210/255, alpha: 1)
        constellation.layer.cornerRadius = 5
        constellation.layer.shadowColor = UIColor.lightGray.cgColor
        constellation.layer.shadowOpacity = 0.8
        constellation.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        ChineseZodiac.backgroundColor = UIColor(red: 63/255, green: 160/255, blue: 210/255, alpha: 1)
        ChineseZodiac.layer.cornerRadius = 5
        ChineseZodiac.layer.shadowColor = UIColor.lightGray.cgColor
        ChineseZodiac.layer.shadowOpacity = 0.8
        ChineseZodiac.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

