//
//  StringExtension.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import Foundation

extension String {
    static let empty = ""
    static let nilString = "nil"
    
    var capitalizedFirst: String {
        guard let first = first else { return self }
        return first.uppercased() + dropFirst()
    }
    
    static func prettyJSONString(from data: Data) -> String? {
        guard
            let object = try? JSONSerialization.jsonObject(with: data, options: []),
            let prettyData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyString = String(data: prettyData, encoding: .utf8)
        else {
            return nil
        }
        return prettyString
    }
}
