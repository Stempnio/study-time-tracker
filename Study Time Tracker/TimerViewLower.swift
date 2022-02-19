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
    var dailyLearns: [DailyLearn]
    
    @ObservedObject var todayDailyLearn: DailyLearn
//    @ObservedObject var appAppearance: AppAppearance
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
                        
                            //.foregroundColor(appAppearance.appTheme.mainColor)
                            .border(Color.primary, width: 2)
                        Text(currentInterval.elapsedTimeFormattedString)
                            .font(.title2)
                            //.foregroundColor(appAppearance.appTheme.mainColor)
                        
                        
                    }
                }
                .colorInvert()
            } else {
                VStack {
                    
                    Text("TOTAL LEARNING TIME TODAY:")
                        .bold()
                    Text("\(todayDailyLearn.totalDailyTimeString)")
                    List {
                        Section("Today's learning intervals") {
                            ForEach(todayDailyLearn.intervals) { interval in
                                VStack(alignment: .leading) {
                                    Text(interval.totalTimeFormattedString)
                                    Spacer()
                                    Text(interval.start!.formatted())
                                        .font(.caption)
                                }
                            }
                            .onDelete { indexSet in
                                todayDailyLearn.intervals.remove(atOffsets: indexSet)
                            }
                        }
                    }
                }
                .foregroundColor(.primary)
                //.foregroundColor(appAppearance.appTheme.accentColor)
                
            }
        }
    }
    
}

struct TimerViewLower_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerViewLower(isCounterPresented: false,
                       isPresentingHistoryView: false,
                       dailyLearns: [], todayDailyLearn: DailyLearn(intervals: Interval.sampleIntervals),
                       currentInterval: Interval())

    }
}
