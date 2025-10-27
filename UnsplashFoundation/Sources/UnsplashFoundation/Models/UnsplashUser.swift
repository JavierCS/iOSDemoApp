//
//  UnsplashUser.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashUser: Codable, Sendable {
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
    
    // MARK: Initialization Code
    public static func mock() -> UnsplashUser {
        return UnsplashUser(
            id: "TkII9dSFNUQ",
            updated_at: .now,
            username: "nadine3",
            name: "Nadine Marfurt",
            first_name: "Nadine",
            last_name: "Marfurt",
            twitter_username: nil,
            portfolio_url: nil,
            bio: "Hobby photography is a way to take in the world around me and expand my artistic side. Excited to share the pictures that have been rotting on my hard drive!",
            location: nil,
            links: .userMock(),
            profile_image: .userMock(),
            instagram_username: nil,
            total_collections: 1,
            total_likes: 4,
            total_photos: 662,
            total_promoted_photos: 16,
            total_illustrations: 0,
            total_promoted_illustrations: 0,
            accepted_tos: true,
            for_hire: false,
            social: .mock()
        )
    }
}
