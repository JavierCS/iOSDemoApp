//
//  ImageDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import SwiftUI

struct ImageDemoView: View {
    var body: some View {
        list
            .navigationTitle(Text(.init("image")))
    }
    
    var list: some View {
        List {
            
        }
    }
}

#Preview {
    NavigationStack {
        ImageDemoView()
    }
}
