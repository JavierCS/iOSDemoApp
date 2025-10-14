//
//  SFSymbolIcon.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 14/10/25.
//

import SwiftUI

struct SFSymbolIcon: View {
    let symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color(.systemBackground))
                    .shadow(radius: 5)
                    .padding(8)
            }
    }
}

#Preview {
    SFSymbolIcon(symbolName: "apple.logo")
}
