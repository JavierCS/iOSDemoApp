//
//  TabViewDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 17/08/25.
//

import SwiftUI

struct TabViewDemoView: View {
    @State private var text: String = ""
    
    var body: some View {
        TabView {
            Tab("tabOne", systemImage: "apple.logo") {
                ItemsList()
            }
            
            Tab("tabTwo", systemImage: "apple.logo") {
                ItemsList()
            }
            
            Tab("tabThree", systemImage: "apple.logo") {
                ItemsList()
            }
            
            Tab(role: .search) {
                ItemsList()
            }
        }
        .searchable(text: $text)
    }
}

#Preview {
    NavigationStack {
        TabViewDemoView()
    }
}
