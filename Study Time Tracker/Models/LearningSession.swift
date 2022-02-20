//
//  DailyLearn.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import Foundation

class LearningSession: Identifiable, ObservableObject {
    let id: UUID
    @Published var intervals: [Interval]
    var startDate: Date
    
    var totalSessionTime: Double {
        var totalTime: Double = 0
        for interval in intervals {
            totalTime += interval.totalTime
        }
        return totalTime
    }
    
    init(id: UUID = UUID(), intervals: [Interval], date: Date = Date()) {
        self.id = id
        self.intervals = intervals
        self.startDate = date
    }


}

extension LearningSession {
    
    var totalDailyTimeFormatted: (h: Int,m: Int,s: Int) {
        secondsToHoursMinutesSeconds(Int(totalSessionTime))
    }
    
    var totalDailyTimeString: String {
        return secondsToHoursMinutesSecondsString(Int(totalSessionTime))
    }
    
    var totalDailyTimeShortString: String {
        return secondsToHoursMinutesSecondsString(Int(totalSessionTime), short: true)
    }
    
    static var sampleData: [LearningSession] = [
        LearningSession(intervals: [Interval()]),
        LearningSession(intervals: [], date: Date().dayBefore)
    ]
}

