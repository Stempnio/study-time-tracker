//
//  TimerViewUpper.swift
//  First App
//
//  Created by Jakub Stepien on 18/02/2022.
//

import SwiftUI

struct TimerViewCircle: View {
    
    @Binding var isCounterPresented: Bool
    @ObservedObject var currentLearningSession: LearningSession
    @ObservedObject var currentInterval: Interval

    
    var body: some View {
            Circle()
            .fill(.primary)
                .blur(radius: 10)
                .overlay {
                    if !isCounterPresented {
                        Button(action: {
                            isCounterPresented.toggle()
                            currentInterval.startInterval()
                            
                            // the start of a sessions is a point of a first interval
                            if(currentLearningSession.intervals.count == 0) {
                                currentLearningSession.startDate = Date()
                            }
                        }) {
                            Label("START LEARNING", systemImage: "timer")
                                .foregroundColor(.primary)
                                .colorInvert()
                                .font(.title2)

                        }
                    } else {
                        Button(action: {
                            isCounterPresented.toggle()
                            currentInterval.endInterval()
                            currentLearningSession.intervals.append(Interval(interval: currentInterval))
                        }) {
                            Label("STOP LEARNING", systemImage: "timer")
                                .foregroundColor(.primary)
                                .colorInvert()
                                .font(.title2)

                        }
                    }
                }
                .overlay(content: {
                    Circle()
                        .strokeBorder(lineWidth: 5)
                        .foregroundColor(.primary)
                        .colorInvert()
                        .padding(5)
                })
                .padding(50)

    }
}

struct TimerViewUpper_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewCircle(isCounterPresented: .constant(false),
                        currentLearningSession: LearningSession(intervals: []),
                        currentInterval: Interval())
    }
}
