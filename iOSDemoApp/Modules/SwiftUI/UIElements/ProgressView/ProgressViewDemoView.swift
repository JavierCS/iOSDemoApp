//
//  ProgressViewDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import SwiftUI

enum DemoProgressViewStyle {
    case circular
    case linear(value: CGFloat, total: CGFloat)
}

struct ProgressViewDemoView: View {
    var body: some View {
        list
            .navigationTitle(Text(.init("progressView")))
    }
    
    var list: some View {
        List {
            Section(.init("style")) {
                progressView()
                progressView(style: .linear(value: 50, total: 100))
            }
            
            Section(.init("tint")) {
                progressView()
                progressView(style: .linear(value: 50, total: 100))
            }.tint(.pink)
        }
    }
    
    @ViewBuilder
    func progressView(style: DemoProgressViewStyle = .circular) -> some View {
        HStack {
            Spacer()
            switch style {
            case .circular:
                ProgressView()
            case .linear(let value, let total):
                ProgressView(value: value, total: total)
                    .progressViewStyle(.linear)
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ProgressViewDemoView()
    }
}
