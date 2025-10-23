//
//  SliderDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct SliderDemoView: View {
    @State private var valueOne: CGFloat = 50
    @State private var valueTwo: CGFloat = 50
    @State private var valueThree: CGFloat = 0
    @State private var color: Color = .primary
    @State private var isEditing = false
    
    var body: some View {
        list
            .navigationTitle("Slider")
    }
    
    var list: some View {
        List {
            Section("Initialization") {
                Slider(value: $valueOne, in: 0...100, step: 5)
                
                Slider(value: $valueThree, in: 0...10, step: 1, neutralValue: nil, enabledBounds: nil) {
                    Text("Label")
                } currentValueLabel: {
                    Text("\(valueThree)")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                .foregroundStyle(isEditing ? Color.primary : Color.gray)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SliderDemoView()
    }
}
