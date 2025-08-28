//
//  UIButtonDemoSection.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/08/25.
//

import Foundation

struct UIButtonDemoSection {
    var name: String
    var items: [UIButtonDemoModel]
    
    static func dataSource() -> [UIButtonDemoSection] {
        return [
            .init(
                name: NSLocalizedString("style", comment: .empty),
                items: [
                    .init(style: .none),
                    .init(style: .borderedButton),
                    .init(style: .borderedProminentButton),
                    .init(style: .borderedTintedButton),
                    .init(style: .borderlessButton),
                    .init(style: .clearGlassButton),
                    .init(style: .filledButton),
                    .init(style: .glassButton),
                    .init(style: .grayButton),
                    .init(style: .plainButton),
                    .init(style: .prominentClearGlassButton),
                    .init(style: .prominentGlassButton),
                    .init(style: .tintedButton)
                ]
            ),
            .init(
                name: NSLocalizedString("tint", comment: .empty),
                items: [
                    .init(style: .none, tintColor: .systemPink),
                    .init(style: .borderedButton, tintColor: .systemPink),
                    .init(style: .borderedProminentButton, tintColor: .systemPink),
                    .init(style: .borderedTintedButton, tintColor: .systemPink),
                    .init(style: .borderlessButton, tintColor: .systemPink),
                    .init(style: .clearGlassButton, tintColor: .systemPink),
                    .init(style: .filledButton, tintColor: .systemPink),
                    .init(style: .glassButton, tintColor: .systemPink),
                    .init(style: .grayButton, tintColor: .systemPink),
                    .init(style: .plainButton, tintColor: .systemPink),
                    .init(style: .prominentClearGlassButton, tintColor: .systemPink),
                    .init(style: .prominentGlassButton, tintColor: .systemPink),
                    .init(style: .tintedButton, tintColor: .systemPink)
                ]
            ),
            .init(
                name: NSLocalizedString("tint", comment: .empty),
                items: [
                    .init(style: .none, tintColor: .systemGreen),
                    .init(style: .borderedButton, tintColor: .systemGreen),
                    .init(style: .borderedProminentButton, tintColor: .systemGreen),
                    .init(style: .borderedTintedButton, tintColor: .systemGreen),
                    .init(style: .borderlessButton, tintColor: .systemGreen),
                    .init(style: .clearGlassButton, tintColor: .systemGreen),
                    .init(style: .filledButton, tintColor: .systemGreen),
                    .init(style: .glassButton, tintColor: .systemGreen),
                    .init(style: .grayButton, tintColor: .systemGreen),
                    .init(style: .plainButton, tintColor: .systemGreen),
                    .init(style: .prominentClearGlassButton, tintColor: .systemGreen),
                    .init(style: .prominentGlassButton, tintColor: .systemGreen),
                    .init(style: .tintedButton, tintColor: .systemGreen)
                ]
            )
        ]
    }
}
