//
//  UnsplashPhoto.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation
import NetworkFoundation

public struct UnsplashPhoto: Codable, Identifiable, Sendable {
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
    
    // MARK: Initialization Code
    init(id: String?, slug: String?, alternative_slugs: UnsplashSlugs?, created_at: Date?, updated_at: Date?, promoted_at: Date?, width: Int?, height: Int?, blur_hash: String?, description: String?, alt_description: String?, urls: UnsplashUrls?, links: UnsplashLinks?, likes: Int?, liked_by_user: Bool, sponsorship: UnsplashSponsorship?, asset_type: String?, user: UnsplashUser?) {
        self.id = id
        self.slug = slug
        self.alternative_slugs = alternative_slugs
        self.created_at = created_at
        self.updated_at = updated_at
        self.promoted_at = promoted_at
        self.width = width
        self.height = height
        self.blur_hash = blur_hash
        self.description = description
        self.alt_description = alt_description
        self.urls = urls
        self.links = links
        self.likes = likes
        self.liked_by_user = liked_by_user
        self.sponsorship = sponsorship
        self.asset_type = asset_type
        self.user = user
    }
    
    public static func mock() -> UnsplashPhoto {
        return UnsplashPhoto(
            id: "FLfNL6XuOEM",
            slug: "mountain-peak-reflecting-in-calm-lake-at-sunrise-FLfNL6XuOEM",
            alternative_slugs: .mock(),
            created_at: .now,
            updated_at: .now,
            promoted_at: .now,
            width: 5504,
            height: 8256,
            blur_hash: "LeEWRTWDj?of%%aeayayE3ofWBWB",
            description: nil,
            alt_description: "Mountain peak reflecting in calm lake at sunrise.",
            urls: .mock(),
            links: .mock(),
            likes: 122,
            liked_by_user: false,
            sponsorship: nil,
            asset_type: "photo",
            user: .mock()
        )
    }
    
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
    
    public func downloadImageData(from url: URL?) async throws -> Data {
        guard let url = url else { throw UnsplashAPIError.emptyURL }
        return try await NetworkDataManager.shared.data(from: url)
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
