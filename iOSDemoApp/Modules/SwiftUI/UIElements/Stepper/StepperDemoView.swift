//
//  StepperDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct StepperDemoView: View {
    @State private var value: Int = 0
    @State private var valueTwo: Int = 5
    @State private var valueThree: Int = 10
    
    @State private var valueFour: Int = 0
    let colors: [Color] = [
        .orange,
        .red,
        .gray,
        .blue,
        .pink,
        .yellow,
        .purple,
        .green,
        .brown,
        .black
    ]
    func incrementStep() {
        valueFour += 1
        if valueFour >= colors.count { valueFour = 0 }
    }
    func decrementStep() {
        valueFour -= 1
        if valueFour < 0 { valueFour = colors.count - 1 }
    }
    
    @State private var valueFive: Int = 0
    let step = 5
    let range = 0...50
    
    var body: some View {
        List {
            Section("Default") {
                Stepper(value: $value, in: 0...10) {
                    Label("\(value)", systemImage: "shoeprints.fill")
                }
                Stepper(value: $valueTwo, in: 0...10) {
                    Label("\(valueTwo)", systemImage: "shoeprints.fill")
                }
                Stepper(value: $valueThree, in: 0...10) {
                    Label("\(valueThree)", systemImage: "shoeprints.fill")
                }
            }
            
            Section("Dissabled") {
                Stepper(value: $valueTwo, in: 0...10) {
                    Label("\(valueTwo)", systemImage: "shoeprints.fill")
                }
                .disabled(true)
            }
            
            Section("Tinted with change behavior") {
                Stepper {
                    Label("Value: \(valueFour) Color: \(colors[valueFour].description)", systemImage: "shoeprints.fill")
                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
                .foregroundStyle(colors[valueFour])
            }
            
            Section("Custom Step") {
                Stepper(value: $valueFive, in: range, step: step) {
                    Label("\(valueFive) in \(range.description) stepping by \(step)", systemImage: "shoeprints.fill")
                }
            }
        }
        .navigationTitle(Text(.init("stepper")))
    }
}

#Preview {
    NavigationStack {
        StepperDemoView()
    }
}
