//
//  UIKitSection.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import Foundation

enum UIKitSection: String, CaseIterable {
    case uiElements
    case uiViewControllers
    
    func title() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
}
