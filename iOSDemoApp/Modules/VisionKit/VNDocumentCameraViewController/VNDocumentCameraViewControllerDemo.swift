//
//  VNDocumentCameraViewControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 26/08/25.
//

import UIKit
import SwiftUI
import VisionKit

final class VNDocumentCameraViewControllerDemo: UIViewController {
    // MARK: - UI Elements
    private var scanButton: UIBarButtonItem!
    private var scannedContentView: UICollectionView!
    
    // MARK: - Logic Vars
    private var scanResult: [(image: UIImage, result: DocumentTextResult)] = []
    
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("scan", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
        
        scanButton = UIBarButtonItem(image: UIImage(systemName: "document.viewfinder"), style: .prominent, target: self, action: #selector(didTapScanButton(_:)))
        navigationItem.setRightBarButton(scanButton, animated: false)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        scannedContentView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scannedContentView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self))
        scannedContentView.translatesAutoresizingMaskIntoConstraints = false
        scannedContentView.dataSource = self
        scannedContentView.delegate = self
        scannedContentView.backgroundColor = .systemGroupedBackground
        scannedContentView.isPagingEnabled = true
        view.addSubview(scannedContentView)
        NSLayoutConstraint.activate([
            scannedContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scannedContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scannedContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scannedContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UI Elements Actions
    @objc private func didTapScanButton(_ sender: UIBarButtonItem) {
        guard VNDocumentCameraViewController.isSupported else {
            showAlert(messageKey: "vnDocumentCameraViewControllerIsNotSupported")
            return
        }
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = self
        present(scanner, animated: true)
    }
    
    func reloadScannedContent(using newContent: [(image: UIImage, result: DocumentTextResult)]) {
        scanResult = newContent
        scannedContentView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource Management
extension VNDocumentCameraViewControllerDemo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scanResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewCell.self), for: indexPath)
        let pageContent = scanResult[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration(content: { DocumentContentView(content: pageContent) })
        return cell
    }
}

extension VNDocumentCameraViewControllerDemo: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

// MARK: - VNDocumentCameraViewControllerDelegate Management
extension VNDocumentCameraViewControllerDemo: @MainActor VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        Task {
            var combined = [(image: UIImage, result: DocumentTextResult)]()
            for index in 0..<scan.pageCount {
                let image = scan.imageOfPage(at: index)
                do {
                    let result = try await OCR.recognizeText(in: image)
                    combined.append((image, result))
                } catch {
                    await MainActor.run {
                        controller.dismiss(animated: true) { [weak self] in
                            self?.showAlert(messageKey: error.localizedDescription)
                        }
                    }
                }
            }
            await MainActor.run {
                reloadScannedContent(using: combined)
                controller.dismiss(animated: true) { [weak self] in
                    self?.showAlert(messageKey: "vnDocumentCameraViewControllerScanFinished")
                }
            }
        }
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
        controller.dismiss(animated: true) { [weak self] in
            self?.showAlert(messageKey: error.localizedDescription)
        }
    }
}
