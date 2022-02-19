//
//  Utils.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 19/02/2022.
//

import SwiftUI

func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func secondsToHoursMinutesSecondsString(_ seconds: Int, short: Bool = false) -> String {
    let tuple = secondsToHoursMinutesSeconds(seconds)
    
    if(short) {
        return "\(tuple.0)h \(tuple.1)m \(tuple.2)s"
    } else {
        return "\(tuple.0) Hours, \(tuple.1) Minutes, \(tuple.2) Seconds"
    }
}

func dateToDayMonthYear(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    let year = formatter.string(from: date)
    formatter.dateFormat = "MM"
    let month = formatter.string(from: date)
    formatter.dateFormat = "dd"
    let day = formatter.string(from: date)
    
    return "\(day)/\(month)/\(year)"
}

//func dateToHourMinutes(date: Date) -> String {
//    let calendar = Calendar.current
//    let hour = calendar.component(.hour, from: date)
//    let minute = calendar.component(.minute, from: date)
//    return ""
//}

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
