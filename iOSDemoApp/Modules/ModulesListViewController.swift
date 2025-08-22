//
//  ModulesListViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

class ModulesListViewController: UIViewController {
    var modulesList: UITableView!
    
    var dataSource: UITableViewDiffableDataSource<Int, LearningModule>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
        dataSourceConfiguration()
    }
    
    private func layoutConfiguration() {
        title = "Modules"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .systemGroupedBackground
        
        modulesList = UITableView(frame: .zero, style: .insetGrouped)
        modulesList.translatesAutoresizingMaskIntoConstraints = false
        modulesList.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        modulesList.delegate = self
        view.addSubview(modulesList)
        NSLayoutConstraint.activate([
            modulesList.topAnchor.constraint(equalTo: view.topAnchor),
            modulesList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            modulesList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            modulesList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func dataSourceConfiguration() {
        dataSource = UITableViewDiffableDataSource<Int, LearningModule>(tableView: modulesList) { tableView, indexPath, module in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) else { return UITableViewCell() }
//            cell?.contentConfiguration = UIHostingConfiguration {
//                Label(.init(module.rawValue), systemImage: "swift")
//            }
            var cellConfiguration = cell.defaultContentConfiguration()
            cellConfiguration.text = NSLocalizedString(module.rawValue, comment: .empty)
            cellConfiguration.image = UIImage(systemName: "swift")
            cell.contentConfiguration = cellConfiguration
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, LearningModule>()
        snapshot.appendSections([0])
        snapshot.appendItems(LearningModule.allCases, toSection: 0)
        dataSource.apply(snapshot)
    }
}

// MARK: - ModulesListViewController
extension ModulesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        switch item.transitionType() {
        case .push:
            show(item.navigationDestination(), sender: nil)
        case .present:
            let destination = item.navigationDestination()
            destination.modalPresentationStyle = .fullScreen
            present(destination, animated: true)
        }
    }
}
