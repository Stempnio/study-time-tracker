//
//  DailyLearnHistory.swift
//  First App
//
//  Created by Jakub Stepien on 17/02/2022.
//

import SwiftUI

struct SessionsHistory: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.startDate, order: .reverse)
    ]) var sessions: FetchedResults<LearningSessionModel>
    
    @State private var sessionName: String = ""
    
    var body: some View {
        
        VStack {
            TextField("Search session by name", text: $sessionName)
                .padding()

            FilteredList(filter: sessionName)
        }
        .padding(.vertical)
    }
    
    func deleteSessions(at offsets: IndexSet) {
        for offset in offsets {
            let session = sessions[offset]
            moc.delete(session)
        }
        
        try? moc.save()
    }
}

struct DailyLearnHistory_Previews: PreviewProvider {
    
    static var previews: some View {
        SessionsHistory()
    }
}
