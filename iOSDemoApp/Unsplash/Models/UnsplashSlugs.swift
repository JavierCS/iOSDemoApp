//
//  UnsplashSlugs.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation

struct UnsplashSlugs: Codable {
    let en: String?
    let es: String?
    let ja: String?
    let fr: String?
    let it: String?
    let ko: String?
    let de: String?
    let pt: String?
    let id: String?
    
    func localizedSlug() -> String? {
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
