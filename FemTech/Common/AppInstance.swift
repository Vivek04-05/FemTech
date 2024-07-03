//
//  AppInstance.swift
//  FemTech
//
//  Created by Vivek Patel on 14/06/24.
//

import Foundation
import Combine

class AppInstance: ObservableObject {
    @Published var userYearBirth: Int = 2004
    @Published var lastTimePeriodDate: Date = Date()
}
