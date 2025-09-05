//
//  UIViewExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 04/09/25.
//

import UIKit

extension UIView {
    func clipped(to container: UIView, by padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding)
        ])
    }
    
    func safeAreaClipped(to container: UIView, by padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    func verticalScrollClipped(to container: UIView, by padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding)
        ])
    }
}
