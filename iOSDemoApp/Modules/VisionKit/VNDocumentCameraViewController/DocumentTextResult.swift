//
//  DocumentTextResult.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 26/08/25.
//

import Vision

struct DocumentTextResult {
    let fullText: String
    let lines: [String]
    let rawObservations: [VNRecognizedTextObservation]
}
