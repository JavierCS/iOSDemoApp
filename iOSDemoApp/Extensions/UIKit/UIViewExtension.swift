//
//  UIViewExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 04/09/25.
//

import UIKit

extension UIView {
    func sized(_ size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size.height),
            widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func centered(to container: UIView, by padding: CGFloat = 0, size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(greaterThanOrEqualTo: container.topAnchor, constant: padding),
            leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: padding),
            trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -padding),
            heightAnchor.constraint(equalToConstant: size.height),
            widthAnchor.constraint(equalToConstant: size.width),
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    func horizontallyCentered(to container: UIView, by padding: CGFloat = 0, size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: padding),
            trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding),
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            heightAnchor.constraint(greaterThanOrEqualToConstant: size.height),
            widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func verticallyCentered(to container: UIView, by padding: CGFloat = 0, size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(greaterThanOrEqualTo: container.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -padding),
            centerYAnchor.constraint(equalTo: container.centerYAnchor),
            heightAnchor.constraint(equalToConstant: size.height),
            widthAnchor.constraint(greaterThanOrEqualToConstant: size.width)
        ])
    }
    
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
