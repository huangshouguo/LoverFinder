# LoverFinder
这是本人学习iOS app开发第一个练手项目

最终效果图：   

主要学习了以下内容：    
1.  使用storyboard进行UI布局  
2.  storyboard制作的UI控件与ViewController进行关联   
3.  学会使用常用view    
  (1)  UILabel
  (2)  UITextField    
  (3)  UISegmentedControl   
  (4)  UISlider   
  (5)  UISwitch  
  (6)  UITextView  
4.  隐藏键盘
第一步，在UIViewController中UITextFieldDelegate接口中的textFieldShouldReturn方法
```` 
class ViewController: UIViewController,UITextFieldDelegate {
  ......
  //隐藏键盘
  func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
  }
}
```` 
第二步，注册UITextField控件的delegate
````  
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.name.delegate = self
}
````  

5.   由出生日期计算年龄
````  
let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
let now = NSDate.init()
let component = gregorian?.components(NSCalendarUnit.Year, fromDate: self.birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
let age = component?.year
let strAge = "\(age!)岁"
````  
