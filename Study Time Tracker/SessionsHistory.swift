//
//  DailyLearnHistory.swift
//  First App
//
//  Created by Jakub Stepien on 17/02/2022.
//

import SwiftUI

struct SessionsHistory: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var sessions: FetchedResults<LearningSessionModel>
    
    var body: some View {
        
        VStack {
            
            Text("THE LONGEST SESSION SO FAR")
                .bold()
            
            Text("todo")

            List {
                Section("Last sessions") {
                    ForEach(sessions) { session in
                        CardView(session: session)
                    }
                    .onDelete(perform: deleteSessions)
                }
            }
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
