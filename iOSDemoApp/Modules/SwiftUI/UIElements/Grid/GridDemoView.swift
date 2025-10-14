//
//  GridDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct GridDemoView: View {
    @State private var symbolNames: [String] = .init()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(symbolNames, id: \.self) { symbolName in
                        SFSymbolIcon(symbolName: symbolName)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: geometry.size.width / 4, height: geometry.size.width / 4)
                        
                    }
                }
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle(.init("grid"))
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
        GridDemoView()
    }
}
