// swift-tools-version: 6.0

import PackageDescription

// Generated SDK version: 1.0.2
let package = Package(
    name: "ApolloSignal",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "ApolloSignal",
            targets: ["ApolloSignal"]
        ),
    ],
    targets: [
        .target(
            name: "ApolloSignal"
        ),
    ]
)
