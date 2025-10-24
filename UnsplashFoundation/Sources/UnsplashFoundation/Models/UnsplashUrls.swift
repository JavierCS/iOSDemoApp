//
//  UnsplashUrls.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashUrls: Codable, Sendable {
    public let raw: URL?
    public let full: URL?
    public let regular: URL?
    public let small: URL?
    public let medium: URL?
    public let large: URL?
    public let thumb: URL?
    public let small_s3: URL?
}
