//
//  ColorContentConfiguration.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 08/09/25.
//

import UIKit

struct ColorContentConfiguration: UIContentConfiguration {
    var color: UIColor
    var title: String
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
    }
    
    func makeContentView() -> any UIView & UIContentView {
        let contentView = ColorContentView(configuration: self)
        return contentView
    }
    
    func updated(for state: any UIConfigurationState) -> ColorContentConfiguration {
        var updatedConfiguration = self
        if let cellState = state as? UICellConfigurationState, cellState.isSelected {
            updatedConfiguration.color = .gray
            updatedConfiguration.title = "Selected"
        }
        return updatedConfiguration
    }
}
