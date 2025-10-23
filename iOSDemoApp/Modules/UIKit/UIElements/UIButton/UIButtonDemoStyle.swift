//
//  UIButtonDemoStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/08/25.
//

import UIKit

enum UIButtonDemoStyle: String, CaseIterable {
    case borderedButton = "Bordered Button"
    case borderedProminentButton = "Bordered Prominent Button"
    case borderedTintedButton = "Bordered Tinted Button"
    case borderlessButton = "Borderless Button"
    case clearGlassButton = "Clear Glass Button"
    case filledButton = "Filled Button"
    case glassButton = "Glass Button"
    case grayButton = "Gray Button"
    case plainButton = "Plain Button"
    case prominentClearGlassButton = "Prominent Clear Glass Button"
    case prominentGlassButton = "Prominent Glass Button"
    case tintedButton = "Tinted Button"
    
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
