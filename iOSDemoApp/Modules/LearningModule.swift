//
//  LearningModule.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit
import SwiftUI

enum LearningModule: String, CaseIterable, @MainActor NavigationItem {
    case swiftui = "SwiftUI"
    case uikit = "UIKit"
    case visionKit = "VisionKit"
    
    func title() -> String {
        rawValue
    }
    
    func image() -> UIImage? {
        UIImage(systemName: "swift")
    }
    
    @MainActor
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
            return .fullScreenPresent
        default:
            return .push
        }
    }
    
    @MainActor
    static func listController() -> NavigationItemsList {
        let listTitle = "Modules"
        let list = NavigationItemsList(
            title: listTitle,
            dataSource: [
                (NavigationSectionStyle.none, LearningModule.allCases as [NavigationItem])
            ]
        )
        return list
    }
}
