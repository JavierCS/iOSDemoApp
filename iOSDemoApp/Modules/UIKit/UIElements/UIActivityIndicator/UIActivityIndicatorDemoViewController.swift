//
//  UIActivityIndicatorDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

final class UIActivityIndicatorDemoViewController: UIViewController {
    // MARK: - UI Elements
    private var tableView: UITableView!
    
    // MARK: - Logic Vars
    private var dataSource: [UIActivityIndicatorDemoSection] = UIActivityIndicatorDemoSection.dataSource()
    
    // MARK: - Life Cycle management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("uiActivityIndicator", comment: .empty)
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UIActivityIndicatorDemoTableViewCell.self, forCellReuseIdentifier: String(describing: UIActivityIndicatorDemoTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
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
extension UIActivityIndicatorDemoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UIActivityIndicatorDemoTableViewCell.self), for: indexPath) as? UIActivityIndicatorDemoTableViewCell else {
            return UITableViewCell()
        }
        cell.draw(dataSource[indexPath.section].items[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate Management
extension UIActivityIndicatorDemoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UIActivityIndicatorDemoTableViewCell else { return }
        cell.startAnimating()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UIActivityIndicatorDemoTableViewCell else { return }
        cell.stopAnimating()
    }
}
