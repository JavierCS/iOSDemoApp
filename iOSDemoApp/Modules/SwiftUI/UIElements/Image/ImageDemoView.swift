//
//  ImageDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import SwiftUI

struct ImageDemoView: View {
    var body: some View {
        VStack {
            Image("Landscape_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 200)
                .border(.blue)
                .background {
                    Color(.systemBackground)
                }
            
            Image("Landscape_4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400, alignment: .topLeading)
                .clipped()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        }
        .navigationTitle("Image")
    }
}

#Preview {
    NavigationStack {
        ImageDemoView()
    }
}
