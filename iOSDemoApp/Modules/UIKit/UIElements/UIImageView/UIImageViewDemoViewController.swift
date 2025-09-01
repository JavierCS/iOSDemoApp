//
//  UIImageViewDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import UIKit

class UIImageViewDemoViewController: UIViewController {
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    private func layoutConfiguration() {
        title = NSLocalizedString("uiImageView", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
    }
}
