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
            Section(.init("basicGeometryForms")) {
                Rectangle()
                    .frame(height: 100)
                    .foregroundStyle(.red)
                    .overlay {
                        Text(.init("rectangle"))
                            .foregroundStyle(.white)
                    }
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 100)
                    .foregroundStyle(.green)
                    .overlay {
                        Text(.init("roundedRectangle"))
                            .foregroundStyle(.white)
                    }
                
                Circle()
                    .foregroundStyle(.blue)
                    .overlay {
                        Text(.init("circle"))
                            .foregroundStyle(.white)
                    }
                
                Ellipse()
                    .frame(height: 100)
                    .foregroundStyle(.yellow)
                    .overlay {
                        Text(.init("ellipse"))
                            .foregroundStyle(.white)
                    }
                
                Capsule()
                    .frame(height: 100)
                    .foregroundStyle(.purple)
                    .overlay {
                        Text(.init("capsule"))
                            .foregroundStyle(.white)
                    }
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8, bottomLeading: 32, bottomTrailing: 8, topTrailing: 32))
                    .frame(height: 100)
                    .foregroundStyle(.cyan)
                    .overlay {
                        Text(.init("unevenRoundedRectangle"))
                            .foregroundStyle(.white)
                    }
            }
        }
        .navigationTitle(.init("shapes"))
    }
}

#Preview {
    NavigationStack {
        ShapesDemoView()
    }
}
