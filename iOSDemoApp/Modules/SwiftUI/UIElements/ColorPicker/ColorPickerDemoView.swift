//
//  ColorPickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 20/10/25.
//

import SwiftUI

struct ColorPickerDemoView: View {
    @State private var selectedColor: Color = Color.accentColor
    
    var body: some View {
        List {
            Section("Initialization") {
                ColorPicker("Select a color", selection: $selectedColor)
                
                ColorPicker("Select a color with opacity", selection: $selectedColor, supportsOpacity: true)
                
                ColorPicker(selection: $selectedColor) {
                    Label("Select a color", systemImage: "paintpalette")
                }
            }
        }
        .navigationTitle("Color Picker")
    }
}

#Preview {
    NavigationStack {
        ColorPickerDemoView()
    }
}
