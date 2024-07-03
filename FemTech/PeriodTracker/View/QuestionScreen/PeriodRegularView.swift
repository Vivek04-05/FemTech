//
//  PeriodRegularView.swift
//  FemTech
//
//  Created by Vivek Patel on 19/06/24.
//

import SwiftUI

struct PeriodRegularQuestion{
    
    let option: String
    let description: String
}

struct PeriodRegularView: View {
    
    let periodRegularQuestionAnswer: [PeriodRegularQuestion] = [
        PeriodRegularQuestion(option: "Yes", description: "Great! Regular periods are a sign that your menstrual cycle is functioning normally. Keep track of your cycle to ensure consistency."),
        PeriodRegularQuestion(option: "No", description: "Irregular periods can be caused by a variety of factors such as stress, hormonal imbalances, or underlying health conditions. Consider consulting a healthcare provider for advice."),
        PeriodRegularQuestion(option: "I Didn't Know", description: "It's important to track your menstrual cycle to understand its regularity. There are many apps available that can help you keep track of your periods.")
    ]
    
    @EnvironmentObject var appInstance: AppInstance
    var periodTrackerModel = PeriodTrackerViewModel()
    @State private var selectedIndex: Int?
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.45).ignoresSafeArea()
            VStack {
                Text("Are you getting your period regular?")
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .fontWeight(.heavy)
                    .padding(.top,40)
                
                
                List {
                    
                    ForEach(0..<periodRegularQuestionAnswer.count, id: \.self){ index in
                        VStack(alignment: .leading) {
                            Text(self.periodRegularQuestionAnswer[index].option)
                                .font(.system(size: 25))
                                .fontWeight(.medium)
                                .padding(.bottom,5)
                                .onTapGesture {
                                    self.selectedIndex = index == self.selectedIndex ? nil : index
                                }
                            if self.selectedIndex == index {
                                Text(self.periodRegularQuestionAnswer[index].description)
                                    .font(.subheadline)
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        
                    }.listRowBackground(Color.clear)
                        .padding(.bottom,20)
                    
                }.scrollContentBackground(.hidden)
                    .background(Color.pink.opacity(0.1).ignoresSafeArea())
                    .listRowSpacing(20)
                
              
                NavigationLink {
                    let lastTimePeriodDate = appInstance.lastTimePeriodDate
                    let nextPeriodDate = calculateNexPeriodDate()
                    NextPeriodDateView( lastPeriodDate: lastTimePeriodDate,nextPeriodADte:nextPeriodDate)
                } label: {
                    Text("Next")
                        .foregroundStyle(Color.pink.opacity(0.7))
                        .padding(EdgeInsets(top: 15, leading: 120, bottom: 15, trailing: 120))
                        .background(Color.white.opacity(0.5).cornerRadius(5))
                }.padding(.bottom, 30)
            }
        }.navigationTitle(Text("Regular"))
    }
    
    func calculateNexPeriodDate() -> Date {
        // Get the period gap according to user age
        let userDOB = appInstance.userYearBirth
        let currentYear =  Calendar.current.component(.year, from: Date())
        let presentAge = currentYear - userDOB
        let  periodDayGap = periodTrackerModel.caluclateperiodDate(userAge: presentAge)
        return Calendar.current.date(byAdding: .day, value: periodDayGap, to: appInstance.lastTimePeriodDate) ?? appInstance.lastTimePeriodDate
    }
}

#Preview {
    PeriodRegularView()
}
