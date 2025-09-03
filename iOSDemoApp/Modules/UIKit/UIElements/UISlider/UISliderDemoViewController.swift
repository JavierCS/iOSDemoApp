//
//  UISliderDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import UIKit

final class UISliderDemoViewController: UIViewController {
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("uiSlider", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
    }
}
