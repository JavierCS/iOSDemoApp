//
//  UnsplashPhotoContentView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

class UnsplashPhotoContentView: UIView, UIContentView {
    // MARK: UIElements
    let drawer: UnsplashPhotoDrawerProtocol
    
    // MARK: Logic Vars
    var configuration: any UIContentConfiguration {
        didSet {
            applyConfiguration()
        }
    }
    
    // MARK: Initialization Code
    init(configuration: UnsplashPhotoContentConfiguration) {
        self.configuration = configuration
        self.drawer = configuration.style.view(for: configuration.photo)
        super.init(frame: .zero)
        layoutConfiguration()
        applyConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Management
    private func layoutConfiguration() {
        guard let drawer = drawer as? UIView else { return }
        drawer.clipped(to: self)
    }
    
    private func applyConfiguration() {
        guard let configuration = configuration as? UnsplashPhotoContentConfiguration else { return }
        drawer.draw(configuration.photo)
    }
}
