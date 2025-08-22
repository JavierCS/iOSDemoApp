//
//  UIKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

enum UIKitComponent: String, CaseIterable {
    case uiTabBarController
    case uiTableViewController
    case uiCollectionViewController
    
    func image() -> UIImage? {
        switch self {
        case .uiTabBarController:
            UIImage(systemName: "platter.filled.bottom.iphone")
        case .uiTableViewController:
            UIImage(systemName: "rectangle.grid.1x3")
        case .uiCollectionViewController:
            UIImage(systemName: "square.grid.3x3")
        }
    }
    
    func navigationDestination() -> UIViewController {
        return UIViewController()
    }
    
    func transitionType() -> LearningTransitionStyle {
        return .push
    }
}
