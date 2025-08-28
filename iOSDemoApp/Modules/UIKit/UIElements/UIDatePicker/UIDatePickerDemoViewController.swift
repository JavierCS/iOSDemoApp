//
//  UIDatePickerDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

final class UIDatePickerDemoViewController: UIViewController {
    // MARK: - UI Elements
    private var tableView: UITableView!
    
    // MARK: - Logic Vars
    private var dataSource: [(title: String, items: [UIDatePickerDemoRowType])] = UIDatePickerDemoRowType.dataSource()
    
    // MARK: - Life Cycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("uiDatePicker", comment: .empty)
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UIDatePickerDemoTableViewCell.self, forCellReuseIdentifier: String(describing: UIDatePickerDemoTableViewCell.self))
        tableView.register(UIDatePickerTextFieldDemoTableViewCell.self, forCellReuseIdentifier: String(describing: UIDatePickerTextFieldDemoTableViewCell.self))
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource Management
extension UIDatePickerDemoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.section].items[indexPath.row]
        return item.row(for: tableView, at: indexPath)
    }
}
