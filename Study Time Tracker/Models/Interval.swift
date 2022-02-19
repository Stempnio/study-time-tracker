//
//  Interval.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import Foundation

class Interval: ObservableObject, Identifiable {
    
    let id: UUID
    private var intervalStarted = false
    var start: Date?
    private var end: Date?
    
    @Published var elapsedTime: Int

    var totalTime: Double = 0
    
    var elapsedTimeFormattedString: String {
        return secondsToHoursMinutesSecondsString(Int(elapsedTime))
    }
    
    var totalTimeFormattedString: String {
        return secondsToHoursMinutesSecondsString(Int(totalTime))
    }
    
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var timer: Timer?
    
    func startInterval() {
        if(!intervalStarted) {
            intervalStarted.toggle()
            start = Date()
            timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
                if let self = self, let startDate = self.start {
                    let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                    self.elapsedTime = Int(secondsElapsed)
                }
            }
        }
    }
    
    func endInterval() {
        if(intervalStarted) {
            end = Date()
            self.totalTime = end!.timeIntervalSince1970 - start!.timeIntervalSince1970
            timer?.invalidate()
            intervalStarted.toggle()
        }
    }
    
    init(sampleData: Bool = false) {
        self.id = UUID()
        self.elapsedTime = 0
        self.totalTime = 0
        
        if(sampleData) {
            self.start = Date.now
            self.end = Calendar.current.date(byAdding: .minute, value: 5, to: Date.now)
        }
    }
    
    init(interval: Interval) {
        self.id = UUID()
        self.elapsedTime = 0
        self.totalTime = interval.totalTime
        self.start = interval.start
        self.end = interval.end
    }
    
    init(t: Double) {
        self.id=UUID()
        self.totalTime = t
        self.elapsedTime = 0
    }

}

extension Interval {
    static var sampleIntervals: [Interval] = [Interval(sampleData: true)]
}
