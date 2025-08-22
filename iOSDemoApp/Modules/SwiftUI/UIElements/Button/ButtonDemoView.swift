//
//  ButtonDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 11/08/25.
//

import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
        buttonDemo
            .navigationTitle(Text(.init("button")))
    }
    
    var buttonDemo: some View {
        List {
            Section("style") {
                Button("button") { }
                Button("borderedButton") { }
                    .buttonStyle(.bordered)
                Button("borderedProminentButton") { }
                    .buttonStyle(.borderedProminent)
                Button("borderlessButton") { }
                    .buttonStyle(.borderless)
                Button("glassButton") { }
                    .buttonStyle(.glass)
                Button("glassProminentButton") { }
                    .buttonStyle(.glassProminent)
                Button("plainButton") { }
                    .buttonStyle(.plain)
            }
            
            Section("tint") {
                Button("button") { }
                    .tint(.pink)
                Button("borderedButton") { }
                    .buttonStyle(.bordered)
                    .tint(.pink)
                Button("borderedProminentButton") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.pink)
                Button("borderlessButton") { }
                    .buttonStyle(.borderless)
                    .tint(.pink)
                Button("glassButton") { }
                    .buttonStyle(.glass)
                    .tint(.pink)
                Button("glassProminentButton") { }
                    .buttonStyle(.glassProminent)
                    .tint(.pink)
                Button("plainButton") { }
                    .buttonStyle(.plain)
                    .tint(.pink)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ButtonDemoView()
    }
}
