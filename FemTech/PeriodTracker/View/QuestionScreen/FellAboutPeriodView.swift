//
//  FellAboutPeriodView.swift
//  FemTech
//
//  Created by Vivek Patel on 06/06/24.
//

import SwiftUI

struct FellQuestion{
    
    let question: String
    let description: String
}

struct FellAboutPeriodView: View {
    @EnvironmentObject var appInstance: AppInstance
    
    let userQuestionAnswer: [FellQuestion] = [
        FellQuestion(question: "It's a love-hate relationship", description: "We get it - you're relieved when it arrives but can't wait to see it go. We'll predict when your period is coming, help you manage your symptoms, and share content to help you understand how your chances of pregnancy change throughout your cycle."),
        FellQuestion(question: "Embarrassed", description: "Feeling embarrassed about your period is totally normal, but remember, it's a natural part of life for many people. We're here to provide support and information to help you feel more confident."),
        FellQuestion(question: "Hate it", description: "Having negative feelings toward your period is common. We're here to offer tips for managing discomfort and helping you feel more at ease with your body."),
        FellQuestion(question: "I want to understand it better", description: "Curiosity about your period is great! Understanding your menstrual cycle can help you feel more in control and make informed decisions about your health. We'll provide information and resources to help you learn more."),
        FellQuestion(question: "We've become friends", description: "Embracing your period as a natural part of your life is a positive step. We're here to support you on your journey and provide tools to help you navigate your menstrual cycle with confidence.")
    ]
    
    @State private var selectedQuestionIndex: Int?
    
    
    var body: some View {
        
        ZStack {
            Color.pink.opacity(0.45).ignoresSafeArea()
            VStack {
                Text("How do you feel about you period?")
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .fontWeight(.heavy)
                    .padding(.top,40)
                
                List {
                    ForEach(0..<userQuestionAnswer.count, id: \.self){ index in
                        VStack(alignment: .leading) {
                            Text(self.userQuestionAnswer[index].question)
                                .font(.system(size: 25))
                                .fontWeight(.medium)
                                .padding(.bottom,5)
                                .onTapGesture {
                                    self.selectedQuestionIndex = index == self.selectedQuestionIndex ? nil : index
                                }
                            
                            
                            if self.selectedQuestionIndex == index {
                                Text(self.userQuestionAnswer[index].description)
                                    .font(.subheadline)
                                    .foregroundColor(Color.white)
                            }
                        }
                       
                    }
                    .listRowBackground(Color.clear)
                    .padding(.bottom,20)
                }
                .scrollContentBackground(.hidden)
                .background(Color.pink.opacity(0.1).ignoresSafeArea())
                
                NavigationLink {
                    LastmenstrualCycleView()
                } label: {
                    Text("Next")
                        .foregroundStyle(Color.pink.opacity(0.7))
                        .padding(EdgeInsets(top: 15, leading: 120, bottom: 15, trailing: 120))
                        .background(Color.white.opacity(0.5).cornerRadius(5))
                }.padding(.bottom, 30)
            }
        }
        
        
    }
}

#Preview {
    FellAboutPeriodView()
}
