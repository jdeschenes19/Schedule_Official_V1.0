//
//  FirstViewController.swift
//  High-School-Schedule
//
//  Created by JAM2 on 5/30/15.
//  Copyright (c) 2015 JAM2. All rights reserved.
//

import UIKit

var defaults = NSUserDefaults.standardUserDefaults()

class FirstViewController: UITableViewController {
    
    var weekday = 0

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(classDict)
        
        println("View did load")
        
        if defaults.objectForKey("storedClassArray") == nil {
        
            defaults.setObject(classArray, forKey: "storedClassArray")
            
        }
        
        if defaults.objectForKey("storedClassDict") == nil {
            
            defaults.setObject(classDict, forKey: "storedClassDict")
            
        }
        
        var mondayTimesArray = [60, 45, 45, 15, 45, 45, 30, 45, 45]
        
        var tuesdayTimesArray = [45, 75, 15, 75, 60, 30, 75]
        
        var wednesdayTimesArray = [45, 75, 10, 75, 60, 30, 75]
        
        var thursdayTimesArray = [45, 45, 15, 45, 45, 60, 30, 45, 45]
        
        var fridayTimesArray = [45, 45, 50, 45, 60, 30, 45, 45]
        
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
        
        //table.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
        
        var returnNum = 0
        
        if weekday == 2 || weekday == 7 || weekday == 1 || weekday == 0 {
            
            returnNum = 9
            
        } else if weekday == 3 {
            
            returnNum = 7
            
        } else if weekday == 4 {
            
            returnNum = 7
            
        } else if weekday == 5 {
            
            returnNum = 9
            
        } else if weekday == 6 {
            
            returnNum = 8
            
        }
        
        return returnNum
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var mondayScheduleArray = ["7:45-8:45", "8:50-9:35", "9:40-10:25", "10:30-10:45", "10:50-11:35", "11:40-12:25", "12:25-12:55", "1:00-1:45", "1:50-2:35"]
        
        var tuesdayScheduleArray = ["7:45-8:30", "8:35-9:50", "9:55-10:10", "10:15-11:30", "11:35-12:35", "12:35-1:05", "12:25-12:55", "1:00-1:45", "1:50-2:35"]
        
        var wednesdayScheduleArray = ["8:00-8:45", "8:50-10:05", "10:10-10:20", "10:25-11:40", "11:45, 12:45", "12:45-1:15", "1:20-2:35"]
        
        var thursdayScheduleArray = ["7:45-8:30", "8:35-9:20", "9:25-9:40", "9:45-10:30", "10:35-11:20", "11:25-12:25", "12:25-12:55", "1:00-1:45", "1:50-2:35"]
        
        var fridayScheduleArray = ["8:00-8:45", "8:50-9:35", "9:40-10:30", "10:35-11:20", "11:25-12:25", "12:25-12:55", "1:00-1:45", "1:50-2:35"]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var time = [String]()
        
        if weekday == 1 || weekday == 2 || weekday == 7 || weekday == 0 {
            
            time = mondayScheduleArray
            
        } else if weekday == 3 {
            
            time = tuesdayScheduleArray
            
        } else if weekday == 4 {
            
            time = wednesdayScheduleArray
            
        } else if weekday == 5 {
            
            time = thursdayScheduleArray
            
        } else if weekday == 6 {
            
            time = fridayScheduleArray
            
        }
        
        //var usedArray = defaults.objectForKey("storedClassArray") as! NSArray
        
        var usedArray = classArray
        
        cell.textLabel?.text = "\(usedArray[indexPath.row]) \(time[indexPath.row])"
        
        return cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        table.reloadData()
        
    }

}

