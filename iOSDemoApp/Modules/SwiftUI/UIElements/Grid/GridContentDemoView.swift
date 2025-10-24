//
//  GridContentDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/10/25.
//

import SwiftUI

struct GridContentDemoView: View {
    var body: some View {
        List {
            NavigationLink {
                GridDemoView()
            } label: {
                Label("Grid", systemImage: "square.grid.3x3")
            }

            NavigationLink {
                LazyVGridDemoView()
            } label: {
                Label("Lazy V Grid", systemImage: "square.grid.3x3")
            }
            
            NavigationLink {
                LazyHGridDemoView()
            } label: {
                Label("Lazy H Grid", systemImage: "square.grid.3x3")
            }
        }
        .navigationTitle("Grid")
    }
}

#Preview {
    NavigationStack {
        GridContentDemoView()
    }
}
