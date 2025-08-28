//
//  UIButtonDemoTablelViewCell.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 27/08/25.
//

import UIKit

final class UIButtonDemoTablelViewCell: UITableViewCell {
    // MARK: - UIElement
    private var button: UIButton!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layoutConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Drawing
    func draw(_ model: UIButtonDemoModel) {
        let buttonStyle = model.style
        button.setTitle(buttonStyle.name(), for: .normal)
        button.configuration = buttonStyle.configuration()
        if let tintColor = model.tintColor {
            button.tintColor = tintColor
        } else {
            button.tintColor = .systemBlue
        }
    }
}
