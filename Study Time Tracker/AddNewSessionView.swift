//
//  AddNewSessionView.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 19/02/2022.
//

import SwiftUI

struct AddNewSessionView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var currentLearningSession: LearningSession
    
    @State private var sessionName: String = ""
    
    var body: some View {
        VStack {
            Text("details of session")
            
            TextField("Name of session", text: $sessionName)
            
            Button("save session") {
                
                let session = LearningSessionModel(context: moc)
                session.id = UUID()
                session.totalTime = Int64(currentLearningSession.totalSessionTime)
                session.numberOfIntervals = Int64(currentLearningSession.intervals.count)
                session.startDate = currentLearningSession.startDate
                session.endDate = Date()
                session.name = sessionName
                
                try? moc.save()
                
                currentLearningSession.intervals = []
                
            }
        }
        .padding()
        // add alert if session is saved
        
        
    }
}

struct AddNewSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSessionView(currentLearningSession: LearningSession(intervals: []))
    }
}
