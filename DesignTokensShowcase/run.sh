#!/bin/bash

# Build and run the SwiftUI Showcase app
echo "🚀 Building DesignTokens Showcase for macOS..."

# Create a temporary Xcode project structure
cat > Package.swift << 'EOF'
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignTokensShowcase",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "DesignTokensShowcase", targets: ["DesignTokensShowcase"])
    ],
    targets: [
        .executableTarget(
            name: "DesignTokensShowcase",
            path: ".",
            sources: ["ContentView.swift", "DesignTokens.swift"]
        )
    ]
)
EOF

# Build the app
swift build -c release

# Run the app
echo "✅ Launching DesignTokens Showcase..."
./.build/release/DesignTokensShowcase