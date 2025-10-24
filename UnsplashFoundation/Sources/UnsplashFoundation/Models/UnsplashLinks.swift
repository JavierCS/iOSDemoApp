//
//  UnsplashLinks.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashLinks: Codable, Sendable {
    public let my: URL?
    public let html: URL?
    public let download: URL?
    public let download_location: URL?
    public let photos: URL?
    public let likes: URL?
    public let portfolio: URL?
    
    public enum CodingKeys: String, CodingKey {
        case my = "self"
        case html
        case download
        case download_location
        case photos
        case likes
        case portfolio
    }
}
