//
//  FilteredList.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 21/02/2022.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<LearningSessionModel>
    
    var body: some View {
        List {
            Section("Last sessions") {
                ForEach(fetchRequest) { session in
                    CardView(session: session)
                }
                .onDelete(perform: deleteSessions)
            }
        }
    }
    
    init(filter: String = "") {
        if(filter == "") {
            _fetchRequest = FetchRequest<LearningSessionModel>(sortDescriptors: [SortDescriptor(\.startDate, order: .reverse)])
        } else {
            _fetchRequest = FetchRequest<LearningSessionModel>(sortDescriptors: [SortDescriptor(\.startDate, order: .reverse)],
                                                           predicate: NSPredicate(format: "name CONTAINS[cd] %@", filter))
        }
    }
    
    func deleteSessions(at offsets: IndexSet) {
        for offset in offsets {
            let session = fetchRequest[offset]
            moc.delete(session)
        }
        
        try? moc.save()
    }
}

