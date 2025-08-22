//
//  SliderDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct SliderDemoView: View {
    @State private var value: CGFloat = 50
    
    var body: some View {
        list
            .navigationTitle(Text(.init("slider")))
    }
    
    var list: some View {
        List {
            Slider(value: $value)
        }
    }
}

#Preview {
    NavigationStack {
        SliderDemoView()
    }
}
