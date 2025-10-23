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
            .navigationTitle("Toggle")
    }
    
    var list: some View {
        List {
            Toggle(isOn: $isToggleOn) {
                Label("Labeled", systemImage: "switch.2")
            }
            
            Toggle("Tinted", isOn: $isToggleOn)
                .tint(.blue)
            
            Toggle("Off State", isOn: $offState)
            
            Toggle("Disabled", isOn: $isToggleOn)
                .disabled(true)
            
            Section("Style") {
                HStack {
                    Text("Button Style")
                    Spacer()
                    Toggle("Toggle", isOn: $isToggleOn)
                        .toggleStyle(.button)
                }
                
                Toggle("Switch Style", isOn: $isToggleOn)
                    .toggleStyle(.switch)
                
                HStack {
                    Text("Custom Style")
                    Spacer()
                    Toggle(.init(String.empty), isOn: $isToggleOn)
                        .toggleStyle(VintageToggleStyle())
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToggleDemoView()
    }
}
