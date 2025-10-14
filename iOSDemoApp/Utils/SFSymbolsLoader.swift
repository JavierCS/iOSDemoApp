//
//  SFSymbolsLoader.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 14/10/25.
//

import Foundation

class SFSymbolsLoader {
    private var allSymbolsNames: [String] = []
    
    @discardableResult
    func loadSymbolsNames() -> [String] {
        guard let bundle = Bundle(identifier: "com.apple.CoreGlyphs"),
              let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: resourcePath),
              let plistSymbols = plist["symbols"] as? [String: String] else {
            return []
        }
        allSymbolsNames = Array(plistSymbols.keys).sorted { $0 < $1 }
        return allSymbolsNames
    }
}
