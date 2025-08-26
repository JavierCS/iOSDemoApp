//
//  LearningModule.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit
import SwiftUI

enum LearningModule: String, CaseIterable, NavigationItem {
    case swiftui
    case uikit
    case visionKit
    
    func title() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
    
    func image() -> UIImage? {
        UIImage(systemName: "swift")
    }
    
    func navigationDestination() -> UIViewController {
        switch self {
        case .swiftui:
            let navigationStack = NavigationStack {
                SwiftUIListView()
            }
            return UIHostingController(rootView: navigationStack)
        case .uikit:
            return UIKitListViewController()
        case .visionKit:
            return UIViewController()
        }
    }
    
    func transitionStyle() -> LearningTransitionStyle {
        switch self {
        case .swiftui:
            return .present
        default:
            return .push
        }
    }
}
