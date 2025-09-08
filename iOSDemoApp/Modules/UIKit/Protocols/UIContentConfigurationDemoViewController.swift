//
//  UIContentConfigurationDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 04/09/25.
//

import UIKit

final class UIContentConfigurationDemoViewController: UIViewController {
    // MARK: - UIElements
    private var tableView: UITableView!
    
    // MARK: - Logic Vars
    private var dataSource: [UIContentConfiguration] = [
        ColorContentConfiguration(title: "Red Configuration", color: .red),
        ColorContentConfiguration(title: "Green Configuration", color: .green),
        ColorContentConfiguration(title: "Blue Configuration", color: .blue)
    ]
    
    // MARK: - Life Cycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func initialConfiguration() {
        title = NSLocalizedString("uiContentConfiguration", comment: .empty)
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.dataSource = self
    }
    
    private func layoutConfiguration() {
        view.backgroundColor = .systemGroupedBackground
        tableView.verticalScrollClipped(to: view)
    }
}

// MARK: - UITableViewDataSource Management
extension UIContentConfigurationDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.contentConfiguration = dataSource[indexPath.row].updated(for: cell.configurationState)
        return cell
    }
}
