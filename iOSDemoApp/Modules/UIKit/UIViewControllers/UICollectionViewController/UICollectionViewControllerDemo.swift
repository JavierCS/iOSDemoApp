//
//  UICollectionViewControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

final class UICollectionViewControllerDemo: UICollectionViewController {
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
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
        title = NSLocalizedString("uiCollectionViewController", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
        collectionView.backgroundColor = .clear
    }
}
