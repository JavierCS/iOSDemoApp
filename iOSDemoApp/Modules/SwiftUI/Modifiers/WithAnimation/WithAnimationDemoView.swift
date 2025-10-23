//
//  WithAnimationDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/10/25.
//

import SwiftUI

enum DemoAnimation: String, CaseIterable, Identifiable {
    case def = "default"
    case bouncy
    case easeIn
    case easeInOut
    case easeOut
    case interactiveSpring
    case interpolatingSpring
    case linear
    case smooth
    case snappy
    case spring
    
    var id: Self { self }
    
    func animation() -> Animation {
        switch self {
        case .def: return .default
        case .bouncy: return .bouncy
        case .easeIn: return .easeIn
        case .easeInOut: return .easeInOut
        case .easeOut: return .easeOut
        case .interactiveSpring: return .interactiveSpring
        case .interpolatingSpring: return .interpolatingSpring
        case .linear: return .linear
        case .smooth: return .smooth
        case .snappy: return .snappy
        case .spring: return .spring
        }
    }
}

struct WithAnimationDemoView: View {
    @State private var animation: DemoAnimation = .def
    @State private var growed: Bool = false
    
    let normalSize: CGSize = .init(width: 50, height: 50)
    let bigSize: CGSize = .init(width: 100, height: 100)
    
    var shape: some View {
        Circle()
            .frame(width: growed ? bigSize.width : normalSize.height, height: growed ? bigSize.height : normalSize.height)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Picker(selection: $animation) {
                ForEach(DemoAnimation.allCases) { animation in
                    Text(animation.rawValue.capitalizedFirst)
                }
            } label: {
                Label("Animation", systemImage: "swift")
            }
            .pickerStyle(.navigationLink)

            shape
        }
        .padding()
        .navigationTitle("With Animation")
        .navigationSubtitle("Returns the result of recomputing the view's body with the provided animation")
        .toolbar {
            ToolbarSpacer(.flexible, placement: .bottomBar)
            ToolbarItem(placement: .bottomBar) {
                Button(growed ? "Normal Size" : "Growed Size") {
                    withAnimation(animation.animation()) {
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
