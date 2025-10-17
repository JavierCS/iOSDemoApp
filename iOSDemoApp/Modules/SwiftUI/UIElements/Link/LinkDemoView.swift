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
            Section(.init("initialization")) {
                Link(.init("linkReference"), destination: linkUrl)
                
                Link(destination: linkUrl) {
                    Label(.init("appleDeveloperDocumentation"), systemImage: "link")
                }
            }
        }
        .navigationTitle(.init("link"))
    }
}

#Preview {
    NavigationStack {
        LinkDemoView()
    }
}
