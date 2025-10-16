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
            .navigationTitle(Text(.init("datePicker")))
    }
    
    var list: some View {
        List {
            Section {
                DatePicker(selection: $date) {
                    Text(.init("startDate"))
                    Text(.init("selectTheStartingDate"))
                }
            }
            
            Section(.init("closedRange")) {
                DatePicker(.init("startDate"), selection: $date, in: dateRange, displayedComponents: [.date, .hourAndMinute])
            }
            
            Section(.init("style")) {
                DatePicker(.init("compactDatePickerStyle"), selection: $date)
                    .datePickerStyle(.compact)
                
                DatePicker(.init("graphicalDatePickerStyle"), selection: $date)
                    .datePickerStyle(.graphical)
                
                DatePicker(.init("wheelDatePickerStyle"), selection: $date)
                    .datePickerStyle(.wheel)
            }
            
            Section(.init("tint")) {
                DatePicker(.init("compactDatePickerStyle"), selection: $date)
                    .datePickerStyle(.compact)
                
                DatePicker(.init("graphicalDatePickerStyle"), selection: $date)
                    .datePickerStyle(.graphical)
                
                DatePicker(.init("wheelDatePickerStyle"), selection: $date)
                    .datePickerStyle(.wheel)
            }
            .tint(.pink)
            
            Section(.init("displayedComponents")) {
                DatePicker(.init("defaultHourAndMinuteDisplayedComponent"), selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
                
                DatePicker(.init("wheelHourAndMinuteDisplayedComponent"), selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.wheel)
                
                DatePicker(.init("compactDateDisplayedComponent"), selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                DatePicker(.init("graphicalDateDisplayedComponent"), selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                DatePicker(.init("wheelDateDisplayedComponent"), selection: $date, displayedComponents: [.date])
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
