//
//  UnsplashSocial.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

public struct UnsplashSocial: Codable, Sendable {
    public let instagram_username: String?
    public let portfolio_url: URL?
    public let twitter_username: String?
    public let paypal_email: String?
    
    // MARK: Initialization Code
    public static func mock() -> UnsplashSocial {
        return UnsplashSocial(
            instagram_username: nil,
            portfolio_url: nil,
            twitter_username: nil,
            paypal_email: nil
        )
    }
}
