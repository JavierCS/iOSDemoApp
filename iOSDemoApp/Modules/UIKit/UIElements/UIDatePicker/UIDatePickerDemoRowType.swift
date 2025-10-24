//
//  UIDatePickerDemoRowType.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 28/08/25.
//

import UIKit

enum UIDatePickerDemoRowType {
    case style(style: UIDatePickerStyle)
    case inputView
    
    @MainActor
    func row(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch self {
        case .style(let style):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UIDatePickerDemoTableViewCell.self), for: indexPath) as? UIDatePickerDemoTableViewCell
            cell?.draw(style)
            return cell ?? UITableViewCell()
        case .inputView:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UIDatePickerTextFieldDemoTableViewCell.self), for: indexPath) as? UIDatePickerTextFieldDemoTableViewCell
            return cell ?? UITableViewCell()
        }
    }
    
    static func dataSource() -> [(String, [UIDatePickerDemoRowType])] {
        return [
            (NSLocalizedString("style", comment: .empty), [
                .inputView,
                .style(style: .compact),
                .style(style: .inline),
                .style(style: .wheels)
            ])
        ]
    }
}
