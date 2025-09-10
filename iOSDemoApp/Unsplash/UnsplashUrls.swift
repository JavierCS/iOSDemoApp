//
//  UnsplashUrls.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

struct UnsplashUrls: Codable {
    let raw: URL?
    let full: URL?
    let regular: URL?
    let small: URL?
    let medium: URL?
    let large: URL?
    let thumb: URL?
    let small_s3: URL?
}
