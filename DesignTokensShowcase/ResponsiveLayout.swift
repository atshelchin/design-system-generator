//
//  ResponsiveLayout.swift
//  Responsive layout system for macOS, iOS, and iPadOS
//

import SwiftUI

// MARK: - Device Size Detection

public enum DeviceType {
    case iPhone
    case iPad
    case mac
    
    static var current: DeviceType {
        #if os(iOS) || os(tvOS)
            #if os(iOS)
            if UIDevice.current.userInterfaceIdiom == .pad {
                return .iPad
            } else {
                return .iPhone
            }
            #else
            return .iPhone // tvOS behaves like iPhone
            #endif
        #elseif os(watchOS)
            return .iPhone // watchOS behaves like compact iPhone
        #else
            return .mac
        #endif
    }
}

public enum ScreenSize {
    case compact  // < 768pt (iPhone, small windows)
    case regular  // 768-1024pt (iPad portrait, medium windows)
    case large    // > 1024pt (iPad landscape, large windows)
    
    static func from(width: CGFloat) -> ScreenSize {
        if width < 768 {
            return .compact
        } else if width < 1024 {
            return .regular
        } else {
            return .large
        }
    }
}

// MARK: - Responsive Grid Layout

public struct ResponsiveGrid<Content: View>: View {
    let minItemWidth: CGFloat
    let spacing: CGFloat
    let content: Content
    @ObservedObject var config: DesignTokensConfig
    
    public init(
        minItemWidth: CGFloat,
        spacing: CGFloat? = nil,
        config: DesignTokensConfig,
        @ViewBuilder content: () -> Content
    ) {
        self.minItemWidth = minItemWidth
        self.spacing = spacing ?? DesignTokens.Spacing.space3
        self.config = config
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let columns = max(1, Int(geometry.size.width / minItemWidth))
            let actualSpacing = spacing * CGFloat(config.spacingScale)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: actualSpacing), count: columns),
                spacing: actualSpacing
            ) {
                content
            }
        }
    }
}

// MARK: - Responsive Stack

public struct ResponsiveStack<Content: View>: View {
    let threshold: CGFloat
    let spacing: CGFloat
    let content: Content
    @ObservedObject var config: DesignTokensConfig
    
    public init(
        threshold: CGFloat = 768,
        spacing: CGFloat? = nil,
        config: DesignTokensConfig,
        @ViewBuilder content: () -> Content
    ) {
        self.threshold = threshold
        self.spacing = spacing ?? DesignTokens.Spacing.space4
        self.config = config
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let actualSpacing = spacing * CGFloat(config.spacingScale)
            
            if geometry.size.width < threshold {
                VStack(spacing: actualSpacing) {
                    content
                }
            } else {
                HStack(spacing: actualSpacing) {
                    content
                }
            }
        }
    }
}

// MARK: - Adaptive Columns Helper

public struct AdaptiveColumns {
    public static func columns(for width: CGFloat, minWidth: CGFloat, spacing: CGFloat) -> [GridItem] {
        let columnCount = max(1, Int(width / minWidth))
        return Array(repeating: GridItem(.flexible(), spacing: spacing), count: columnCount)
    }
    
    public static func colorGrid(for screenSize: ScreenSize) -> Int {
        switch screenSize {
        case .compact: return 5   // 5 columns on iPhone
        case .regular: return 8   // 8 columns on iPad portrait
        case .large: return 10    // 10 columns on iPad landscape/Mac
        }
    }
    
    public static func semanticGrid(for screenSize: ScreenSize) -> Int {
        switch screenSize {
        case .compact: return 2   // 2 columns on iPhone
        case .regular: return 4   // 4 columns on iPad portrait
        case .large: return 6     // 6 columns on iPad landscape/Mac
        }
    }
    
    public static func componentsGrid(for screenSize: ScreenSize) -> Int {
        switch screenSize {
        case .compact: return 1   // 1 column on iPhone
        case .regular: return 2   // 2 columns on iPad portrait
        case .large: return 3     // 3 columns on iPad landscape/Mac
        }
    }
}

// MARK: - View Extension for Responsive Behavior

extension View {
    /// Apply responsive padding based on screen size
    public func responsivePadding(_ config: DesignTokensConfig) -> some View {
        GeometryReader { geometry in
            let screenSize = ScreenSize.from(width: geometry.size.width)
            let padding: CGFloat
            
            switch screenSize {
            case .compact:
                padding = DesignTokens.Spacing.space4
            case .regular:
                padding = DesignTokens.Spacing.space6
            case .large:
                padding = DesignTokens.Spacing.space8
            }
            
            self.padding(padding)
        }
    }
    
    /// Hide on small screens
    public func hideOnCompact() -> some View {
        GeometryReader { geometry in
            if ScreenSize.from(width: geometry.size.width) != .compact {
                self
            }
        }
    }
    
    /// Show only on small screens
    public func compactOnly() -> some View {
        GeometryReader { geometry in
            if ScreenSize.from(width: geometry.size.width) == .compact {
                self
            }
        }
    }
}

// MARK: - Platform-Specific Font Sizing

public struct PlatformFont {
    public static func system(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let adjustedSize: CGFloat
        
        switch DeviceType.current {
        case .iPhone:
            // Slightly smaller on iPhone
            adjustedSize = size * 0.95
        case .iPad:
            // Standard size on iPad
            adjustedSize = size
        case .mac:
            // Standard size on Mac
            adjustedSize = size
        }
        
        return Font.system(size: adjustedSize, weight: weight)
    }
}

// MARK: - Environment Values for Responsive Layout

struct ScreenSizeKey: EnvironmentKey {
    static let defaultValue: ScreenSize = .regular
}

extension EnvironmentValues {
    var screenSize: ScreenSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}