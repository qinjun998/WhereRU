//
//  CalendarMonthWeekDaysView.swift
//  WhereRU
//
//  Created by RInz on 15/7/6.
//  Copyright (c) 2015年 RInz. All rights reserved.
//

import UIKit

class CalendarMonthWeekDaysView: UIView {
    var calendarManager: CalendarView?
    
    private var cacheDaysOfWeeks: NSMutableArray?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        for day in daysOfWeek() {
            let view:UILabel = UILabel()
            view.font = self.calendarManager?.calendarAppearance?.weekDayTextFont
            view.textColor = self.calendarManager?.calendarAppearance?.weekDayTextColor
            view.textAlignment = NSTextAlignment.Center
            view.text = day as? String
            
            self.addSubview(view)
        }
    }
    
    func daysOfWeek() -> NSArray {
        if(cacheDaysOfWeeks != nil) {
            return cacheDaysOfWeeks!
        }
        
        var dateFormatter: NSDateFormatter?
        dateFormatter = NSDateFormatter()
        var days = NSMutableArray()
        
        days = (dateFormatter!.shortStandaloneWeekdaySymbols as NSArray).mutableCopy() as! NSMutableArray
        
        for(var i: Int = 0; i < days.count; i++) {
            let day: String = days[i] as! String
            days.replaceObjectAtIndex(i, withObject: day.uppercaseString)
        }
        var firstWeekday: Int = 0
        let calendar: NSCalendar? = self.calendarManager?.calendarAppearance?.calendar
        if calendar != nil {
            firstWeekday = (calendar!.firstWeekday + 6) % 7
        }
        else {
            firstWeekday = 6
        }
        for(var i: Int = 0; i < firstWeekday; ++i) {
            let day: AnyObject? = days.firstObject
            days.removeObjectAtIndex(0)
            days.addObject(day!)
        }
        
        self.cacheDaysOfWeeks = days
        return self.cacheDaysOfWeeks!
    }
    
    override func layoutSubviews() {
        var x: CGFloat = 0;
        let width: CGFloat = self.frame.size.width / 7
        let height: CGFloat = self.frame.size.height
        
        for view in self.subviews {
            (view ).frame = CGRectMake(x, 0, width, height)
            x = CGRectGetMaxX(view.frame)
        }
    }
    
    func reloadAppearance() {
        cacheDaysOfWeeks = nil
        self.backgroundColor = self.calendarManager!.calendarAppearance!.weekDayBackgroundColor!
        for(var i:Int = 0; i < self.subviews.count; ++i) {
            let view: UILabel = (self.subviews as NSArray).objectAtIndex(i) as! UILabel
            
            view.font = self.calendarManager!.calendarAppearance!.weekDayTextFont
            view.textColor = self.calendarManager!.calendarAppearance!.weekDayTextColor
            view.text = self.daysOfWeek().objectAtIndex(i) as? String
        }
    }
}
