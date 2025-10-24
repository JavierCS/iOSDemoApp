//
//  LazyHGridDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/10/25.
//

import SwiftUI
import iOSDemoAppFoundation

struct LazyHGridDemoView: View {
    @State private var symbolNames: [String] = .init()
    
    // En lugar de columnas, ahora usamos filas
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) { // scroll horizontal
                LazyHGrid(rows: rows, spacing: 0) {
                    ForEach(symbolNames, id: \.self) { symbolName in
                        SFSymbolIcon(symbolName: symbolName)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: geometry.size.height / 4,
                                   height: geometry.size.height / 4)
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Horizontal Grid")
            .onAppear {
                Task {
                    await loadSFSymbols()
                }
            }
        }
    }
    
    private func loadSFSymbols() async {
        let symbolsLoader = SFSymbolsLoader()
        let symbolNames = symbolsLoader.loadSymbolsNames()
        await MainActor.run {
            self.symbolNames = symbolNames
        }
    }
}

#Preview {
    NavigationStack {
        LazyHGridDemoView()
    }
}
