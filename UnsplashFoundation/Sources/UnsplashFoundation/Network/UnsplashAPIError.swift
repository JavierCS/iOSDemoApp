//
//  UnsplashAPIError.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import Foundation

public enum UnsplashAPIError: Error {
    case accessKeyNotConfigured
    case emptyAccesKey
    case applicationIdNotConfigured
    case emptyApplicationId
    case secretKeyNotConfigured
    case emptySecretKey
    
    case emptyURL
    case cantBuildURL
}
