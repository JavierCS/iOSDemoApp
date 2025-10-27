//
//  RemoteConfigManager.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import FirebaseRemoteConfig

actor RemoteConfigManager {
    static let shared: RemoteConfigManager = .init()
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {}
    
    func setUp() async throws {
        try await fetchRemoteValues()
    }
    
    func fetchRemoteValues() async throws {
        try await remoteConfig.fetch()
        try await remoteConfig.activate()
    }
    
    func configValue(for key: RemoteConfigKey) -> RemoteConfigValue {
        remoteConfig.configValue(forKey: key.rawValue)
    }
}

extension RemoteConfigValue: @unchecked @retroactive Sendable {}
