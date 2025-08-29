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
            exclude: ["run.sh", "Package.swift"],
            sources: [
                "main.swift",
                "ContentViewFinal.swift",
                "DesignTokens.swift",
                "FullControlPanelNew.swift",
                "GlobalTextModifier.swift",
                "ResponsiveLayout.swift",
                "CompleteColorSystem.swift",
                "TypographySystem.swift",
                "HierarchySystem.swift",
                "SpacingSystem.swift",
                "RadiusSystem.swift",
                "ShadowSystem.swift",
                "AccessibilitySystem.swift",
                "ComponentsSystem.swift",
                "AllSystemViews.swift"
            ]
        )
    ]
)