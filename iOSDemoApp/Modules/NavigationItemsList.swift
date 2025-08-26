//
//  NavigationItemsList.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

class NavigationItemsList: UIViewController {
    // MARK: - UI Elements
    var itemsList: UITableView!
    
    // MARK: - Logic Vars
    var dataSource: [(section: NavigationSection, items: [NavigationItem])]
    
    // MARK: - Initialization
    init(title: String, dataSource: [(NavigationSection, [NavigationItem])]) {
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
    }
    
    // MARK: - Configuration Management
    private func initialLayout() {
        itemsList = UITableView(frame: .zero, style: .insetGrouped)
        itemsList.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        itemsList.dataSource = self
        itemsList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemsList)
    }
}

// MARK: -
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
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
