//
//  UIDatePickerTextFieldDemoTableViewCell.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

final class UIDatePickerTextFieldDemoTableViewCell: UITableViewCell {
    // MARK: - UIElements
    private var dateTextField: UITextField!
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
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissInput))
        toolbar.setItems([spacer, doneButton], animated: false)
        
        dateTextField = UITextField()
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.placeholder = NSLocalizedString("selectADate", comment: .empty)
        dateTextField.borderStyle = .roundedRect
        contentView.addSubview(dateTextField)
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .wheels
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
    }
    
    // MARK: - UI Elements Actions
    @objc func dismissInput() {
        dateTextField.resignFirstResponder()
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        dateTextField.text = selectedDate.description(with: .current)
    }
}
