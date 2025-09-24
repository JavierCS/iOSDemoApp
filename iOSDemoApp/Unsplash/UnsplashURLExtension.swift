//
//  UnsplashURLExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import Foundation

extension URL {
    static func unsplashBaseURL() -> URL? {
        return URL(string: "https://api.unsplash.com")
    }
    
    func withTokenQuery() throws -> URL {
        let accessKey = RemoteConfigManager.shared.configValue(for: .unsplash_access_key).stringValue
        if accessKey.isEmpty { throw UnsplashAPIError.emptyAccesKey }
        let tokenQueryItem = URLQueryItem(name: "client_id", value: accessKey)
        return appending(queryItems: [tokenQueryItem])
    }
}
