//
//  VisionKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

enum VisionKitComponent: String, CaseIterable, @MainActor NavigationItem {
    case vnDocumentCameraViewController = "VNDocumentCameraViewController"
    
    func title() -> String {
        rawValue
    }
    
    func image() -> UIImage? {
        switch self {
        default:
            UIImage(systemName: "document.viewfinder")
        }
    }
    
    @MainActor
    func navigationDestination() -> UIViewController {
        return VNDocumentCameraViewControllerDemo()
    }
    
    func transitionStyle() -> LearningTransitionStyle {
        switch self {
        default:
            .push
        }
    }
    
    @MainActor
    static func listController() -> NavigationItemsList {
        let listTitle = "VisionKit"
        let listController = NavigationItemsList(
            title: listTitle,
            dataSource: [
                (NavigationSectionStyle.none, VisionKitComponent.allCases as [NavigationItem])
            ]
        )
        return listController
    }
}

final class DemoListView: UIViewController {
    
}
