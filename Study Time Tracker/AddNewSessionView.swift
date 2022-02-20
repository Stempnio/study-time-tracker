//
//  AddNewSessionView.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 19/02/2022.
//

import SwiftUI

struct AddNewSessionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var currentLearningSession: LearningSession
    
    @State private var sessionName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                List() {
                    Section("Details of session") {
                        TextField("Name of session", text: $sessionName)
                        HStack {
                            Text("Date:")
                            Spacer()
                            Text("\(currentLearningSession.startDate.formatted())")
                        }
                        
                        HStack {
                            Text("Total time:")
                            Spacer()
                            Text("\(currentLearningSession.totalDailyTimeShortString)")
                        }
                        
                        HStack {
                            Text("Intervals:")
                            Spacer()
                            Text("\(currentLearningSession.intervals.count)")
                        }
                    }
                }
                
                HStack(spacing: 25) {
                    
                    Button("Discard session") {
                        resetSession()
                        dismiss()
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(20)
                    .foregroundColor(.red)
                    
                    Button("Save session") {
                        saveSession()
                        dismiss()
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(20)
                    .foregroundColor(.green)
                    
                }
                
                
            }
            .padding()
            .navigationTitle("End current session")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
        // add alert if session is saved
        
        
    }
    
    func saveSession() {
        let session = LearningSessionModel(context: moc)
        session.id = UUID()
        session.totalTime = Int64(currentLearningSession.totalSessionTime)
        session.numberOfIntervals = Int64(currentLearningSession.intervals.count)
        session.startDate = currentLearningSession.startDate
        session.endDate = Date()
        session.name = sessionName
        
        try? moc.save()
        
        resetSession()
    }
    
    func resetSession() {
        currentLearningSession.intervals = []
    }
}

struct AddNewSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSessionView(currentLearningSession: LearningSession(intervals: []))
    }
}
