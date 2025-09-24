//
//  RemoteConfigManager.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 23/09/25.
//

import FirebaseRemoteConfig

final class RemoteConfigManager {
    static let shared: RemoteConfigManager = .init()
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {}
    
    func setUp() {
        Task {
            do {
                try await fetchRemoteValues()
            } catch {}
        }
    }
    
    func fetchRemoteValues() async throws {
        try await remoteConfig.fetch()
        try await remoteConfig.activate()
    }
    
    func configValue(for key: RemoteConfigKey) -> RemoteConfigValue {
        remoteConfig.configValue(forKey: key.rawValue)
    }
}
