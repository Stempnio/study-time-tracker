//
//  First_AppApp.swift
//  First App
//
//  Created by Jakub Stepien on 16/02/2022.
//

import SwiftUI

@main
struct StudyTimeTrackerApp: App {
    
    @StateObject private var dataController = DataController()
    @StateObject var currentInterval: Interval = Interval()
    @StateObject var currentLearningSession: LearningSession = LearningSession(intervals: [])
    
    var body: some Scene {
        WindowGroup {
            TimerView(currentInterval: currentInterval, currentLearningSession: currentLearningSession)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
