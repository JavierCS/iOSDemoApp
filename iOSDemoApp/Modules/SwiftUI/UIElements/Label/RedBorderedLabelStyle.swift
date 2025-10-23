//
//  RedBorderedLabelStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 16/10/25.
//

import SwiftUI

struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .border(.red)
    }
}

#Preview {
    Label("Label", systemImage: "swift")
        .labelStyle(RedBorderedLabelStyle())
}
