//
//  UIViewControllerExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

extension UIViewController {
    // MARK: - Pre Configured Controllers
    static func redController(embeddedInNavigation: Bool = false) -> UIViewController {
        let redController = UIViewController()
        redController.title = NSLocalizedString("redController", comment: .empty)
        redController.view.backgroundColor = .systemRed
        redController.tabBarItem = UITabBarItem(title: NSLocalizedString("red", comment: .empty), image: UIImage(systemName: "switch.2"), selectedImage: nil)
        if embeddedInNavigation {
            return UINavigationController(rootViewController: redController)
        }
        return redController
    }
    
    static func greenController(embeddedInNavigation: Bool = false) -> UIViewController {
        let greenController = UIViewController()
        greenController.title = NSLocalizedString("greenController", comment: .empty)
        greenController.view.backgroundColor = .systemGreen
        greenController.tabBarItem = UITabBarItem(title: NSLocalizedString("green", comment: .empty), image: UIImage(systemName: "xbox.logo"), selectedImage: nil)
        if embeddedInNavigation {
            return UINavigationController(rootViewController: greenController)
        }
        return greenController
    }
    
    static func blueController(embeddedInNavigation: Bool = false) -> UIViewController {
        let blueController = UIViewController()
        blueController.title = NSLocalizedString("blueController", comment: .empty)
        blueController.view.backgroundColor = .systemBlue
        blueController.tabBarItem = UITabBarItem(title: NSLocalizedString("blue", comment: .empty), image: UIImage(systemName: "playstation.logo"), selectedImage: nil)
        if embeddedInNavigation {
            return UINavigationController(rootViewController: blueController)
        }
        return blueController
    }
    
    // MARK: - Utils
    func showAlert(messageKey: String, animated: Bool = true, completion: (() -> Void)? = nil) {
        let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        let localizedMessage = NSLocalizedString(messageKey, comment: .empty)
        let alert = UIAlertController(title: displayName, message: localizedMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: .empty), style: .default))
        present(alert, animated: animated, completion: completion)
    }
}
