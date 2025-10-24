//
//  UnsplashPhotoContentViewStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit
import iOSDemoAppFoundation

public enum UnsplashPhotoContentViewStyle: String, CaseIterable {
    case complete = "UnsplashPhotoContentViewStyle.complete"
    case image = "UnsplashPhotoContentViewStyle.image"
    
    @MainActor
    public func imageSize() -> CGSize {
        let value = UIApplication.shared.sceneSize().width
        switch self {
        case .complete:
            return CGSize(width: value, height: value)
        case .image:
            return CGSize(width: value * 0.45, height: value * 0.45)
        }
    }
    
    public func reuseIdentifier() -> String {
        return rawValue
    }
    
    @MainActor
    func view(for photo: UnsplashPhoto) -> UnsplashPhotoDrawerProtocol {
        switch self {
        case .complete:
            return UnsplashPhotoCompleteStyleView(photo)
        case .image:
            return UnsplashPhotoImageStyleView(photo)
        }
    }
}


