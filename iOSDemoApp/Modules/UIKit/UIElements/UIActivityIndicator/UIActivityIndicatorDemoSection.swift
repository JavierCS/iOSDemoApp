//
//  UIActivityIndicatorDemoSection.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

struct UIActivityIndicatorDemoSection {
    var name: String
    var items: [UIActivityIndicatorDemoModel]
    
    static func dataSource() -> [UIActivityIndicatorDemoSection] {
        return [
            .init(
                name: NSLocalizedString("style", comment: .empty),
                items: [
                    .init(style: .medium),
                    .init(style: .large)
                ]
            ),
            .init(
                name: NSLocalizedString("tint", comment: .empty),
                items: [
                    .init(style: .medium, tintColor: .systemPink),
                    .init(style: .large, tintColor: .systemPink)
                ]
            )
        ]
    }
}
