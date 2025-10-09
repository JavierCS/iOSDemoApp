//
//  UnsplashPhotoCompleteStyleView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

final class UnsplashPhotoCompleteStyleView: UIView {
    // MARK: UIElements
    
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
        
    }
}

extension UnsplashPhotoCompleteStyleView: UnsplashPhotoDrawerProtocol {
    func draw(_ photo: UnsplashPhoto) {
        
    }
}
