//
//  UnsplashHomeView.swift
//  UnsplashFoundation
//
//  Created by Javier Cruz Santiago on 27/10/25.
//

import SwiftUI

public struct UnsplashHomeView: View {
    public init() {}
    
    public var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    UnsplashPhotos()
                }
            }
        }
    }
}

#Preview {
    UnsplashHomeView()
}
