//
//  UITabBarControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

final class UITabBarControllerDemo: UITabBarController {
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        viewControllers = [
            UIViewController.redController(),
            UIViewController.greenController(),
            UIViewController.blueController()
        ]
    }
}
