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
            Section(.init("initialization")) {
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
                .frame(maxWidth: .infinity)
            }
            
            Section("tint") {
                VStack {
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


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundStyle(colorFromConfiguration(configuration))
            .padding()
            .background(.background)
            .overlay {
                Capsule()
                    .stroke(colorFromConfiguration(configuration), lineWidth: 2)
            }
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
    
    func colorFromConfiguration(_ configuration: Configuration) -> Color {
        configuration.role == .destructive ? Color(.systemRed) : Color.accentColor
    }
}

#Preview("Custom Button Style") {
    VStack {
        Button("Aceptar") {
            print("Tocado")
        }
        .buttonStyle(CustomButtonStyle())
        .padding(.horizontal)
        Spacer()
    }
}
