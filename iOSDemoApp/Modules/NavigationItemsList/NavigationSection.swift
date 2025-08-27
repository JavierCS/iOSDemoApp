//
//  NavigationSection.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

enum NavigationSectionStyle {
    case none
    case title(title: String)
}

struct NavigationSection {
    let style: NavigationSectionStyle = .none
}
