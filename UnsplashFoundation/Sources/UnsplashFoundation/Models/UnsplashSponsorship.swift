//
//  UnsplashSponsorship.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashSponsorship: Codable {
//    public let impression_urls: []
    public let tagline: String?
    public let tagline_url: URL?
    public let sponsor: UnsplashSponsor?
}
