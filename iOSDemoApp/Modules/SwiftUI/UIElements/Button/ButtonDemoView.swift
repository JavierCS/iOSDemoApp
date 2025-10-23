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
            .navigationTitle("Button")
    }
    
    var buttonDemo: some View {
        List {
            Section("Initialization") {
                VStack {
                    Button("Button") { }
                    .buttonStyle(.glassProminent)
                    
                    Button { } label: {
                        Label("Button", systemImage: "swift")
                    }
                    .buttonStyle(.glass)
                    
                    Button { } label: {
                        Image(systemName: "apple.logo")
                    }
                    .buttonStyle(.glassProminent)
                }
                .frame(maxWidth: .infinity)
            }
            
            Section("style") {
                VStack {
                    Button("Button") { }
                    Button("Bordered Button") { }
                        .buttonStyle(.bordered)
                    Button("Bordered Prominent Button") { }
                        .buttonStyle(.borderedProminent)
                    Button("Borderless Button") { }
                        .buttonStyle(.borderless)
                    Button("Glass Button") { }
                        .buttonStyle(.glass)
                    Button("Glass Prominent Button") { }
                        .buttonStyle(.glassProminent)
                    Button("Plain Button") { }
                        .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity)
            }
            
            Section("Tint") {
                VStack {
                    Button("Button") { }
                        .tint(.pink)
                    Button("Bordered Button") { }
                        .buttonStyle(.bordered)
                        .tint(.pink)
                    Button("Bordered Prominent Button") { }
                        .buttonStyle(.borderedProminent)
                        .tint(.pink)
                    Button("Borderless Button") { }
                        .buttonStyle(.borderless)
                        .tint(.pink)
                    Button("Glass Button") { }
                        .buttonStyle(.glass)
                        .tint(.pink)
                    Button("Glass Prominent Button") { }
                        .buttonStyle(.glassProminent)
                        .tint(.pink)
                    Button("Plain Button") { }
                        .buttonStyle(.plain)
                        .tint(.pink)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ButtonDemoView()
    }
}



