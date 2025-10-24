//
//  OCR.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 26/08/25.
//

import UIKit
import Vision
import iOSDemoAppFoundation

enum OCR {
    static func recognizeText(in image: UIImage, languages: [String] = ["es-MX", "es-ES", "en-US"], level: VNRequestTextRecognitionLevel = .accurate) async throws -> DocumentTextResult {
        guard let cgImage = image.cgImage else {
            throw NSError(domain: String(describing: OCR.self), code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("ocrNoCGImage", comment: .empty)])
        }
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                let observations = (request.results as? [VNRecognizedTextObservation]) ?? []
                let best = observations.compactMap { $0.topCandidates(1).first?.string }
                
                continuation.resume(returning: DocumentTextResult(
                    fullText: best.joined(separator: "\n"),
                    lines: best,
                    rawObservations: observations)
                )
            }
            
            request.recognitionLevel = level
            request.usesLanguageCorrection = true
            request.recognitionLanguages = languages
            
            let handler = VNImageRequestHandler(cgImage: cgImage, orientation: .init(image.imageOrientation), options: [:])
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}
