//
//  StacksDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

enum StackHorientation: String, CaseIterable {
    case v = "V Stack"
    case h = "H Stack"
    case z = "Z Stack"
    
    func systemImageName() -> String {
        switch self {
        case .v:
            "arrow.down"
        case .h:
            "arrow.right"
        case .z:
            "square.stack.3d.up"
        }
    }
}

struct StacksDemoView: View {
    @State private var horientation: StackHorientation = .v
    
    var body: some View {
        List {
            Section(horientation.rawValue) {
                getStack()
            }
        }
        .navigationTitle("Stack View")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Picker(.init(.empty), selection: $horientation) {
                        ForEach(StackHorientation.allCases, id: \.self) { horientation in
                            Label(horientation.rawValue, systemImage: horientation.systemImageName()).tag(horientation)
                        }
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                }

            }
        }
    }
    
    @ViewBuilder
    private func getStack() -> some View {
        switch horientation {
        case .v:
            VStack {
                getShapes()
            }
            .frame(maxWidth: .infinity)
        case .h:
            HStack {
                getShapes()
            }
        case .z:
            ZStack {
                getShapes()
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    private func getShapes() -> some View {
        Rectangle()
            .frame(width: 100, height: 150)
            .foregroundStyle(.red)
        Circle()
            .frame(width: 90, height: 90)
            .foregroundStyle(.green)
        Ellipse()
            .frame(width: 80, height: 45)
            .foregroundStyle(.blue)
    }
}

#Preview {
    NavigationStack {
        StacksDemoView()
    }
}
