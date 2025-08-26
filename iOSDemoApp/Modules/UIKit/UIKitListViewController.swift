//
//  UIKitListViewController.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

class UIKitListViewController: UIViewController {
    private var componentsList: UITableView!
    private var dataSource: UIKitDiffableDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
        dataSourceConfiguration()
    }
    
    private func layoutConfiguration() {
        title = NSLocalizedString("uikit", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
        
        componentsList = UITableView(frame: .zero, style: .insetGrouped)
        componentsList.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        componentsList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(componentsList)
        NSLayoutConstraint.activate([
            componentsList.topAnchor.constraint(equalTo: view.topAnchor),
            componentsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            componentsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            componentsList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func dataSourceConfiguration() {
        dataSource = UIKitDiffableDataSource(tableView: componentsList) { tableView, indexPath, component in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.text = NSLocalizedString(component.rawValue, comment: .empty)
            configuration.image = component.image()
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<UIKitSection, UIKitComponent>()
        let elementComponents = UIKitComponent.allCases.filter({ $0.section() == .uiElements })
        let controllerComponents = UIKitComponent.allCases.filter({ $0.section() == .uiViewControllers })
        snapshot.appendSections(UIKitSection.allCases)
        snapshot.appendItems(elementComponents, toSection: .uiElements)
        snapshot.appendItems(controllerComponents, toSection: .uiViewControllers)
        
        dataSource.apply(snapshot)
    }
}

// MARK: - UITableViewDelegate Management
extension UIKitListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
