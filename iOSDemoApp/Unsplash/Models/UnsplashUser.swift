//
//  UnsplashUser.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

struct UnsplashUser: Codable {
    let id: String?
    let updated_at: Date?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let twitter_username: String?
    let portfolio_url: URL?
    let bio: String?
    let location: String?
    let links: UnsplashLinks?
    let profile_image: UnsplashUrls?
    let instagram_username: String?
    let total_collections: Int?
    let total_likes: Int?
    let total_photos: Int?
    let total_promoted_photos: Int?
    let total_illustrations: Int?
    let total_promoted_illustrations: Int?
    let accepted_tos: Bool
    let for_hire: Bool
    let social: UnsplashSocial?
}
