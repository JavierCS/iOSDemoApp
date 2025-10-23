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
    
    var body: some View {
        List {
            HStack {
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor, isActive: isConnecting)
                
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor.cumulative.reversing, isActive: isConnecting)
                
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor.iterative.reversing, isActive: isConnecting)
                
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor.iterative.reversing, isActive: isConnecting)
                    .symbolEffect(.scale.up)
                
                Spacer()
                
                Button(isConnecting ? "Conect" : "Disconect") {
                    isConnecting.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            
            HStack {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .symbolEffect(.bounce, value: bounceValue)
                
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .symbolEffect(.bounce, options: .repeat(2), value: bounceValue)
                
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .symbolEffect(.variableColor.iterative, options: .repeat(2), value: bounceValue)
                
                Spacer()
                
                Button("Bounce") { bounceValue += 1 }
                    .buttonStyle(.borderedProminent)
            }
            
            HStack {
                Image(systemName: isPaused ? "play.fill" : "pause.fill")
                    .contentTransition(.symbolEffect(.replace.offUp))
                
                Spacer()
                
                Button(isPaused ? "Play" : "Pause") { isPaused.toggle() }
                    .buttonStyle(.borderedProminent)
            }
            
            HStack {
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                        
                        Image(systemName: "moon.stars")
                            .symbolEffect(.disappear, isActive: isMoonHiden)
                        
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                        
                        if !isMoonHiden {
                            Image(systemName: "moon.stars")
                                .transition(.symbolEffect(.disappear.down))
                        }
                        
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                        
                        if !isMoonHiden {
                            Image(systemName: "moon.stars")
                                .transition(.symbolEffect(.automatic))
                        }
                        
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(.lightGray))
                    }
                }
                
                Spacer()
                
                Button(isMoonHiden ? "Show" : "Hide") {
                    withAnimation {
                        isMoonHiden.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            HStack { // Effects propagate through the view hierarchy
                Image(systemName: "heart.fill")
                Image(systemName: "apple.logo")
                Image(systemName: "swift")
                    .symbolEffectsRemoved()
            }
            .symbolEffect(.bounce, options: .repeat(2))
            .frame(maxWidth: .infinity)
            
            Image(systemName: "iphone.radiowaves.left.and.right")
                .symbolEffect(.scale.up, isActive: isScaledUp)
                .onAppear {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        isScaledUp = true
                    }
                }
            
            HStack {
                Image(systemName: "wifi", variableValue: wifiLevel)
                
                Spacer()
                
                Stepper(String.empty, value: $wifiLevel, in: 0.0...1.0, step: 0.1)
            }
        }
        .navigationTitle("Symbol Effect")
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
