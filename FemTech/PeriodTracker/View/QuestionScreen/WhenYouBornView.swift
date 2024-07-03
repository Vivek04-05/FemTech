//
//  WhenYouBornView.swift
//  FemTech
//
//  Created by Vivek Patel on 06/06/24.
//

import SwiftUI

struct WhenYouBornView: View {
    
    @EnvironmentObject var appInstance: AppInstance
    
    @State var selectedYear: Int = 2004
        let currentYear = Calendar.current.component(.year, from: Date())
        let years = Array((1900...Calendar.current.component(.year, from: Date())).reversed())
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack {
                    Text("When were you born?")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                    
                    Text("Your cycle can change with age. Knowing it helps us make better predictions.")
                        .foregroundStyle(Color.black.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .fontWeight(.heavy)
                        .padding(.horizontal,40)
                }.padding(.top,60)
                Spacer()
                
                Picker("Select Date", selection: $selectedYear) {
                    ForEach(years, id: \.self) {year in
                        Text(String(year))
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                        
                        
                    }
                }
                .frame(height: 400)
                .pickerStyle(WheelPickerStyle())
                .scaleEffect(CGSize(width: 1.25, height: 1.5))
                .background(Color.pink.opacity(0.04))
                .padding(.bottom,10)
                .cornerRadius(10)
                
                
                Spacer()
                
                NavigationLink {
                    FellAboutPeriodView().onAppear {
                        appInstance.userYearBirth = selectedYear
//                        print(appInstance.userYearBirth)
                    }
                } label: {
                    Text("Next")
                        .foregroundStyle(Color.pink.opacity(0.7))
                        .padding(EdgeInsets(top: 15, leading: 120, bottom: 15, trailing: 120))
                        .background(Color.white.opacity(0.5).cornerRadius(5))
                }.padding(.bottom, 30)
                
                
                
            }
            .background(Color.pink.opacity(0.45))
            .navigationBarBackButtonHidden()
            
        }
    }
}

#Preview {
    WhenYouBornView()
}
