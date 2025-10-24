// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnsplashFoundation",
    platforms: [.iOS(.v26)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UnsplashFoundation",
            targets: ["UnsplashFoundation"]
        ),
        .library(
            name: "NetworkFoundation",
            targets: ["NetworkFoundation"]
        ),
        .library(
            name: "iOSDemoAppFoundation",
            targets: ["iOSDemoAppFoundation"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UnsplashFoundation",
            dependencies: [
                "NetworkFoundation",
                "iOSDemoAppFoundation"
            ]
        ),
        .target(
            name: "NetworkFoundation",
            dependencies: [
                "iOSDemoAppFoundation"
            ]
        ),
        .target(
            name: "iOSDemoAppFoundation"
        ),
        .testTarget(
            name: "UnsplashFoundationTests",
            dependencies: ["UnsplashFoundation"]
        ),
    ]
)
