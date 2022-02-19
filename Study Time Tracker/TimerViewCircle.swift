//
//  TimerViewUpper.swift
//  First App
//
//  Created by Jakub Stepien on 18/02/2022.
//

import SwiftUI

struct TimerViewCircle: View {
    
    @Binding var isCounterPresented: Bool
    @ObservedObject var todayDailyLearn: DailyLearn
//    @ObservedObject var appAppearance: AppAppearance
    @ObservedObject var currentInterval: Interval

    
    var body: some View {
        //VStack {
            Circle()
            .fill(.primary)
                .blur(radius: 10)
                .overlay {
                    if !isCounterPresented {
                        Button(action: {
                            isCounterPresented.toggle()
                            currentInterval.startInterval()
                        }) {
                            Label("START LEARNING", systemImage: "timer")
                                .foregroundColor(.primary)
                                .colorInvert()
                                //.foregroundColor(appAppearance.appTheme.mainColor)
                                .font(.title2)

                        }
                    } else {
                        Button(action: {
                            isCounterPresented.toggle()
                            currentInterval.endInterval()
                            todayDailyLearn.intervals.append(Interval(interval: currentInterval))
                        }) {
                            Label("STOP LEARNING", systemImage: "timer")
                                .foregroundColor(.primary)
                                .colorInvert()
                                //.foregroundColor(appAppearance.appTheme.mainColor)
                                //.foregroundColor(.secondary)
                                .font(.title2)

                        }
                    }
                }
                .overlay(content: {
                    Circle()
                        .strokeBorder(lineWidth: 5)
//                        .foregroundColor(appAppearance.appTheme.mainColor)
                        .foregroundColor(.primary)
                        .colorInvert()
                        .padding(5)
                })
                .padding(50)
                
       // }
    }
}

struct TimerViewUpper_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewCircle(isCounterPresented: .constant(false),
                        todayDailyLearn: DailyLearn(intervals: []),
                        currentInterval: Interval())
    }
}
