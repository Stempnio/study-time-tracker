//
//  CardView.swift
//  First App
//
//  Created by Jakub Stepien on 17/02/2022.
//

import SwiftUI

struct CardView: View {
    
    let session: LearningSessionModel
    
    var body: some View {
        VStack {
            Text(dateToDayMonthYear(date: session.startDate!))
                .font(.headline)
            Spacer()
            
            VStack(spacing: 3) {
                HStack {
                    Text("TOTAL TIME:")
                        .bold()
                    Spacer()
                    Text(secondsToHoursMinutesSecondsString(Int(session.totalTime), short: true))
                    Spacer()
                }
                
                HStack() {
                    Text("INTERVALS:")
                        .bold()
                    Spacer()
                    Text("\(session.numberOfIntervals)")
                    Spacer()
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//            .previewLayout(.fixed(width: 400, height: 70))
//    }
//}
