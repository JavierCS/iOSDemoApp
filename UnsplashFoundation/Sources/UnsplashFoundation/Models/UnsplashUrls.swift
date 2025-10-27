//
//  UnsplashUrls.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashUrls: Codable, Sendable {
    public let raw: URL?
    public let full: URL?
    public let regular: URL?
    public let small: URL?
    public let medium: URL?
    public let large: URL?
    public let thumb: URL?
    public let small_s3: URL?
    
    // MARK: Initialization Code
    public static func mock() -> UnsplashUrls {
        return UnsplashUrls(
            raw: URL(string: "https://images.unsplash.com/photo-1760709071560-0f2b1daaf5cb?ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA&ixlib=rb-4.1.0"),
            full: URL(string: "https://images.unsplash.com/photo-1760709071560-0f2b1daaf5cb?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA&ixlib=rb-4.1.0&q=85"),
            regular: URL(string: "https://images.unsplash.com/photo-1760709071560-0f2b1daaf5cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA&ixlib=rb-4.1.0&q=80&w=1080"),
            small: URL(string: "https://images.unsplash.com/photo-1760709071560-0f2b1daaf5cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA&ixlib=rb-4.1.0&q=80&w=400"),
            medium: nil,
            large: nil,
            thumb: URL(string: "https://images.unsplash.com/photo-1760709071560-0f2b1daaf5cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4MDIxMjR8MHwxfGFsbHwxfHx8fHx8fHwxNzYxNTg5ODY3fA&ixlib=rb-4.1.0&q=80&w=200"),
            small_s3: URL(string: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1760709071560-0f2b1daaf5cb")
        )
    }
    
    public static func userMock() -> UnsplashUrls {
        return UnsplashUrls(
            raw: nil,
            full: nil,
            regular: nil,
            small: URL(string: "https://images.unsplash.com/profile-1606423532925-acea243c006bimage?ixlib=rb-4.1.0&crop=faces&fit=crop&w=32&h=32"),
            medium: URL(string: "https://images.unsplash.com/profile-1606423532925-acea243c006bimage?ixlib=rb-4.1.0&crop=faces&fit=crop&w=64&h=64"),
            large: URL(string: "https://images.unsplash.com/profile-1606423532925-acea243c006bimage?ixlib=rb-4.1.0&crop=faces&fit=crop&w=128&h=128"),
            thumb: nil,
            small_s3: nil
        )
    }
}
