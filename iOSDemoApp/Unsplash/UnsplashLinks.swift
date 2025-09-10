//
//  UnsplashLinks.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

struct UnsplashLinks: Codable {
    let my: URL?
    let html: URL?
    let download: URL?
    let download_location: URL?
    let photos: URL?
    let likes: URL?
    let portfolio: URL?
    
    enum CodingKeys: String, CodingKey {
        case my = "self"
        case html
        case download
        case download_location
        case photos
        case likes
        case portfolio
    }
}
