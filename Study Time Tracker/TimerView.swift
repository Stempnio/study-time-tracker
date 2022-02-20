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
    @State private var showingNoIntervalsStarted = false
    
    
    var body: some View {
        ZStack {
            
            Color.primary.colorInvert().ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        guard !currentInterval.intervalStarted else {
                            showingCounterNotStoppedAlert.toggle()
                            return
                        }
                        
                        guard currentLearningSession.intervals.count>0 else {
                            showingNoIntervalsStarted.toggle()
                            return
                        }
                        
                        isEndSessionPresented = true
                        
                    }) {
                        Label("End session", systemImage: "stop.circle")
                            .font(.title3)
                    }
                    
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
        .alert("", isPresented: $showingCounterNotStoppedAlert) {
            Button("GOT THAT", action: {})
        } message: {
            Text("Stop the counter in order to end the session!")
                .bold()
        }
        .alert("", isPresented: $showingNoIntervalsStarted) {
            Button("GOT THAT", action: {})
        } message: {
            Text("You haven't started any interval yet! Click 'start learning' to begin")
                .bold()
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
                    isEndSessionPresented = false
                }
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerView(currentInterval: Interval(), currentLearningSession: LearningSession(intervals: []))
    }
}
