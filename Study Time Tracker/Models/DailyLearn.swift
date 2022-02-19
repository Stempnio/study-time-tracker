//
//  DailyLearn.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import Foundation

class DailyLearn: Identifiable, ObservableObject {
    let id: UUID
    @Published var intervals: [Interval]
    let date: Date
    
    var totalDailyTime: Double {
        var totalTime: Double = 0
        for interval in intervals {
            totalTime += interval.totalTime
        }
        return totalTime
    }
    
    var totalDailyTimeFormatted: (h: Int,m: Int,s: Int) {
        secondsToHoursMinutesSeconds(Int(totalDailyTime))
    }
    
    var totalDailyTimeString: String {
        return secondsToHoursMinutesSecondsString(Int(totalDailyTime))
    }
    
    var totalDailyTimeShortString: String {
        return secondsToHoursMinutesSecondsString(Int(totalDailyTime), short: true)
    }
    
    init(id: UUID = UUID(), intervals: [Interval], date: Date = Date()) {
        self.id = id
        self.intervals = intervals
        self.date = date
    }


}

extension DailyLearn {
    static var sampleData: [DailyLearn] = [
        DailyLearn(intervals: [Interval()]),
        DailyLearn(intervals: [], date: Date().dayBefore)
    ]
}

