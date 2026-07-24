//
//  ScrollHintDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/07/26.
//

import SwiftUI

struct ScrollHintDemoView: View {
    let items = SimpleListItem.allCases
    @State private var animate: Bool = false
    
    var body: some View {
        content
            .navigationTitle("Scroll Hints")
    }
    
    var content: some View {
        VStack {
            ScrollHintView(items: items, behavior: .onAction(animate: $animate))
        }
    }
}

#Preview {
    ScrollHintDemoView()
}
