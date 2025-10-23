//
//  NavigationStackDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct NavigationStackDemoView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                EmptyView()
                    .navigationTitle("Some Other Empty View")
            } label: {
                Text("Show other view")
            }
            .navigationTitle("Some Empty View")
        }
    }
}

#Preview {
    NavigationStackDemoView()
}
