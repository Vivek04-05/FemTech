//
//  LastmenstrualCycleView.swift
//  FemTech
//
//  Created by Vivek Patel on 06/06/24.
//

import SwiftUI

struct LastmenstrualCycleView: View {
    @State var selectedDate: Date = Date()
    @EnvironmentObject var appInstance: AppInstance
    
    private var minDate: Date {
            let yearsAgo = Calendar.current.date(byAdding: .year, value: -1, to: selectedDate)!
            return yearsAgo
        }
    var body: some View {
        ZStack{
            Color.pink.opacity(0.45).ignoresSafeArea()
            VStack(content: {
                
                VStack {
                    Text("When did your last period Start ?")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .fontWeight(.heavy)
                        .padding(.bottom,10)
                    Text("To tailor your experience and provide accurate insights, we'd like to know: when did your last menstrual period begin?")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black.opacity(0.5))
                    
                }.padding(EdgeInsets(top: 40, leading: 20, bottom: 30, trailing: 20))
                
                
                DatePicker("", selection: $selectedDate,in: minDate...Date(), displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .tint(.white)
                    .background(Color.pink.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    .padding(.top,20)
                
                Spacer()
                
                NavigationLink {
                    PeriodRegularView().onAppear {
                        appInstance.lastTimePeriodDate = selectedDate
                        print(appInstance.lastTimePeriodDate)
                    }
                } label: {
                    Text("Next")
                        .foregroundStyle(Color.pink.opacity(0.7))
                        .padding(EdgeInsets(top: 15, leading: 120, bottom: 15, trailing: 120))
                        .background(Color.white.opacity(0.5).cornerRadius(5))
                }.padding(.bottom, 30)
                
            })
        }
        
       
    }
}

#Preview {
    LastmenstrualCycleView()
}
