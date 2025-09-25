//
//  UnsplashPhoto.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

struct UnsplashPhoto: Codable {
    let id: String?
    let slug: String?
    let alternative_slugs: UnsplashSlugs?
    let created_at: Date?
    let updated_at: Date?
    let promoted_at: Date?
    let width: Int?
    let height: Int?
    let blur_hash: String?
    let description: String?
    let alt_description: String?
//    let breadcrumbs: []
    let urls: UnsplashUrls?
    let links: UnsplashLinks?
    let likes: Int?
    let liked_by_user: Bool
//    let current_user_collections: []
    let sponsorship: UnsplashSponsorship?
//    let topic_submissions
    let asset_type: String?
    let user: UnsplashUser?
    
    static func get() async throws -> [UnsplashPhoto] {
        do {
            let url = try UnsplashAPIPath.urlForPath(for: .photosPath)
            let photos = try await NetworkDataManager.shared.get(responseType: [UnsplashPhoto].self, from: url)
            return photos
        } catch {
            throw error
        }
    }
    
    func contentConfiguration(for style: UnsplashPhotoContentViewStyle = .complete) -> UnsplashPhotoContentConfiguration {
        UnsplashPhotoContentConfiguration(style: style, photo: self)
    }
}

extension UnsplashPhoto: Equatable {
    static func == (lhs: UnsplashPhoto, rhs: UnsplashPhoto) -> Bool {
        lhs.id == rhs.id
    }
}
