//
//  ContentView.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var currentInterval: Interval
    @ObservedObject var currentLearningSession: LearningSession
    
    @State private var learningSessions: [LearningSession] = LearningSession.sampleData
    @State private var isCounterPresented = false
    @State private var isPresentingHistoryView = false
    @State private var isEndSessionPresented = false
    @State private var showingCounterNotStoppedAlert = false
    
    
    var body: some View {
        ZStack {
            
            Color.primary.colorInvert().ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: {
                        isEndSessionPresented = true
                    }) {
//                        if(currentInterval.intervalStarted) {
//                            showingCounterNotStoppedAlert.toggle()
//                        } else {
                            Label("End session", systemImage: "stop.circle")
                                .font(.title3)
//                        }
                    }
                    // add alert if session is not started or end it if its running
                    
                    Spacer()
                    
                    Button(action: {
                        isPresentingHistoryView = true
                    }) {
                        Label("History", systemImage: "clock")
                            .font(.title3)
                    }
                }
                .padding(.horizontal)
                
                TimerViewCircle(isCounterPresented: $isCounterPresented,
                                currentLearningSession: currentLearningSession,
                                currentInterval: currentInterval)
                
                Spacer()
                
                TimerViewLower(isCounterPresented: isCounterPresented,
                               isPresentingHistoryView: isPresentingHistoryView,
                               learningSessions: learningSessions,
                               currentLearningSession: currentLearningSession,
                               currentInterval: currentInterval)
            }
            
        }
        .sheet(isPresented: $isPresentingHistoryView) {
            SessionsHistory()
                .onDisappear {
                    isPresentingHistoryView = false
                }
        }
        .sheet(isPresented: $isEndSessionPresented) {
            AddNewSessionView(currentLearningSession: currentLearningSession)
                .onDisappear {
                    isPresentingHistoryView = false
                }
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerView(currentInterval: Interval(), currentLearningSession: LearningSession(intervals: []))
    }
}
