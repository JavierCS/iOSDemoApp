//
//  DatePickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import SwiftUI

struct DatePickerDemoView: View {
    @State private var date: Date = .now
    
    var body: some View {
        list
            .navigationTitle(Text(.init("datePicker")))
    }
    
    var list: some View {
        List {
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
