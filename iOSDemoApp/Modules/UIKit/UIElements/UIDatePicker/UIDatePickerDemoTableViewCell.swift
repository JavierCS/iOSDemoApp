//
//  UIDatePickerDemoTableViewCell.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

final class UIDatePickerDemoTableViewCell: UITableViewCell {
    // MARK: - UIElements
    private var datePicker: UIDatePicker!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        selectionStyle = .none
        
        datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Drawing
    func draw(_ style: UIDatePickerStyle) {
        datePicker.preferredDatePickerStyle = style
    }
}
