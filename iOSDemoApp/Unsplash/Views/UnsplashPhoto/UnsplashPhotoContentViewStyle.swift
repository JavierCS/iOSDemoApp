//
//  UnsplashPhotoContentViewStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

enum UnsplashPhotoContentViewStyle: String, CaseIterable {
    case complete = "UnsplashPhotoContentViewStyle.complete"
    case image = "UnsplashPhotoContentViewStyle.image"
    
    func imageSize() -> CGSize {
        let value = UIApplication.shared.sceneSize().width
        switch self {
        case .complete:
            return CGSize(width: value * 0.35, height: value * 0.35)
        case .image:
            return CGSize(width: value * 0.45, height: value * 0.45)
        }
    }
    
    func reuseIdentifier() -> String {
        return rawValue
    }
    
    func view(for photo: UnsplashPhoto) -> UnsplashPhotoDrawerProtocol {
        switch self {
        case .complete:
            return UnsplashPhotoCompleteStyleView(photo)
        case .image:
            return UnsplashPhotoImageStyleView(photo)
        }
    }
}

extension UIApplication {
    func sceneSize() -> CGSize {
        guard let currentScene = connectedScenes.first as? UIWindowScene,
              let window = currentScene.windows.first else { return .zero }
        return window.bounds.size
    }
}
