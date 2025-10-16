//
//  CheckBoxToggleStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 16/10/25.
//

import SwiftUI

struct CheckBoxToggleStyle: ToggleStyle {
    var size: CGFloat = 22
    var strokeColor: Color = .secondary
    var fillColorOn: Color = .accentColor
    var cornerRadius: CGFloat = 6

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(strokeColor, lineWidth: 1)

                if configuration.isOn {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(fillColorOn.opacity(0.15))

                    Image(systemName: "checkmark")
                        .font(.system(size: size * 0.6, weight: .bold))
                        .foregroundStyle(fillColorOn)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .frame(width: size, height: size)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.15)) {
                    configuration.isOn.toggle()
                }
            }

            configuration.label
                .onTapGesture { // también permite tocar el texto
                    withAnimation(.easeInOut(duration: 0.15)) {
                        configuration.isOn.toggle()
                    }
                }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("Casilla de verificación"))
        .accessibilityValue(Text(configuration.isOn ? "Marcado" : "Sin marcar"))
    }
}

#Preview("CheckBox Toggle Styl") {
    @Previewable @State var isOn: Bool = false
    
    VStack {
        Toggle(isOn: $isOn) {
            Label("Check Box Toggle Style", systemImage: "switch.2")
        }
        .toggleStyle(CheckBoxToggleStyle())
    }
}
