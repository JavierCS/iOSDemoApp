//
//  NavigationItem.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

protocol NavigationItem {
    func title() -> String
    func image() -> UIImage?
    func navigationDestination() -> UIViewController
    func transitionStyle() -> LearningTransitionStyle
}
