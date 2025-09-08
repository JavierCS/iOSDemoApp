//
//  ColorContentView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 08/09/25.
//

import UIKit

final class ColorContentView: UIView, UIContentView {
    // MARK: - UIElements
    private var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.text = "Title Label"
        return label
    }()
    
    // MARK: - Logic Vars
    var configuration: any UIContentConfiguration
    
    // MARK: - Initialization
    init(configuration: ColorContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        layoutConfiguration()
        applyConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        containerStack.clipped(to: self, by: 16)
        containerStack.addArrangedSubview(titleLabel)
    }
    
    private func applyConfiguration() {
        guard let configuration = self.configuration as? ColorContentConfiguration else { return }
        backgroundColor = configuration.color
        titleLabel.text = configuration.title
    }
}
