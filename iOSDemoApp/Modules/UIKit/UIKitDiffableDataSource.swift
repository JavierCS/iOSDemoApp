//
//  UIKitDiffableDataSource.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

class UIKitDiffableDataSource: UITableViewDiffableDataSource<UIKitSection, UIKitComponent> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        NSLocalizedString(snapshot().sectionIdentifiers[section].rawValue, comment: .empty)
    }
}
