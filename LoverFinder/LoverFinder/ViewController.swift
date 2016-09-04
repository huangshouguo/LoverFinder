//
//  ViewController.swift
//  LoverFinder
//
//  Created by miboy on 9/4/16.
//  Copyright © 2016 hsg. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //隐藏键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let value = Int(slider.value)
        self.heightValue.text = "\(value)厘米";
        self.height.value = Float(value)
    }

    
    @IBAction func onSubmit(sender: AnyObject) {
        let strName = "\(self.name.text!)"
        
        let strGender = self.gender.selectedSegmentIndex == 0 ? "高富帅":"白富美"
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate.init()
        let component = gregorian?.components(NSCalendarUnit.Year, fromDate: self.birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
        let age = component?.year
        let strAge = "\(age!)岁"
        
        let strHeight = "身高\(self.heightValue.text!)"
        
        let strHasProperty = self.hasProperty.on ? "有房":"没房"
        
        self.result.text = "\(strName), \(strGender), \(strAge), \(strHeight), \(strHasProperty), 求交往！"
    }
}

