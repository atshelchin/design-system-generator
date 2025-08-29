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
        .executable(
            name: "DesignTokensShowcase",
            targets: ["DesignTokensShowcase"]
        )
    ],
    targets: [
        .executableTarget(
            name: "DesignTokensShowcase",
            path: ".",
            exclude: ["run.sh", "Package.swift", "ContentView.swift", "ContentViewNew.swift", "CompactControlPanel.swift", "FloatingPanel.swift"],
            sources: ["ContentViewFinal.swift", "FullControlPanel.swift", "FullControlPanelNew.swift", "DesignTokens.swift", "CompleteColorSystem.swift", "GlobalTextModifier.swift", "ResponsiveLayout.swift", "TypographySystem.swift", "HierarchySystem.swift", "AllSystemViews.swift", "main.swift"]
        )
    ]
)