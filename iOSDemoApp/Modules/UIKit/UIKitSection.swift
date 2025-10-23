//
//  UIKitSection.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import Foundation

enum UIKitSection: String, CaseIterable {
    case uiElements = "UI Elements"
    case uiViewControllers = "UI ViewControllers"
    case protocols = "Protocols"
    
    func title() -> String {
        rawValue
    }
}
