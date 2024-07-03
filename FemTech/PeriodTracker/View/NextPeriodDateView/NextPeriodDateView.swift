//
//  NextPeriodDateView.swift
//  FemTech
//
//  Created by Vivek Patel on 19/06/24.
//

import SwiftUI
import FSCalendar

struct NextPeriodDateView: View {
    @EnvironmentObject var appInstance: AppInstance
    @State private var selectedDate: Date? = Date()
    @State private var calendarScope: FSCalendarScope = .week
    @State var lastPeriodDate: Date?
    @State var nextPeriodADte: Date?
    
  
    
    var body: some View {
        ZStack{
            Color.pink.opacity(0.45).ignoresSafeArea()
            VStack{
                
                FSCalendarView(selectedDate: $selectedDate, scope: $calendarScope, lastPeriodDate: $lastPeriodDate, nextPerioddate: $nextPeriodADte)
                    .frame(height: 320)
                    .padding(.horizontal, 10)
                    .overlay(alignment: .topTrailing) {
                        Button {
                            calenderToggle()
                        } label: {
                            Text(calendarScope == .week ? "Expand" : "Collapse")
                        }.padding([.trailing, .top], 10)
                    }
                
                Text("Next Period Prediction :")
                Text("\(remaningDaysNextPeriod()) Days")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
        }.navigationTitle(Text("Next Period"))
    }
    
    func calenderToggle(){
        withAnimation {
            calendarScope = calendarScope == .week ? .month : .week
        }
    }
    
    func remaningDaysNextPeriod() ->Int {
        guard let nextPeriodDate = nextPeriodADte else { return 0 }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date(), to: nextPeriodDate)
        return components.day ?? 0
    }
}

#Preview {
    NextPeriodDateView( lastPeriodDate: Date())
}
