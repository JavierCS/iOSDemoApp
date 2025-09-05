//
//  UIContentConfigurationDemoViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 04/09/25.
//

import UIKit

struct RedContentConfiguration: UIContentConfiguration {
    func makeContentView() -> any UIView & UIContentView {
        return RedContentView(configuration: self)
    }
    
    func updated(for state: any UIConfigurationState) -> RedContentConfiguration {
        return self
    }
}

final class RedContentView: UIView, UIContentView {
    var configuration: any UIContentConfiguration
    
    init(configuration: RedContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class UIContentConfigurationDemoViewController: UIViewController {
    // MARK: - UIElements
    private var tableView: UITableView!
    
    // MARK: - Logic Vars
    private var dataSource: [UIContentConfiguration] = []
    
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
        return tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
    }
}
