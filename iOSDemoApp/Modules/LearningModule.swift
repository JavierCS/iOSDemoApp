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
            return UIKitComponent.listController()
        case .visionKit:
            return VisionKitComponent.listController()
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
    
    static func listController() -> NavigationItemsList {
        let listTitle = NSLocalizedString("modules", comment: .empty)
        let list = NavigationItemsList(
            title: listTitle,
            dataSource: [
                (NavigationSectionStyle.none, LearningModule.allCases as [NavigationItem])
            ]
        )
        return list
    }
}
