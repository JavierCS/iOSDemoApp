//
//  UITabBarControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

class UITabBarControllerDemo: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        viewControllers = [
            UIViewController.redController(),
            UIViewController.greenController(),
            UIViewController.blueController()
        ]
    }
}
