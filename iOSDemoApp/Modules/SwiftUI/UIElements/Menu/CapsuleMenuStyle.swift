//
//  CapsuleMenuStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/10/25.
//

import SwiftUI

struct CapsuleMenuStyle: MenuStyle {
    var fill: Color = .blue.opacity(0.12)
    var border: Color = .secondary.opacity(0.25)
    var paddingV: CGFloat = 10
    var paddingH: CGFloat = 14

    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)                // 🔑 mantiene el contenido del menú
            .menuIndicator(.hidden)        // ocultar chevron nativo si quieres
            .buttonStyle(.plain)           // evita estilos de botón heredados
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .background(fill, in: Capsule())
            .overlay(Capsule().stroke(border))
    }
}
