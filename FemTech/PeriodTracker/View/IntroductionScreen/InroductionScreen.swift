//
//  SwiftUIView.swift
//  FemTech
//
//  Created by Vivek Patel on 06/06/24.
//

import SwiftUI

struct InroductionScreen: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.pink.opacity(0.45).ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack {
                        Text("Hello !")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.white)
                            .padding(.bottom,5)
                        Text("Welcome to FemTech App")
                            .foregroundStyle(Color.white)
                            .padding()
                            .background(Color.pink.opacity(0.2).cornerRadius(5))
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: WhenYouBornView()) {
                        Text("Next")
                            .foregroundStyle(Color.pink.opacity(0.7))
                            .padding(EdgeInsets(top: 15, leading: 120, bottom: 15, trailing: 120))
                            .background(Color.white.opacity(0.5).cornerRadius(5))
                    }.padding(.bottom, 30)
                
                }
                
            }
        }
    }
}

#Preview {
    InroductionScreen()
}
