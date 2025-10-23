//
//  NavigationSplitViewDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 11/08/25.
//

import SwiftUI

struct NavigationSplitViewDemoView: View {
    @State private var query: String = ""
    @State private var selection: SimpleListItem?
    @State private var columnVisibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        navigationSplitView
            .navigationTitle("Navigation Split View")
    }
    
    var navigationSplitView: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(SimpleListItem.allCases, id: \.self, selection: $selection) { item in
                Text(item.rawValue)
            }.navigationTitle("items")
        } detail: {
            if let item = selection {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                    .navigationTitle(item.rawValue)
            } else {
                ContentUnavailableView(
                    "selectAnItem",
                    systemImage: "folder",
                    description: Text("Choose one from the sidebar")
                )
            }
        }
        .searchable(
            text: $query,
            placement: .automatic,
            prompt: Text("What are you looking for?")
        )
    }
}

#Preview {
    NavigationSplitViewDemoView()
}
