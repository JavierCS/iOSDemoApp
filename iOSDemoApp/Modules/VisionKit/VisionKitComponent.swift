//
//  VisionKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

enum VisionKitComponent: String, CaseIterable {
    case vnDocumentCameraViewController
    
    func image() -> UIImage? {
        switch self {
        default:
            UIImage(systemName: "document.viewfinder")
        }
    }
    
    func navigationDestination() -> UIViewController {
        return UIViewController()
    }
    
    func transitionStyle() -> LearningTransitionStyle {
        switch self {
        default:
            .push
        }
    }
}

class DemoListView: UIViewController {
    
}
