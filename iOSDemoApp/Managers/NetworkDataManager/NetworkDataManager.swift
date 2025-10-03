//
//  NetworkDataManager.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import Foundation

final class NetworkDataManager {
    static let shared: NetworkDataManager = .init()
    private let session: URLSession
    
    private init() {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        self.session = session
    }
    
    func get<ResponseType: Decodable>(requestObject: Encodable? = nil, responseType: ResponseType.Type, from url: URL) async throws -> ResponseType {
        var request = URLRequest(url: url)
        if let requestObject = requestObject {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            request.httpBody = try encoder.encode(requestObject)
        }
        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(responseType, from: data)
    }
    
    func data(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        return data
    }
}
