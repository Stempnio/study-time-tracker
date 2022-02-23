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

    @State private var animationScale = 1.0
    @State private var rotationAmount = 0.0

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
                            
                            withAnimation {
                                animationScale = 2
                                rotationAmount += 360
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
                            
                            withAnimation {
                                animationScale = 1
                            }
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
                .rotation3DEffect(
                    .degrees(rotationAmount),
                    axis: (x: 1,
                           y: 1,
                           z: 1)
                )
                .overlay(content: {
                    if isCounterPresented {
                        Circle()
                            .stroke()
                            .foregroundColor(.primary)
                            .opacity(2 - animationScale)
                            .scaleEffect(animationScale)
                            .animation(.default, value: animationScale)
                    }
                })
                .padding(50)

    }
}

struct TimerViewUpper_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewCircle(isCounterPresented: .constant(true),
                        currentLearningSession: LearningSession(intervals: []),
                        currentInterval: Interval())
    }
}
