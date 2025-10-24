//
//  UnsplashPhotoContentConfiguration.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

public class UnsplashPhotoContentConfiguration: UIContentConfiguration {
    public let style: UnsplashPhotoContentViewStyle
    public let photo: UnsplashPhoto
    
    public init(style: UnsplashPhotoContentViewStyle, photo: UnsplashPhoto) {
        self.style = style
        self.photo = photo
    }
    
    public func makeContentView() -> any UIView & UIContentView {
        let contentView = UnsplashPhotoContentView(configuration: self)
        return contentView
    }
    
    public func updated(for state: any UIConfigurationState) -> Self {
        return self
    }
}
