//
//  UnsplashSlugs.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation
import NetworkFoundation
import iOSDemoAppFoundation

public struct UnsplashSlugs: Codable {
    public let en: String?
    public let es: String?
    public let ja: String?
    public let fr: String?
    public let it: String?
    public let ko: String?
    public let de: String?
    public let pt: String?
    public let id: String?
    
    public func localizedSlug() -> String? {
        let localeId = Locale.current.identifier
        let mirror = Mirror(reflecting: self)
        for localization in mirror.children {
            if let localizationId = localization.label,
               localeId.range(of: localizationId, options: .caseInsensitive) != nil,
               let completeSlug = localization.value as? String {
                let slugComponents = completeSlug.split(separator: "-").dropLast()
                let slug = slugComponents.joined(separator: " ")
                return slug.capitalizedFirst + "."
            }
        }
        return en
    }
}
