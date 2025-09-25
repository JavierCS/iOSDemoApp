//
//  ImageManager.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

final class ImageManager {
    static let shared: ImageManager = .init()
    let cache: NSCache<NSString, UIImage> = .init()
    
    private init() {}
    
    func image(for url: URL?) async throws -> UIImage {
        guard let url = url else { throw ImageManagerError.invalidURL }
        if let cacheImage = cache.object(forKey: NSString(string: url.absoluteString)) {
            return cacheImage
        }
        let downloadedImageData = try await NetworkDataManager.shared.data(from: url)
        guard let image = UIImage(data: downloadedImageData) else { throw ImageManagerError.cantBuildImageFromData }
        cache.setObject(image, forKey: NSString(string: url.absoluteString))
        return image
    }
}
