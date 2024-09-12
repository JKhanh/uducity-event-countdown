//
//  DateUtils.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import Foundation

extension Date {
    func daysFromToday() -> String {
        let currentDate = Date()
        
        let difference = Calendar.current.dateComponents([.year, .month, .day, .hour], from: currentDate, to: self)
                
        // Handle year difference
        if let years = difference.year, years != 0 {
            if years > 0 {
                return "\(years) years from today."
            } else {
                return "\(abs(years)) years ago."
            }
        }
        
        // Handle month difference if the year difference is less than 1
        if let months = difference.month, months != 0 {
            if months > 0 {
                if months == 1 {
                    return "Next month!"
                } else {
                    return "\(months) months from today."
                }
            } else {
                return "\(abs(months)) months ago."
            }
        }
        
        // Handle day difference if the month difference is less than 1
        if let days = difference.day, days != 0 {
            if days > 0 {
                return "\(days) days from today."
            } else {
                return "\(abs(days)) days ago."
            }
        }
        
        // Handle hours difference if the day difference is less than 1
        if let hours = difference.hour, hours != 0 {
            if hours > 0 {
                return "\(hours) hours from today."
            } else {
                return "\(abs(hours)) hours ago."
            }
        }
        
        return "It's NOW!!!!!!!!"
    }
}
