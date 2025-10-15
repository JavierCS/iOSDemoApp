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
                Label(.init("labeled"), systemImage: "switch.2")
            }
            
            Toggle(.init("tinted"), isOn: $isToggleOn)
                .tint(.blue)
            
            Toggle(.init("offState"), isOn: $offState)
            
            Toggle(.init("disabled"), isOn: $isToggleOn)
                .disabled(true)
            
            Section(.init("style")) {
                HStack {
                    Text(.init("buttonStyle"))
                    Spacer()
                    Toggle(.init("toggle"), isOn: $isToggleOn)
                        .toggleStyle(.button)
                }
                
                Toggle(.init("switchStyle"), isOn: $isToggleOn)
                    .toggleStyle(.switch)
                
                HStack {
                    Text(.init("customStyle"))
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


