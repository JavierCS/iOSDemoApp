//
//  CustomComponentsList.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/07/26.
//

import SwiftUI

struct CustomComponentsList: View {
    var body: some View {
        componentsList
            .navigationTitle("Custom Components")
    }
    
    var componentsList: some View {
        List {
            NavigationLink {
                ScrollHintDemoView()
            } label: {
                Label {
                    Text("Scroll Hints")
                    Text("Custom animation to indicate that you can srcoll an element")
                } icon: {
                    Image(systemName: "appwindow.swipe.rectangle")
                }
            }

        }
        .listStyle(.sidebar)
    }
}

#Preview {
    NavigationStack {
        CustomComponentsList()
    }
}
