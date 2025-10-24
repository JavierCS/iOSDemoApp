//
//  UnsplashPhoto.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation
import NetworkFoundation

public struct UnsplashPhoto: Codable, Sendable {
    public let id: String?
    public let slug: String?
    public let alternative_slugs: UnsplashSlugs?
    public let created_at: Date?
    public let updated_at: Date?
    public let promoted_at: Date?
    public let width: Int?
    public let height: Int?
    public let blur_hash: String?
    public let description: String?
    public let alt_description: String?
//    public let breadcrumbs: []
    public let urls: UnsplashUrls?
    public let links: UnsplashLinks?
    public let likes: Int?
    public let liked_by_user: Bool
//    public let current_user_collections: []
    public let sponsorship: UnsplashSponsorship?
//    public let topic_submissions
    public let asset_type: String?
    public let user: UnsplashUser?
    
    // MARK: Utils Functions
    public func localizedSlug() -> String? {
        return alternative_slugs?.localizedSlug()
    }
    
    // MARK: Network Management
    public static func get() async throws -> [UnsplashPhoto] {
        do {
            let url = try await UnsplashAPIPath.urlForPath(for: .photosPath)
            let photos = try await NetworkDataManager.shared.get(responseType: [UnsplashPhoto].self, from: url)
            return photos
        } catch {
            throw error
        }
    }
    
    // MARK: Drawing Functions
    public func contentConfiguration(for style: UnsplashPhotoContentViewStyle = .complete) -> UnsplashPhotoContentConfiguration {
        UnsplashPhotoContentConfiguration(style: style, photo: self)
    }
}

// MARK: - Equatable Management
extension UnsplashPhoto: Equatable {
    public static func == (lhs: UnsplashPhoto, rhs: UnsplashPhoto) -> Bool {
        lhs.id == rhs.id
    }
}
