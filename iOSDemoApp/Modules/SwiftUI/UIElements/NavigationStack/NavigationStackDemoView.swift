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
                    .navigationTitle(Text(.init("someOtherEmptyView")))
            } label: {
                Text(.init("showOtherView"))
            }
            .navigationTitle(Text(.init("someEmptyView")))
        }
    }
}

#Preview {
    NavigationStackDemoView()
}
