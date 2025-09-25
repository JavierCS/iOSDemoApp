//
//  UnsplashPhotoCompleteStyleView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 24/09/25.
//

import UIKit

class UnsplashPhotoCompleteStyleView: UIView {
    // MARK: UIElements
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var photoDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var photoLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var slugLabel: UILabel = {
        let label = UILabel()
        label.text = "slugLabel"
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "dateLabel"
        return label
    }()
    
    private lazy var resolutionLabel: UILabel = {
        let label = UILabel()
        label.text = "resolutionLabel"
        return label
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
        photoLabelsStackView.clipped(to: self)
        photoLabelsStackView.addArrangedSubview(slugLabel)
        photoLabelsStackView.addArrangedSubview(dateLabel)
        photoLabelsStackView.addArrangedSubview(resolutionLabel)
    }
}

extension UnsplashPhotoCompleteStyleView: UnsplashPhotoDrawerProtocol {
    func draw(_ photo: UnsplashPhoto) {
        
    }
}


