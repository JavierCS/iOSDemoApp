//
//  SymbolEffectDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/10/25.
//

import SwiftUI

struct SymbolEffectDemoView: View {
    @State private var isConnecting: Bool = true
    @State private var bounceValue: Int = 0
    @State private var isPaused: Bool = true
    @State private var isMoonHiden: Bool = false
    @State private var isScaledUp: Bool = false
    @State private var wifiLevel: Double = 0
    
    var routerSymbols: some View {
        HStack {
            resizedImage(systemName: "wifi.router")
                .symbolEffect(.variableColor, isActive: isConnecting)
            
            resizedImage(systemName: "wifi.router")
                .symbolEffect(.variableColor.cumulative.reversing, isActive: isConnecting)
            
            resizedImage(systemName: "wifi.router")
                .symbolEffect(.variableColor.iterative.reversing, isActive: isConnecting)
        }
    }
    
    var antennaSymbols: some View {
        HStack {
            resizedImage(systemName: "antenna.radiowaves.left.and.right")
                .symbolEffect(.bounce, value: bounceValue)
            
            resizedImage(systemName: "antenna.radiowaves.left.and.right")
                .symbolEffect(.bounce, options: .repeat(2), value: bounceValue)
            
            resizedImage(systemName: "antenna.radiowaves.left.and.right")
                .symbolEffect(.variableColor.iterative, options: .repeat(2), value: bounceValue)
        }
    }
    
    var moonSymbols: some View {
        VStack {
            imageBetweenShapes()
                .symbolEffect(.disappear, isActive: isMoonHiden)
            imageBetweenShapesTwo()
                .transition(.symbolEffect(.disappear.down))
            imageBetweenShapesTwo()
                .transition(.symbolEffect(.automatic))
        }
    }
    
    var groupedSymbols: some View {
        HStack { // Effects propagate through the view hierarchy
            Image(systemName: "heart.fill")
            Image(systemName: "apple.logo")
            Image(systemName: "swift")
                .symbolEffectsRemoved()
        }
        .symbolEffect(.bounce, options: .repeat(2))
        .frame(maxWidth: .infinity)
    }
    
    var list: some View {
        List {
            VStack(spacing: 16) {
                routerSymbols
                    .frame(maxWidth: .infinity)
                
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor.iterative.reversing, isActive: isConnecting)
                    .symbolEffect(.scale.up)
                
                Button(isConnecting ? "Conect" : "Disconect") {
                    isConnecting.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            
            VStack(spacing: 16) {
                antennaSymbols
                    .frame(maxWidth: .infinity)
                
                Button("Bounce") { bounceValue += 1 }
                    .buttonStyle(.borderedProminent)
            }
            
            VStack(spacing: 16) {
                resizedImage(systemName: isPaused ? "play.fill" : "pause.fill" )
                    .contentTransition(.symbolEffect(.replace.downUp))

                Button(isPaused ? "Play" : "Pause") { isPaused.toggle() }
                    .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                moonSymbols
                
                Button(isMoonHiden ? "Show" : "Hide") {
                    withAnimation {
                        isMoonHiden.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity)
            
            groupedSymbols
            
            VStack(spacing: 16) {
                resizedImage(systemName: "wifi", variableValue: wifiLevel)
                
                
                Stepper(String.empty, value: $wifiLevel, in: 0.0...1.0, step: 0.1).labelsHidden()
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var body: some View {
        list
        .navigationTitle("Symbol Effect")
    }
    
    func resizedImage(systemName: String, variableValue: Double? = nil) -> some View {
        Image(systemName: systemName, variableValue: variableValue)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
    }
    
    func imageBetweenShapes() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 50, height: 50)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(Color(.lightGray))
            
            resizedImage(systemName: "moon.stars")
            
            Circle()
                .frame(height: 50)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    func imageBetweenShapesTwo() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 50, height: 50)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(Color(.lightGray))
            
            if !isMoonHiden {
                resizedImage(systemName: "moon.stars")
            }
            
            Circle()
                .frame(height: 50)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color(.lightGray))
        }
    }
}

// MAGIC REPLACE
// https://developer.apple.com/videos/play/wwdc2023/10197 Explicación capas
// https://developer.apple.com/videos/play/wwdc2023/10258 Código Animaciones

#Preview {
    NavigationStack {
        SymbolEffectDemoView()
    }
}
