//
//  UnsplashAPIPath.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import Foundation

public enum UnsplashAPIPath: String {
    case photosPath = "photos"
    
    static func urlForPath(for path: UnsplashAPIPath) throws -> URL {
        guard let url = try URL.unsplashBaseURL()?.appending(path: path.rawValue).withTokenQuery() else { throw UnsplashAPIError.cantBuildURL }
        return url
    }
}
