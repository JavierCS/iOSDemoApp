//
//  UIButtonDemoStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/08/25.
//

import UIKit

enum UIButtonDemoStyle: String, CaseIterable {
    case borderedButton
    case borderedProminentButton
    case borderedTintedButton
    case borderlessButton
    case clearGlassButton
    case filledButton
    case glassButton
    case grayButton
    case plainButton
    case prominentClearGlassButton
    case prominentGlassButton
    case tintedButton
    
    func name() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
    
    func configuration() -> UIButton.Configuration? {
        switch self {
        case .borderedButton:
            return .bordered()
        case .borderedProminentButton:
            return .borderedProminent()
        case .borderedTintedButton:
            return .borderedTinted()
        case .borderlessButton:
            return .borderless()
        case .clearGlassButton:
            return .clearGlass()
        case .filledButton:
            return .filled()
        case .glassButton:
            return .glass()
        case .grayButton:
            return .gray()
        case .plainButton:
            return .plain()
        case .prominentClearGlassButton:
            return .prominentClearGlass()
        case .prominentGlassButton:
            return .prominentGlass()
        case .tintedButton:
            return .tinted()
        }
    }
}
