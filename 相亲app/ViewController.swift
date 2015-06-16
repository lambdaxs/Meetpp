//
//  ViewController.swift
//  相亲app
//
//  Created by xiaos on 15-5-22.
//  Copyright (c) 2015年 xiaos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var sexSwith: UISegmentedControl!
    @IBOutlet weak var dateView: UIDatePicker!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var hasHouse: UISwitch!
    @IBOutlet weak var resultText: UITextView!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        
        let h1 = hello()
        h1.sayhello()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func changeHeight(sender: AnyObject) {
        let slider = sender as! UISlider
        heightLabel.text = "\(Int(slider.value))cm"
    }
    //响应键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func getAge(dateView:UIDatePicker) -> AnyObject!{
        let calendarType = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let yearCha = calendarType?.components(NSCalendarUnit.CalendarUnitYear, fromDate: dateView.date, toDate: now, options: NSCalendarOptions(0))
        let age = yearCha?.year
        
        return age!
    }
    
    
    @IBAction func okTapped(sender: AnyObject) {
        
        println("tapped")
        
        let sexLabel = sexSwith.selectedSegmentIndex==0 ? "男" : "女"
        let hasHouseLabel = hasHouse.on ? "有房" : "没房"
        
//        let riLi = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//        let now = NSDate()
//        let yearCha = riLi?.components(NSCalendarUnit.YearCalendarUnit, fromDate: dateView.date, toDate: now, options: NSCalendarOptions(0))
//        let age = yearCha?.year
        let age: AnyObject = getAge(dateView)
        
        resultText.text = "\(nameField.text)，\(sexLabel),\(age)岁，\(heightLabel.text!)，\(hasHouseLabel)"
    }
    
    
    


}

