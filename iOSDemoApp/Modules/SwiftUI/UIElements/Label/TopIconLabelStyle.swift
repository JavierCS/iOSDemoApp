//
//  TopIconLabelStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 16/10/25.
//

import SwiftUI

struct TopIconLabelStyle: LabelStyle {
    let spacing: CGFloat?
    
    init(spacing: CGFloat? = nil) {
        self.spacing = spacing
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: spacing) {
            configuration.icon
                .foregroundStyle(Color.accentColor)
            configuration.title
        }
    }
}

#Preview {
    Label("Label", systemImage: "swift")
        .labelStyle(TopIconLabelStyle())
}
