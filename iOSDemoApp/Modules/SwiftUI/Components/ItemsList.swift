//
//  ItemsList.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

struct ItemsList: View {
    var body: some View {
        List(SimpleListItem.allCases, id: \.self) { item in
            Text(item.rawValue)
        }
    }
}

#Preview {
    ItemsList()
}
