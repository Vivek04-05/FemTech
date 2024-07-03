//
//  PeriodTrackerView.swift
//  FemTech
//
//  Created by Vivek Patel on 05/06/24.
//

import SwiftUI

struct PeriodTrackerView: View {
    @State private var lastPeriodDate = Date()
    @State private var periodDuration = 5
    @State private var cycleLength = 28
    @State private var flowIntensity = "Medium"
    @State private var symptoms = ""
    @State private var nextPeriodDate: Date? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    DatePicker("Last Period Start Date", selection: $lastPeriodDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                
                    Stepper(value: $periodDuration, in: 1...10) {
                        Text("Period Duration: \(periodDuration) days")
                    }
                    Stepper(value: $cycleLength, in: 21...35) {
                        Text("Cycle Length: \(cycleLength) days")
                    }
                }
                
                Section(header: Text("Flow Intensity")) {
                    Picker("Flow Intensity", selection: $flowIntensity) {
                        Text("Light").tag("Light")
                        Text("Medium").tag("Medium")
                        Text("Heavy").tag("Heavy")
                    }
                    .pickerStyle(.palette)
                }
                
                Section(header: Text("Symptoms")) {
                    TextField("Describe any symptoms", text: $symptoms)
                }
                
                Button(action: calculateNextPeriod) {
                    Text("Predict Next Period")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if let nextPeriodDate = nextPeriodDate {
                                    Section(header: Text("Prediction")) {
                                        Text("Next predicted period start date: \(formattedDate(nextPeriodDate))")
                                    }
                                }
            }
            .navigationTitle("Period Tracker")
        }
    }

    func calculateNextPeriod() {
        let averageCycleLength = cycleLength
        let nextPeriodDate = Calendar.current.date(byAdding: .day, value: averageCycleLength, to: lastPeriodDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let nextPeriodDates = nextPeriodDate {
            self.nextPeriodDate = nextPeriodDates
            print("Next predicted period start date: \(dateFormatter.string(from: nextPeriodDates))")
            
        }
    }
    
    func formattedDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
}

struct PeriodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodTrackerView()
    }
}
