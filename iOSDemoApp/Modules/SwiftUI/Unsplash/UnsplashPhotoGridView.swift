//
//  UnsplashPhotoGridView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/10/25.
//

import SwiftUI
import UnsplashFoundation

struct UnsplashPhotoGridView: View {
    @State private var imageData: Data?
    
    let photo: UnsplashPhoto
    let frameWidth: CGFloat
    
    func emptyPhotoView() -> some View {
        Group {
            ProgressView()
                .tint(Color.accentColor)
                .task {
                    await downloadImage()
                }
            Label("", systemImage: "apple")
        }
    }
    
    @ViewBuilder
    func validatedGridView() -> some View {
        if let imageData = imageData, let image = UIImage(data: imageData) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else if imageData != nil {
            Image(systemName: "photo.badge.exclamationmark.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .symbolEffect(.bounce, options: .repeat(1))
        } else {
            emptyPhotoView()
        }
    }
    
    var body: some View {
        VStack {
            validatedGridView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: frameWidth,height: frameWidth)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 5)
        .padding()
    }
    
    private func downloadImage() async {
        do {
            let imageData = try await photo.downloadImageData(from: photo.urls?.regular)
            await MainActor.run {
                withAnimation {
                    self.imageData = imageData
                }
            }
        } catch {
            print(error)
        }
    }
}

#Preview {
    UnsplashPhotoGridView(photo: UnsplashPhoto.mock(), frameWidth: 350)
}
