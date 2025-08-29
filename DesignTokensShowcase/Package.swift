// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignTokensShowcase",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "DesignTokensShowcase",
            targets: ["DesignTokensShowcase"]
        )
    ],
    targets: [
        .executableTarget(
            name: "DesignTokensShowcase",
            path: ".",
            exclude: ["run.sh", "Package.swift"],
            sources: ["ContentView.swift", "DesignTokens.swift", "main.swift"]
        )
    ]
)