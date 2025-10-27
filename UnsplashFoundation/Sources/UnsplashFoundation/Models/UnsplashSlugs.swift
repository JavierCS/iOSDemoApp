//
//  UnsplashSlugs.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 09/09/25.
//

import Foundation
import NetworkFoundation
import iOSDemoAppFoundation

public struct UnsplashSlugs: Codable, Sendable {
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
    
    // MARK: Initialization Code
    
    public static func mock() -> UnsplashSlugs {
        return UnsplashSlugs(
            en: "mountain-peak-reflecting-in-calm-lake-at-sunrise-FLfNL6XuOEM",
            es: "pico-de-la-montana-reflejandose-en-un-lago-tranquilo-al-amanecer-FLfNL6XuOEM",
            ja: "日の出の穏やかな湖に映る山頂-FLfNL6XuOEM",
            fr: "sommet-de-la-montagne-se-refletant-dans-un-lac-calme-au-lever-du-soleil-FLfNL6XuOEM",
            it: "picco-della-montagna-che-si-riflette-nel-lago-calmo-allalba-FLfNL6XuOEM",
            ko: "일출-시-잔잔한-호수에-반사되는-산봉우리-FLfNL6XuOEM",
            de: "der-berggipfel-spiegelt-sich-bei-sonnenaufgang-in-einem-ruhigen-see-FLfNL6XuOEM",
            pt: "pico-da-montanha-refletindo-no-lago-calmo-ao-nascer-do-sol-FLfNL6XuOEM",
            id: "puncak-gunung-yang-memantulkan-di-danau-yang-tenang-saat-matahari-terbit-FLfNL6XuOEM"
        )
    }
}
