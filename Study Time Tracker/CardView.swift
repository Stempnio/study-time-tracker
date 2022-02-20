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
        
        VStack(spacing: 10) {
                        Text("\(session.startDate?.formatted() ?? Date.distantPast.formatted())")
                            .font(.headline)
            
            HStack {
                VStack {
                    Text("Name")
                        .bold()
                    Text(session.name ?? "none")
                }
                
                Spacer()
                
                VStack {
                    Text("Total time")
                        .bold()
                        .lineLimit(1)
                    Text("\(session.totalTime)")
                }
                
                Spacer()
                
                VStack {
                    Text("Intervals")
                        .bold()
                        .lineLimit(1)
                    Text("\(session.numberOfIntervals)")
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
//            .previewLayout(.fixed(width: 400, height: 100))
//    }
//}
