//
//  UnsplashPhotoImageStyleView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit
import iOSDemoAppFoundation

class UnsplashPhotoImageStyleView: UIView {
    // MARK: UIElements
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    // MARK: Logic Vars
    var photo: UnsplashPhoto
    
    // MARK: Initialization Code
    init(_ photo: UnsplashPhoto) {
        self.photo = photo
        super.init(frame: .zero)
        layoutConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configuration Management
    private func layoutConfiguration() {
        photoImageView.clipped(to: self, by: 5)
        photoImageView.sized(UnsplashPhotoContentViewStyle.image.imageSize())
    }
}

// MARK: -
extension UnsplashPhotoImageStyleView: @MainActor UnsplashPhotoDrawerProtocol {
    func draw(_ photo: UnsplashPhoto) {
        
    }
}
