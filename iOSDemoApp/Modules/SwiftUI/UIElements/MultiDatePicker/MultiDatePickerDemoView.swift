//
//  MultiDatePickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 15/10/25.
//

import SwiftUI

struct MultiDatePickerDemoView: View {
    @State private var selected: Set<DateComponents> = .init()
    
    var body: some View {
        VStack {
            MultiDatePicker(.init("selectSomeDates"), selection: $selected)
        }
    }
}

#Preview {
    MultiDatePickerDemoView()
}
