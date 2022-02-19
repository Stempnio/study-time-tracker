//
//  CardView.swift
//  First App
//
//  Created by Jakub Stepien on 17/02/2022.
//

import SwiftUI

struct CardView: View {
    
    let dailyLearn: DailyLearn
    
    var body: some View {
        VStack {
            Text(dateToDayMonthYear(date: dailyLearn.date))
                .font(.headline)
            Spacer()
            
            VStack(spacing: 3) {
                HStack {
                    Text("TOTAL TIME:")
                        .bold()
                    Spacer()
                    Text(dailyLearn.totalDailyTimeShortString)
                    Spacer()
                }
                
                HStack() {
                    Text("INTERVALS:")
                        .bold()
                    Spacer()
                    Text("\(dailyLearn.intervals.count)")
                    Spacer()
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(dailyLearn: DailyLearn(intervals: []))
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
