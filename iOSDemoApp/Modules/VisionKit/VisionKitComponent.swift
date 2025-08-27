//
//  VisionKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

enum VisionKitComponent: String, CaseIterable, NavigationItem {
    case vnDocumentCameraViewController
    
    func title() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
    
    func image() -> UIImage? {
        switch self {
        default:
            UIImage(systemName: "document.viewfinder")
        }
    }
    
    func navigationDestination() -> UIViewController {
        return VNDocumentCameraViewControllerDemo()
    }
    
    func transitionStyle() -> LearningTransitionStyle {
        switch self {
        default:
            .push
        }
    }
    
    static func listController() -> NavigationItemsList {
        let listTitle = NSLocalizedString("visionKit", comment: .empty)
        let listController = NavigationItemsList(
            title: listTitle,
            dataSource: [
                (NavigationSectionStyle.none, VisionKitComponent.allCases as [NavigationItem])
            ]
        )
        return listController
    }
}

class DemoListView: UIViewController {
    
}
