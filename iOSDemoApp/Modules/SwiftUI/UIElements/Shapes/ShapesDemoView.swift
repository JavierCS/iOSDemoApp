//
//  ShapesDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct ShapesDemoView: View {
    var body: some View {
        List {
            Section("Basic Geometry Forms") {
                Rectangle()
                    .frame(height: 100)
                    .foregroundStyle(.red)
                    .overlay {
                        Text("Rectangle")
                            .foregroundStyle(.white)
                    }
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 100)
                    .foregroundStyle(.green)
                    .overlay {
                        Text("Rounded Rectangle")
                            .foregroundStyle(.white)
                    }
                
                Circle()
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("Circle")
                            .foregroundStyle(.white)
                    }
                
                Ellipse()
                    .frame(height: 100)
                    .foregroundStyle(.yellow)
                    .overlay {
                        Text("Ellipse")
                            .foregroundStyle(.white)
                    }
                
                Capsule()
                    .frame(height: 100)
                    .foregroundStyle(.purple)
                    .overlay {
                        Text("Capsule")
                            .foregroundStyle(.white)
                    }
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8, bottomLeading: 32, bottomTrailing: 8, topTrailing: 32))
                    .frame(height: 100)
                    .foregroundStyle(.cyan)
                    .overlay {
                        Text("Uneven Rounded Rectangle")
                            .foregroundStyle(.white)
                    }
            }
        }
        .navigationTitle("Shapes")
    }
}

#Preview {
    NavigationStack {
        ShapesDemoView()
    }
}
