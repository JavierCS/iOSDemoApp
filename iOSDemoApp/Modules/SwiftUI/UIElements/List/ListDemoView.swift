//
//  ListDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct ListDemoView: View {
    var body: some View {
        ItemsList()
            .navigationTitle("List")
    }
}

#Preview {
    NavigationStack {
        ListDemoView()
    }
}
