//
//  UIButtonDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/08/25.
//

import UIKit

final class UIButtonDemoViewController: UIViewController {
    // MARK: - UI Elements
    private var tableView: UITableView!
    
    // MARK: - Logic Vars
    private var dataSource: [UIButtonDemoSection] = UIButtonDemoSection.dataSource()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("uiButton", comment: .empty)
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UIButtonDemoTablelViewCell.self, forCellReuseIdentifier: String(describing: UIButtonDemoTablelViewCell.self))
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
extension UIButtonDemoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: UIButtonDemoTablelViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? UIButtonDemoTablelViewCell else {
            return UITableViewCell()
        }
        cell.draw(dataSource[indexPath.section].items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].name
    }
}
