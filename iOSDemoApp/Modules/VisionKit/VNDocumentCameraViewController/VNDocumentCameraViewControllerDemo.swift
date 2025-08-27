//
//  VNDocumentCameraViewControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 26/08/25.
//

import UIKit
import VisionKit

final class VNDocumentCameraViewControllerDemo: UIViewController {
    var scanButton: UIBarButtonItem!
    
    // MARK: - Lifecycle Management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
    }
    
    // MARK: - Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("vnDocumentCameraViewController", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
        
        scanButton = UIBarButtonItem(image: UIImage(systemName: "document.viewfinder"), style: .prominent, target: self, action: #selector(didTapScanButton(_:)))
        navigationItem.setRightBarButton(scanButton, animated: false)
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
}

// MARK: - VNDocumentCameraViewControllerDelegate Management
extension VNDocumentCameraViewControllerDemo: VNDocumentCameraViewControllerDelegate {
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
