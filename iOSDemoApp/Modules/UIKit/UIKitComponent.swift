//
//  UIKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

enum UIKitComponent: String, CaseIterable, NavigationItem {
    case uiActivityIndicator
    case uiButton
    case uiDatePicker
    case uiImageView
    case uiLabel
    case uiPageControl
    case uiPickerView
    case uiProgressView
    case uiSegmentedControl
    case uiSlider
    case uiStepper
    case uiSwitch
    case uiTextField
    case uiTextView
    
    case uiTabBarController
    case uiTableViewController
    case uiCollectionViewController
    
    func title() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
    
    func image() -> UIImage? {
        switch self {
        case .uiActivityIndicator:
            UIImage(systemName: "progress.indicator")
        case .uiButton:
            UIImage(systemName: "capsule")
        case .uiDatePicker:
            UIImage(systemName: "calendar")
        case .uiImageView:
            UIImage(systemName: "photo")
        case .uiLabel:
            UIImage(systemName: "textformat")
        case .uiPageControl:
            UIImage(systemName: "ellipsis")
        case .uiPickerView:
            UIImage(systemName: "line.3.horizontal.decrease")
        case .uiProgressView:
            UIImage(systemName: "progress.indicator")
        case .uiSegmentedControl:
            UIImage(systemName: "rectangle.split.3x1")
        case .uiSlider:
            UIImage(systemName: "slider.horizontal.3")
        case .uiStepper:
            UIImage(systemName: "plusminus")
        case .uiSwitch:
            UIImage(systemName: "switch.2")
        case .uiTextField:
            UIImage(systemName: "character.cursor.ibeam")
        case .uiTextView:
            UIImage(systemName: "character.cursor.ibeam")
            
        case .uiTabBarController:
            UIImage(systemName: "platter.filled.bottom.iphone")
        case .uiTableViewController:
            UIImage(systemName: "rectangle.grid.1x3")
        case .uiCollectionViewController:
            UIImage(systemName: "square.grid.3x3")
        }
    }
    
    func navigationDestination() -> UIViewController {
        switch self {
        case .uiActivityIndicator:
            UIViewController()
        case .uiButton:
            UIButtonDemoViewController()
        case .uiDatePicker:
            UIViewController()
        case .uiImageView:
            UIViewController()
        case .uiLabel:
            UIViewController()
        case .uiPageControl:
            UIViewController()
        case .uiPickerView:
            UIViewController()
        case .uiProgressView:
            UIViewController()
        case .uiSegmentedControl:
            UIViewController()
        case .uiSlider:
            UIViewController()
        case .uiStepper:
            UIViewController()
        case .uiSwitch:
            UIViewController()
        case .uiTextField:
            UIViewController()
        case .uiTextView:
            UIViewController()
        case .uiTabBarController:
            UIViewController()
        case .uiTableViewController:
            UIViewController()
        case .uiCollectionViewController:
            UIViewController()
        }
    }
    
    func transitionStyle() -> LearningTransitionStyle {
        return .push
    }
    
    static func listController() -> NavigationItemsList {
        let listTitle = NSLocalizedString("uikit", comment: .empty)
        let listController = NavigationItemsList(
            title: listTitle,
            dataSource: [
                (NavigationSectionStyle.title(title: UIKitSection.uiElements.title()), [
                    UIKitComponent.uiActivityIndicator,
                    UIKitComponent.uiButton,
                    UIKitComponent.uiDatePicker,
                    UIKitComponent.uiImageView,
                    UIKitComponent.uiLabel,
                    UIKitComponent.uiPageControl,
                    UIKitComponent.uiPickerView,
                    UIKitComponent.uiProgressView,
                    UIKitComponent.uiSegmentedControl,
                    UIKitComponent.uiSlider,
                    UIKitComponent.uiStepper,
                    UIKitComponent.uiSwitch,
                    UIKitComponent.uiTextField,
                    UIKitComponent.uiTextView
                ] as [NavigationItem]),
                (NavigationSectionStyle.title(title: UIKitSection.uiViewControllers.title()), [
                    UIKitComponent.uiTabBarController,
                    UIKitComponent.uiTableViewController,
                    UIKitComponent.uiCollectionViewController
                ] as [NavigationItem])
            ]
        )
        return listController
    }
}
