//
//  TimerViewLower.swift
//  First App
//
//  Created by Jakub Stepien on 18/02/2022.
//

import SwiftUI

struct TimerViewLower: View {
    
    var isCounterPresented: Bool
    var isPresentingHistoryView: Bool
    var learningSessions: [LearningSession]
    
    @ObservedObject var currentLearningSession: LearningSession
    @ObservedObject var currentInterval: Interval
    
    var body: some View {
        VStack {
            if isCounterPresented {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .padding()
                        .foregroundColor(.primary)
                        .colorInvert()
                        //.frame(height: 250)
                    
                    
                    VStack(spacing: 30) {
                        Text("TIME ELAPSED")
                            .padding(8)
                            .font(.largeTitle)
                            .border(Color.primary, width: 2)
                        Text(currentInterval.elapsedTimeFormattedString)
                            .font(.title2)
                        
                        
                    }
                }
                .colorInvert()
            } else {
                VStack {
                    
                    Text("TOTAL LEARNING TIME:")
                        .bold()
                    Text("\(currentLearningSession.totalDailyTimeString)")
                    List {
                        Section("Sessions' learning intervals") {
                            ForEach(currentLearningSession.intervals) { interval in
                                VStack(alignment: .leading) {
                                    Text(interval.totalTimeFormattedString)
                                    Spacer()
                                    Text(interval.start!.formatted())
                                        .font(.caption)
                                }
                            }
                            .onDelete { indexSet in
                                currentLearningSession.intervals.remove(atOffsets: indexSet)
                            }
                        }
                    }
                }
                .foregroundColor(.primary)
                
            }
        }
    }
    
}

struct TimerViewLower_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerViewLower(isCounterPresented: false,
                       isPresentingHistoryView: false,
                       learningSessions: [], currentLearningSession: LearningSession(intervals: Interval.sampleIntervals),
                       currentInterval: Interval())

    }
}
