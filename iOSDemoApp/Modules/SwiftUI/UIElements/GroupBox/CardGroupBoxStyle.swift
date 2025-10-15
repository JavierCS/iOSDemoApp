//
//  CardGroupBoxStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 15/10/25.
//

import SwiftUI

struct CardGroupBoxStyle: GroupBoxStyle {
    let showLabel: Bool
    
    init(showLabel: Bool = true) {
        self.showLabel = showLabel
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            if showLabel {
                configuration.label
                    .font(.headline)
            }
            configuration.content
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)
                .shadow(radius: 5)
        }
    }
}

#Preview("Card Group Box Style") {
    VStack {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Hola")
                Text("Mundo")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } label: {
            VStack {
                HStack {
                    Text("Label")
                    Spacer()
                    Image(systemName: "apple.logo")
                }
                Divider()
            }
        }
    }
}
