//
//  LeadingIconLabelStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 16/10/25.
//

import SwiftUI

struct LeadingIconLabelStyle: LabelStyle {
    let spacing: CGFloat
    
    init(spacing: CGFloat = 16) {
        self.spacing = spacing
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
                .foregroundStyle(Color.accentColor)
            configuration.title
        }
    }
}

#Preview {
    Label("Label", systemImage: "swift")
        .labelStyle(LeadingIconLabelStyle())
}
