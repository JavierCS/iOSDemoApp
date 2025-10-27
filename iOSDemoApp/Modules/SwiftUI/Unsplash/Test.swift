//
//  Test.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/10/25.
//

import SwiftUI

struct Test: View {
    
    @ViewBuilder
    func textos() -> some View {
        Group {
            Text("Texto 1")
            Text("Texto 2")
        }
    }
    
    var body: some View {
        List {
            textos()
        }
    }
}

#Preview {
    Test()
}
