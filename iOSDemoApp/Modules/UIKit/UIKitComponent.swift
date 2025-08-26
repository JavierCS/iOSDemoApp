//
//  UIKitComponent.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import UIKit

enum UIKitComponent: String, CaseIterable {
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
    
    func section() -> UIKitSection {
        switch self {
        case .uiActivityIndicator,
                .uiButton,
                .uiDatePicker,
                .uiImageView,
                .uiLabel,
                .uiPageControl,
                .uiPickerView,
                .uiProgressView,
                .uiSegmentedControl,
                .uiSlider,
                .uiStepper,
                .uiSwitch,
                .uiTextField,
                .uiTextView:
            return .uiElements
        case .uiTabBarController,
                .uiTableViewController,
                .uiCollectionViewController:
            return .uiViewControllers
        }
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
        return UIViewController()
    }
    
    func transitionType() -> LearningTransitionStyle {
        return .push
    }
}
