//
//  TextDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 11/08/25.
//

import SwiftUI

struct TextDemoView: View {
    var body: some View {
        list
            .navigationTitle(Text(.init("text")))
    }
    
    var list: some View {
        List {
            Section(.init("fonts")) {
                Text(.init("largeTitle"))
                    .font(.largeTitle)
                Text(.init("title"))
                    .font(.title)
                Text(.init("title2"))
                    .font(.title2)
                Text(.init("title3"))
                    .font(.title3)
                Text(.init("headline"))
                    .font(.headline)
                Text(.init("subheadline"))
                    .font(.subheadline)
                Text(.init("body"))
                    .font(.body)
                Text(.init("callout"))
                    .font(.callout)
                Text(.init("footnote"))
                    .font(.footnote)
                Text(.init("caption"))
                    .font(.caption)
                Text(.init("caption2"))
                    .font(.caption2)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TextDemoView()
    }
}
