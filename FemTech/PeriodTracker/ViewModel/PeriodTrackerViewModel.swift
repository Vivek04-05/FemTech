//
//  PeriodTrackerViewModel.swift
//  FemTech
//
//  Created by Vivek Patel on 06/06/24.
//

import Foundation

struct PeriodTrackerViewModel{
    
    func caluclateperiodDate(userAge: Int) -> Int{
        
        switch userAge {
        case 1...24 :
            return 30
        case 25...34 :
            return 29
        case 35...49 :
            return 28
        default:
            return 31
        }
    }
}
