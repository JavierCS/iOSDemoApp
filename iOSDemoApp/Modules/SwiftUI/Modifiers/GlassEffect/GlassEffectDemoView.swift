//
//  GlassEffectDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct GlassEffectDemoView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Button("To Top", systemImage: "chevron.up") {
                
            }
            .padding()
            .glassEffect()
        }
    }
}

#Preview {
    GlassEffectDemoView()
}
