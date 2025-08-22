//
//  ToggleDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct ToggleDemoView: View {
    @State private var isToggleOn: Bool = true
    @State private var offState: Bool = false
    
    var body: some View {
        list
            .navigationTitle(Text(.init("Toggle")))
    }
    
    var list: some View {
        List {
            Toggle(isOn: $isToggleOn) {
                Label("toggle", systemImage: "switch.2")
            }
            
            Toggle(.init("toggle"), isOn: $isToggleOn)
                .tint(.blue)
            
            Toggle(.init("toggle"), isOn: $offState)
            
            Toggle(.init("toggle"), isOn: $isToggleOn)
                .disabled(true)
        }
    }
}

#Preview {
    NavigationStack {
        ToggleDemoView()
    }
}
