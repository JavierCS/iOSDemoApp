//
//  UIApplicationExtension.swift
//  UnsplashFoundation
//
//  Created by Javier Cruz Santiago on 24/10/25.
//

import UIKit

public extension UIApplication {
    func sceneSize() -> CGSize {
        guard let currentScene = connectedScenes.first as? UIWindowScene,
              let window = currentScene.windows.first else { return .zero }
        return window.bounds.size
    }
}
