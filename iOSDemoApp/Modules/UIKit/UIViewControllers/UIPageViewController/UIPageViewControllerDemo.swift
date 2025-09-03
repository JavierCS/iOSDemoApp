//
//  UIPageViewControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 01/09/25.
//

import UIKit

final class UIPageViewControllerDemo: UIPageViewController {
    // MARK: - UIElements
    private let pageControl = UIPageControl()
    
    // MARK: - Logic Vars
    private var pages: [UIViewController]
    private(set) var currentIndex: Int = 0
    
    // MARK: - Initialization Code
    init(pages: [UIViewController], transitionStyle: UIPageViewController.TransitionStyle = .pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal) {
        self.pages = pages
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        if let first = pages.first {
            title = first.title
            setViewControllers([first], direction: .forward, animated: true)
        }
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = currentIndex
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource Management
extension UIPageViewControllerDemo: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let idx = pages.firstIndex(of: viewController) else { return nil }
        if idx - 1 >= 0 {
            return pages[idx - 1]
        }
        return pages.last
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let idx = pages.firstIndex(of: viewController) else { return nil }
        if idx + 1 < pages.count {
            return pages[idx + 1]
        }
        return pages.first
    }
}

// MARK: - UIPageViewControllerDelegate Management
extension UIPageViewControllerDemo: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard completed,
              let visible = viewControllers?.first,
              let idx = pages.firstIndex(of: visible) else { return }
        navigationItem.title = visible.title
        currentIndex = idx
        pageControl.currentPage = idx
    }
}
