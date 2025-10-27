//
//  Untitled.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/10/25.
//

import SwiftUI
import UnsplashFoundation

struct UnsplashPhotos: View {
    @State private var photos: [UnsplashPhoto] = .init()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible())
    ]
    
    var gridView: some View {
        GeometryReader { reader in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(photos) { photo in
                        UnsplashPhotoGridView(photo: photo, frameWidth: reader.size.width / 2)
                    }
                }
            }
        }
    }
    
    private func emptyGridView() -> some View {
        VStack {
            ProgressView()
            Text("Loading photos...")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        }
        .task {
            await loadImages()
        }
    }
    
    @ViewBuilder
    private func validatedGridView() -> some View {
        if photos.count == 0 {
            emptyGridView()
        } else {
            gridView
        }
    }
    
    var body: some View {
        validatedGridView()
            .navigationTitle("Photos")
    }
    
    private func loadImages() async {
        do {
            let photos = try await UnsplashPhoto.get()
            await MainActor.run {
                withAnimation {
                    self.photos = photos
                }
            }
        } catch {
            print(error)
        }
    }
}

#Preview {
    NavigationStack {
        UnsplashPhotos()
    }
}
