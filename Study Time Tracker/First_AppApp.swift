//
//  First_AppApp.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import SwiftUI

@main
struct First_AppApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(intervals: [], dailyLearns: DailyLearn.sampleData)
            TimerView()
        }
    }
}
