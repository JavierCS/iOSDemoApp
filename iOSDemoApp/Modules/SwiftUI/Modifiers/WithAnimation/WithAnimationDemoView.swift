//
//  WithAnimationDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/10/25.
//

import SwiftUI

struct WithAnimationDemoView: View {
    @State private var growed: Bool = false
    
    let normalSize: CGSize = .init(width: 50, height: 50)
    let bigSize: CGSize = .init(width: 100, height: 100)
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: growed ? bigSize.width : normalSize.height, height: growed ? bigSize.height : normalSize.height)
        }
        .navigationTitle("With Animation")
        .navigationSubtitle("Returns the result of recomputing the view's body with the provided animation")
        .toolbar {
            ToolbarSpacer(.flexible, placement: .bottomBar)
            ToolbarItem(placement: .bottomBar) {
                Button(growed ? "Normal Size" : "Growed Size") {
                    withAnimation(.easeIn) {
                        growed.toggle()
                    }
                }
                .buttonStyle(.glassProminent)
                .tint(.pink)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WithAnimationDemoView()
    }
}
