

import UIKit

var classDict = ["aPeriod": "", "bPeriod": "", "cPeriod": "", "dPeriod": "", "ePeriod": "", "fPeriod": "", "monXPeriod": "", "tuesXPeriod": "", "wednesXPeriod": "", "thursXPeriod": "", "friXPeriod": "", "sport": ""]

var classArray = ["", "", "", "", "", "", "", "", ""]

class SecondViewController: UIViewController {
    
    var weekday = 0
    
    func updateArray() {
        
        var DateInFormat:String = ""
        
        var todaysDate:NSDate = NSDate()
        
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        DateInFormat = dateFormatter.stringFromDate(todaysDate)
        
        func getDayOfWeek(today:String)->Int? {
            
            let formatter  = NSDateFormatter()
            
            formatter.dateFormat = "yyyy-MM-dd"
            
            if let todayDate = formatter.dateFromString(today) {
                
                let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
                
                let myComponents = myCalendar.components(.CalendarUnitWeekday, fromDate: todayDate)
                
                let weekDay = myComponents.weekday
                
                return weekDay
                
            } else {
                
                return nil
                
            }
            
        }
        
        
        weekday = getDayOfWeek(DateInFormat)!
        
        println(classArray)
        
        println(classDict)
        
        println(weekday)
        
        if weekday == 2 || weekday == 7 || weekday == 1 || weekday == 0 {
            
            classArray.removeAll(keepCapacity: false)
            
            classArray.append(classDict["monXPeriod"]!)
            
            classArray.append(classDict["aPeriod"]!)
            
            classArray.append(classDict["bPeriod"]!)
            
            classArray.append("Morning Meeting")
            
            classArray.append(classDict["cPeriod"]!)
            
            classArray.append(classDict["dPeriod"]!)
            
            classArray.append("Lunch")
            
            classArray.append(classDict["ePeriod"]!)
            
            classArray.append(classDict["fPeriod"]!)
            
            classArray.append(classDict["sport"]!)
            
        } else if weekday == 3 {
            
            classArray.removeAll(keepCapacity: false)
            
            classArray.append("M Period")
            
            classArray.append(classDict["aPeriod"]!)
            
            classArray.append("Advisee")
            
            classArray.append(classDict["cPeriod"]!)
            
            classArray.append(classDict["monXPeriod"]!)
            
            classArray.append("Lunch")
            
            classArray.append(classDict["fPeriod"]!)
            
        } else if weekday == 4 {
            
            classArray.removeAll(keepCapacity: false)
            
            classArray.append(classDict["aPeriod"]!)
            
            classArray.append(classDict["dPeriod"]!)
            
            classArray.append("MM")
            
            classArray.append(classDict["ePeriod"]!)
            
            classArray.append(classDict["tuesXPeriod"]!)
            
            classArray.append("Lunch")
            
            classArray.append(classDict["fPeriod"]!)
            
        } else if weekday == 5 {
            
            classArray.removeAll(keepCapacity: false)
            
            classArray.append(classDict["dPeriod"]!)
            
            classArray.append(classDict["aPeriod"]!)
            
            classArray.append("Advisee")
            
            classArray.append(classDict["fPeriod"]!)
            
            classArray.append(classDict["cPeriod"]!)
            
            classArray.append(classDict["wednesXPeriod"]!)
            
            classArray.append("Lunch")
            
            classArray.append(classDict["bPeriod"]!)
            
            classArray.append(classDict["ePeriod"]!)
            
        } else if weekday == 6 {
            
            classArray.append(classDict["bPeriod"]!)
            
            classArray.append(classDict["fPeriod"]!)
            
            classArray.append("Assembly")
            
            classArray.append(classDict["ePeriod"]!)
            
            classArray.append(classDict["friXPeriod"]!)
            
            classArray.append("Lunch")
            
            classArray.append(classDict["cPeriod"]!)
            
            classArray.append(classDict["dPeriod"]!)
            
        }
        
        defaults.setObject(classDict, forKey: "storedClassDict")
        
        defaults.setObject(classArray, forKey: "storedClassArray")
        
        println("stored dictionary", defaults.objectForKey("storedClassDict"))
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func updateClasses(className:String) {
        
        classDict[className] = field.text
        
        field.text = ""
        
        updateArray()
        
    }
    
    @IBOutlet var field: UITextField!
    
    @IBAction func aPeriodButton(sender: UIButton) {
        
        updateClasses("aPeriod")
        
    }
    
    @IBAction func bPeriodButton(sender: UIButton) {
        
        updateClasses("bPeriod")
        
    }
    
    @IBAction func cPeriodButton(sender: UIButton) {
        
        updateClasses("cPeriod")
        
    }
    
    @IBAction func dPeriodButton(sender: UIButton) {
        
        updateClasses("dPeriod")
        
    }
    
    @IBAction func ePeriodButton(sender: UIButton) {
        
        updateClasses("ePeriod")
        
    }
    
    @IBAction func fPeriodButton(sender: UIButton) {
        
        updateClasses("fPeriod")
        
    }
    
    @IBAction func xPeriodButton(sender: UIButton) {
        
        updateClasses("monXPeriod")
        
    }
    
    @IBAction func tuesXPeriodButton(sender: UIButton) {
        
        updateClasses("tuesXPeriod")
        
    }
    
    @IBAction func wednesXPeriodButton(sender: UIButton) {
        
        updateClasses("wednesXPeriod")
        
    }
    
    @IBAction func thursXPeriodButton(sender: UIButton) {
        
        updateClasses("thursXPeriod")
        
    }
    
    @IBAction func friXPeriodButton(sender: UIButton) {
        
        updateClasses("friXPeriod")
        
    }
    
    @IBAction func sportButton(sender: UIButton) {
        
        updateClasses("sport")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        classDict = defaults.objectForKey("storedClassDict") as! [String:String]
        
        updateArray()
        
        var DateInFormat:String = ""
        
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        DateInFormat = dateFormatter.stringFromDate(todaysDate)
        
        func getDayOfWeek(today:String)->Int? {
            
            let formatter  = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if let todayDate = formatter.dateFromString(today) {
                let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
                let myComponents = myCalendar.components(.CalendarUnitWeekday, fromDate: todayDate)
                let weekDay = myComponents.weekday
                return weekDay
            } else {
                return nil
            }
        }
        
        
        if let weekday = getDayOfWeek(DateInFormat) {
            
        } else {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

