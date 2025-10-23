//
//  DatePickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import SwiftUI

struct DatePickerDemoView: View {
    @State private var date: Date = .now
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2000, month: 1, day: 1)
        let endComponents = DateComponents(year: 2099, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from: startComponents)! ... calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        list
            .navigationTitle("Date Picker")
    }
    
    var list: some View {
        List {
            Section {
                DatePicker(selection: $date) {
                    Text("Start Date")
                    Text("Select the starting date")
                }
            }
            
            Section("Closed Range") {
                DatePicker("Start date", selection: $date, in: dateRange, displayedComponents: [.date, .hourAndMinute])
            }
            
            Section("Style") {
                DatePicker("Compact Date Picker Style", selection: $date)
                    .datePickerStyle(.compact)
                
                DatePicker("Graphical Date Picker Style", selection: $date)
                    .datePickerStyle(.graphical)
                
                DatePicker("Wheel Date Picker Style", selection: $date)
                    .datePickerStyle(.wheel)
            }
            
            Section("Tint") {
                DatePicker("Compact Date Picker Style", selection: $date)
                    .datePickerStyle(.compact)
                
                DatePicker("Graphical Date Picker Style", selection: $date)
                    .datePickerStyle(.graphical)
                
                DatePicker("Wheel Date Picker Style", selection: $date)
                    .datePickerStyle(.wheel)
            }
            .tint(.pink)
            
            Section("Displayed Components") {
                DatePicker("Default Hour And Minute Displayed Component", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
                
                DatePicker("Wheel Hour And Minute Displayed Component", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.wheel)
                
                DatePicker("Compact Date Displayed Component", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                DatePicker("Graphical Date Displayed Component", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                DatePicker("Wheel Date Displayed Component", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DatePickerDemoView()
    }
}
