//
//  UIVIewControllerExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

extension UIViewController {
    static func redController() -> UIViewController {
        let redController = UIViewController()
        redController.title = NSLocalizedString("redController", comment: .empty)
        redController.view.backgroundColor = .systemRed
        redController.tabBarItem = UITabBarItem(title: NSLocalizedString("red", comment: .empty), image: UIImage(systemName: "switch.2"), selectedImage: nil)
        return redController
    }
    
    static func greenController() -> UIViewController {
        let greenController = UIViewController()
        greenController.title = NSLocalizedString("greenController", comment: .empty)
        greenController.view.backgroundColor = .systemGreen
        greenController.tabBarItem = UITabBarItem(title: NSLocalizedString("green", comment: .empty), image: UIImage(systemName: "xbox.logo"), selectedImage: nil)
        return greenController
    }
    
    static func blueController() -> UIViewController {
        let blueController = UIViewController()
        blueController.title = NSLocalizedString("blueController", comment: .empty)
        blueController.view.backgroundColor = .systemBlue
        blueController.tabBarItem = UITabBarItem(title: NSLocalizedString("blue", comment: .empty), image: UIImage(systemName: "playstation.logo"), selectedImage: nil)
        return blueController
    }
}
