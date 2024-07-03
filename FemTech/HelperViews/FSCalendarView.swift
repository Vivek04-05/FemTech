//
//  FSCalendarView.swift
//  FemTech
//
//  Created by Vivek Patel on 19/06/24.
//

import SwiftUI
import FSCalendar

struct FSCalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date?
    @Binding var scope: FSCalendarScope
    @Binding var lastPeriodDate: Date?
    @Binding var nextPerioddate: Date?
    
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {
        var parent: FSCalendarView
        
        init(parent: FSCalendarView) {
            self.parent = parent
            
            
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
            
        }
        
        
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            
            return nil
        }
        
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
            if let lastPeriodDate = parent.lastPeriodDate, Calendar.current.isDate(date, inSameDayAs: lastPeriodDate) {
                return .purple
            }
            if let nextPeriodDate = parent.nextPerioddate, Calendar.current.isDate(date, inSameDayAs: nextPeriodDate) {
                return .magenta
            }
            return nil
        }
        //        func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition){
        //
        //            if let lastPeriodDate = parent.lastPeriodDate, Calendar.current.isDate(date, inSameDayAs: lastPeriodDate) {
        //                            addLabel(to: cell, text: "Last Period", color: .black)
        //                        }
        //                        if let nextPeriodDate = parent.nextPerioddate, Calendar.current.isDate(date, inSameDayAs: nextPeriodDate) {
        //                            addLabel(to: cell, text: "Next Period", color: .blue)
        //                        }
        //        }
        
        private func addLabel(to cell: FSCalendarCell, text: String, color: UIColor) {
            let label = UILabel(frame: CGRect(x: 0, y: cell.bounds.height - 20, width: cell.bounds.width, height: 20))
            label.font = UIFont.systemFont(ofSize: 10)
            label.text = text
            label.textAlignment = .center
            label.textColor = color
            cell.addSubview(label)
        }
        
        // Need reload to have fill colors display correctly after calendar page changes
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            calendar.reloadData()
        }
        
        //        func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        //            calendar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 300)
        //            // Do other updates here
        //        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.appearance.selectionColor = .systemPink
        //        calendar.appearance.todayColor  = .green
        //        calendar.appearance.separators = .interRows
        //        calendar.today = nil
        
        // Customize appearance if needed
        //        calendar.appearance.headerTitleColor = .systemPurple
        //        calendar.appearance.weekdayTextColor = .systemPurple
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        
        calendar.scope = .week
        print(lastPeriodDate)
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        // Update the UI if needed
        uiView.scope = scope
    }
    
    
}

