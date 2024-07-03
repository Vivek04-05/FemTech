//
//  FemTechApp.swift
//  FemTech
//
//  Created by Vivek Patel on 05/06/24.
//

import SwiftUI

@main
struct FemTechApp: App {
    
    @StateObject private var appInstance = AppInstance()
    
    var body: some Scene {
        WindowGroup {
//            NextPeriodDateView()
            InroductionScreen()
                .environmentObject(appInstance)
        }
    }
}
