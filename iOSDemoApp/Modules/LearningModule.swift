//
//  LearningModule.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit
import SwiftUI

enum LearningModule: String, CaseIterable {
    case swiftui
    case uikit
    
    func navigationDestination() -> UIViewController {
        switch self {
        case .swiftui:
            let navigationStack = NavigationStack {
                SwiftUIListView()
            }
            return UIHostingController(rootView: navigationStack)
        case .uikit:
            return UIKitListViewController()
        }
    }
    
    func transitionType() -> LearningTransitionStyle {
        switch self {
        case .swiftui:
            return .present
        case .uikit:
            return .push
        }
    }
}
