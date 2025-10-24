//
//  UnsplashSponsor.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashSponsor: Codable, Sendable {
    public let id: String?
    public let updated_at: Date?
    public let username: String?
    public let name: String?
    public let first_name: String?
    public let last_name: String?
    public let twitter_username: String?
    public let portfolio_url: URL?
    public let bio: String?
    public let location: String?
    public let links: UnsplashLinks?
    public let profile_image: UnsplashUrls?
    public let instagram_username: String?
    public let total_collections: Int?
    public let total_likes: Int?
    public let total_photos: Int?
    public let total_promoted_photos: Int?
    public let total_illustrations: Int?
    public let total_promoted_illustrations: Int?
    public let accepted_tos: Bool
    public let for_hire: Bool
    public let social: UnsplashSocial?
}
