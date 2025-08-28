//
//  NavigationItemsList.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

final class NavigationItemsList: UIViewController {
    // MARK: - UI Elements
    var tableView: UITableView!
    
    // MARK: - Logic Vars
    var dataSource: [(section: NavigationSectionStyle, items: [NavigationItem])]
    
    // MARK: - Initialization
    init(title: String, dataSource: [(NavigationSectionStyle, [NavigationItem])]) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLayout()
    }
    
    // MARK: - Configuration Management
    private func initialLayout() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .systemGroupedBackground
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
extension NavigationItemsList: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let item = dataSource[indexPath.section].items[indexPath.row]
        var defaultConfiguration = cell.defaultContentConfiguration()
        defaultConfiguration.text = item.title()
        defaultConfiguration.image = item.image()
        cell.contentConfiguration = defaultConfiguration
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - UITableViewDelegate Management
extension NavigationItemsList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = dataSource[indexPath.section].items[indexPath.row]
        let destination = selectedItem.navigationDestination()
        switch selectedItem.transitionStyle() {
        case .present:
            present(destination, animated: true)
        case .push:
            show(destination, sender: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
