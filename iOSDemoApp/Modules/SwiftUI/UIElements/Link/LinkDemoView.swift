//
//  LinkDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct LinkDemoView: View {
    let linkUrl = URL(string: "https://developer.apple.com/documentation/SwiftUI/Link")!
    
    var body: some View {
        List {
            Section("Initialization") {
                Link("Link Reference", destination: linkUrl)
                
                Link(destination: linkUrl) {
                    Label("Apple Developer Documentation", systemImage: "link")
                }
            }
        }
        .navigationTitle("Link")
    }
}

#Preview {
    NavigationStack {
        LinkDemoView()
    }
}
