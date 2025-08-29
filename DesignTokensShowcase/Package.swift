// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignTokensShowcase",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        // Library product for external applications
        .library(
            name: "DesignTokensKit",
            targets: ["DesignTokensKit"]
        ),
        // Executable for the showcase demo
        .executable(
            name: "DesignTokensShowcase",
            targets: ["DesignTokensShowcase"]
        )
    ],
    targets: [
        // Library target for reusable design tokens
        .target(
            name: "DesignTokensKit",
            dependencies: [],
            path: "Sources/DesignTokensKit"
        ),
        // Executable target for the showcase demo
        .executableTarget(
            name: "DesignTokensShowcase",
            dependencies: ["DesignTokensKit"],
            path: "Sources/ShowcaseDemo"
        ),
    ]
)