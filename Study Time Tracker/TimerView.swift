//
//  ContentView.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import SwiftUI

struct TimerView: View {
    
    //    @StateObject var appAppearance = AppAppearance()
    @StateObject var currentInterval: Interval = Interval()
    @StateObject var todayDailyLearn: DailyLearn = DailyLearn(intervals: [])
    
    @State private var dailyLearns: [DailyLearn] = DailyLearn.sampleData
    @State private var isCounterPresented = false
    @State private var isPresentingHistoryView = false
    @State private var isFinishLearningPresented = false
    
    
    var body: some View {
        ZStack {
            
            Color.primary.colorInvert().ignoresSafeArea()
            //            appAppearance.appTheme.mainColor
            //                .ignoresSafeArea()
            
            //            VStack {
            //
            //                //                HStack {
            //                //                    Button(action: {
            //                //                        appAppearance.toggle()
            //                //                    }) {
            //                //                        Label("Change theme", systemImage: "paintpalette")
            //                //                    }
            //
            //                Spacer()
            //
            //                Button(action: {
            //                    isPresentingHistoryView = true
            //                }) {
            //                    Label("History", systemImage: "clock")
            //                }
            //            }
            //            .padding(.horizontal)
            
            VStack {
                HStack {
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
                                todayDailyLearn: todayDailyLearn,
                                currentInterval: currentInterval)
                
                Spacer()
                
                TimerViewLower(isCounterPresented: isCounterPresented,
                               isPresentingHistoryView: isPresentingHistoryView,
                               dailyLearns: dailyLearns,
                               todayDailyLearn: todayDailyLearn,
                               currentInterval: currentInterval)
            }
            
        }
        .sheet(isPresented: $isPresentingHistoryView) {
            DailyLearnHistory(history: dailyLearns)
                .onDisappear {
                    isPresentingHistoryView = false
                }
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerView()
    }
}
