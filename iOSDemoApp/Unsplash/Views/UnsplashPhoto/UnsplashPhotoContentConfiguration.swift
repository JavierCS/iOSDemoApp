//
//  UnsplashPhotoContentConfiguration.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

class UnsplashPhotoContentConfiguration: UIContentConfiguration {
    let style: UnsplashPhotoContentViewStyle
    let photo: UnsplashPhoto
    
    init(style: UnsplashPhotoContentViewStyle, photo: UnsplashPhoto) {
        self.style = style
        self.photo = photo
    }
    
    func makeContentView() -> any UIView & UIContentView {
        let contentView = UnsplashPhotoContentView(configuration: self)
        return contentView
    }
    
    func updated(for state: any UIConfigurationState) -> Self {
        return self
    }
}
