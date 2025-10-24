// The Swift Programming Language
// https://docs.swift.org/swift-book

public final class UnsplashFoundation: @unchecked Sendable {
    public static let shared = UnsplashFoundation()
    
    var unsplash_access_key: String?
    var unsplash_application_id: String?
    var unsplash_secret_key: String?
    
    private init() {}
    
    public func configure(accessKey: String? = nil, applicationId: String? = nil, secretKey: String? = nil) {
        unsplash_access_key = accessKey
        unsplash_application_id = applicationId
        unsplash_secret_key = secretKey
    }
}
