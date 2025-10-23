//
//  CustomButtonStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/10/25.
//

import SwiftUI

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
        Button("Aceptar") { }
        .buttonStyle(CustomButtonStyle())
        .padding(.horizontal)
}
