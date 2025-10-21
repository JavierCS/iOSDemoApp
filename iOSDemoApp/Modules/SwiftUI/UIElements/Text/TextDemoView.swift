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
            
            Section(.init("fontWeight")) {
                Text(.init("black")).fontWeight(.black)
                Text(.init("black")).fontWeight(.heavy)
                Text(.init("black")).fontWeight(.bold)
                Text(.init("black")).fontWeight(.semibold)
                Text(.init("black")).fontWeight(.medium)
                Text(.init("black")).fontWeight(.regular)
                Text(.init("black")).fontWeight(.light)
                Text(.init("black")).fontWeight(.thin)
                Text(.init("black")).fontWeight(.ultraLight)
            }
            
            Section(.init("fontWidth")) {
                Text("Test").fontWidth(.compressed)
                Text("Test").fontWidth(.condensed)
                Text("Test").fontWidth(.standard)
                Text("Test").fontWidth(.expanded)
            }
            
            Section(.init("fontDesign")) {
                Text("test").fontDesign(.default)
                Text("test").fontDesign(.monospaced)
                Text("test").fontDesign(.rounded)
                Text("test").fontDesign(.serif)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TextDemoView()
    }
}
