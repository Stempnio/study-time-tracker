//
//  DailyLearnHistory.swift
//  First App
//
//  Created by Jakub Stepien on 17/02/2022.
//

import SwiftUI

struct DailyLearnHistory: View {
    
    let history: [DailyLearn]
    
    var body: some View {
        
        VStack {
            
            Text("THE LONGEST LEARNING TIME SO FAR")
                .bold()
            
            Text("x")
            
            List {
                Section("daily learns") {
                    ForEach(history) { dailylearn in
                        //if(dailylearn.intervals.count > 0) {
                            CardView(dailyLearn: dailylearn)
                        //}
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct DailyLearnHistory_Previews: PreviewProvider {
    
    static let sample = [DailyLearn(intervals: []), DailyLearn(intervals: [])]
    
    static var previews: some View {
        DailyLearnHistory(history: sample)
    }
}
