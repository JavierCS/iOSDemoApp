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
    
    // MARK: Initialization Code
    public static func mock() -> UnsplashLinks {
        return UnsplashLinks(
            my: URL(string: "https://api.unsplash.com/photos/mountain-peak-reflecting-in-calm-lake-at-sunrise-FLfNL6XuOEM"),
            html: URL(string: "https://unsplash.com/photos/mountain-peak-reflecting-in-calm-lake-at-sunrise-FLfNL6XuOEM"),
            download: URL(string: "https://unsplash.com/photos/FLfNL6XuOEM/download?ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA"),
            download_location: URL(string: "https://api.unsplash.com/photos/FLfNL6XuOEM/download?ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA"),
            photos: nil,
            likes: nil,
            portfolio: nil
        )
    }
    
    public static func userMock() -> UnsplashLinks {
        return UnsplashLinks(
            my: URL(string: "https://api.unsplash.com/users/nadine3"),
            html: URL(string: "https://unsplash.com/@nadine3"),
            download: nil,
            download_location: nil,
            photos: URL(string: "https://api.unsplash.com/users/nadine3/photos"),
            likes: URL(string: "https://api.unsplash.com/users/nadine3/likes"),
            portfolio: URL(string: "https://api.unsplash.com/users/nadine3/portfolio")
        )
    }
}
