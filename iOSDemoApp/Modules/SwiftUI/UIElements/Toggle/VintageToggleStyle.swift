//
//  VintageToggleStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 15/10/25.
//

import SwiftUI

struct VintageToggleStyle: ToggleStyle {
    var onColor: Color = .green
    var offColor: Color = .gray.opacity(0.4)
    var knobColor: Color = .white
    var height: CGFloat = 32
    var padding: CGFloat = 2
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                Capsule()
                    .fill(configuration.isOn ? onColor : offColor)
                
                Circle()
                    .fill(knobColor)
                    .shadow(radius: 1)
                    .padding(padding)
            }
            .frame(width: height * 1.9, height: height)
            .animation(.spring(response: 0.25, dampingFraction: 0.9), value: configuration.isOn)
            .onTapGesture {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                    configuration.isOn.toggle()
                }
            }
            .accessibilityAddTraits(.isButton)
            .accessibilityValue(Text(configuration.isOn ? "Activado" : "Desactivado"))
        }
        .contentShape(Rectangle()) // facilita el toque en el área del HStack
        .onTapGesture {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                configuration.isOn.toggle()
            }
        }
    }
}

#Preview("CustomStyle") {
    @Previewable @State var isOn: Bool = false
    Toggle(.init("customStyle"), isOn: $isOn)
        .toggleStyle(VintageToggleStyle())
}
