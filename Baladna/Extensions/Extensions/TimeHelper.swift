//
//  TimeHelper.swift
//  Emdad
//
//  Created by arab devolpers on 7/3/19.
//  Copyright © 2019 creative. All rights reserved.
//

import Foundation

struct TimeHelper {
    
    func getTimeString(time:Int) ->String {
        let myNSDate = Date(timeIntervalSince1970: TimeInterval(time))
        
        let timeString = dateTimeAgo(date: myNSDate)
        return timeString
        
    }
    
    private func dateTimeAgo(date: Date) -> String {
        
        let deltaSeconds = secondsFrom(date: date)
        let deltaMinutes:Double = Double(deltaSeconds / 60)
        
        if deltaSeconds < 5 {
            return NSLocalizedString("just_now", comment: "")
        }
        if deltaSeconds < 60 {
            return String(deltaSeconds) + NSLocalizedString("seconds_ago", comment: "")
        }
        if deltaSeconds < 120 {
            return NSLocalizedString("minute_ago", comment: "")
        }
        if deltaMinutes < 60 {
            return String(Int(deltaMinutes)) + NSLocalizedString("minutes_ago", comment: "")
        }
        if deltaMinutes < 120 {
            return NSLocalizedString("hour_ago", comment: "")
        }
        if deltaMinutes < (24 * 60) {
            let hours = flooredString(delta: deltaMinutes, dividedBy: 60)
            return hours + NSLocalizedString("hours_ago", comment: "")
        }
        if deltaMinutes < (24 * 60 * 2) {
            return NSLocalizedString("yesterday", comment: "")
        }
        if deltaMinutes < (24 * 60 * 7) {
            let days = flooredString(delta: deltaMinutes, dividedBy: (60 * 24))
            return days + NSLocalizedString("days_ago", comment: "")
        }
        if deltaMinutes < (24 * 60 * 14) {
            return NSLocalizedString("last_week", comment: "")
        }
        if deltaMinutes < (24 * 60 * 31) {
            let weeks = flooredString(delta: deltaMinutes, dividedBy: (60 * 24 * 7))
            return weeks + NSLocalizedString("weeks_ago", comment: "")
        }
        if deltaMinutes < (24 * 60 * 61) {
            return NSLocalizedString("last_month", comment: "")
        }
        if deltaMinutes < (24 * 60 * 365.25) {
            let months = flooredString(delta: deltaMinutes, dividedBy: (60 * 24 * 30))
            return months + NSLocalizedString("months_ago", comment: "")
        }
        if deltaMinutes < (24 * 60 * 731) {
            return NSLocalizedString("last_year", comment: "")
        }
        
        let years = flooredString(delta: deltaMinutes, dividedBy: (60 * 24 * 365))
        return years + NSLocalizedString("years_ago", comment: "")
    }
    
    private func secondsFrom(date:Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: Date()).second ?? 0
    }
    
    private func flooredString(delta: Double, dividedBy: Double) -> String {
        return String(Int(floor(delta/dividedBy)))
    }
     
}

