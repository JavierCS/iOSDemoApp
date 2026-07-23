//
//  SimpleListItem.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

enum SimpleListItem: CaseIterable {
    case item0
    case item1
    case item2
    case item3
    case item4
    case item5
    case item6
    case item7
    case item8
    case item9
    case item10
    case item11
    case item12
    case item13
    case item14
    case item15
}

extension SimpleListItem: Identifiable {
    var id: Self { self }
}

extension SimpleListItem: CustomStringConvertible {
    var description: String {
        guard let index = Self.allCases.firstIndex(of: self) else { return "Item nil" }
        return "Item \(index)"
    }
}
