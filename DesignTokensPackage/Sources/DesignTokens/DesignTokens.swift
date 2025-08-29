//
//  DesignTokens.swift
//  Design Tokens System for SwiftUI
//
//  100% compatible with design-tokens.css
//  Ensures visual consistency between Web and SwiftUI
//

import SwiftUI

/// Design Tokens configuration
public struct DesignTokensConfig {
    /// Brand color hue (0-360)
    public var brandHue: Double = 217
    
    /// Brand color saturation (0-1)
    public var brandSaturation: Double = 0.91
    
    /// Border radius scale factor
    public var radiusScale: Double = 1.0
    
    /// Spacing scale factor
    public var spacingScale: Double = 1.0
    
    /// Global font scale factor
    public var fontScale: Double = 1.0
    
    /// Contrast mode
    public var contrastMode: ContrastMode = .normal
    
    /// Letter spacing mode
    public var letterSpacing: LetterSpacingMode = .normal
    
    /// Line height mode
    public var lineHeight: LineHeightMode = .normal
    
    public init() {}
}

/// Contrast modes matching CSS
public enum ContrastMode {
    case normal
    case high
    case ultra
}

/// Letter spacing modes matching CSS
public enum LetterSpacingMode {
    case normal
    case wide     // 0.025em
    case wider    // 0.05em
    case widest   // 0.1em
    
    var emValue: Double {
        switch self {
        case .normal: return 0
        case .wide: return 0.025
        case .wider: return 0.05
        case .widest: return 0.1
        }
    }
}

/// Line height modes matching CSS
public enum LineHeightMode {
    case tight    // 1.25
    case normal   // 1.6
    case relaxed  // 1.8
    case loose    // 2.2
    
    var value: Double {
        switch self {
        case .tight: return 1.25
        case .normal: return 1.6
        case .relaxed: return 1.8
        case .loose: return 2.2
        }
    }
}

/// Main Design Tokens namespace
public struct DesignTokens {
    public static var config = DesignTokensConfig()
    
    // MARK: - Color System
    public struct Colors {
        // Brand colors (10 levels matching CSS)
        public static var brand50: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.98)
        }
        public static var brand100: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.96)
        }
        public static var brand200: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.91)
        }
        public static var brand300: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.84)
        }
        public static var brand400: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.65)
        }
        public static var brand500: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.50)
        }
        public static var brand600: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.40)
        }
        public static var brand700: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.30)
        }
        public static var brand800: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.20)
        }
        public static var brand900: Color {
            Color(hue: config.brandHue/360, saturation: config.brandSaturation, brightness: 0.10)
        }
        
        // Neutral colors (gray scale)
        public static var gray50: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.98)
        }
        public static var gray100: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.96)
        }
        public static var gray200: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.91)
        }
        public static var gray300: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.84)
        }
        public static var gray400: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.65)
        }
        public static var gray500: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.50)
        }
        public static var gray600: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.40)
        }
        public static var gray700: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.30)
        }
        public static var gray800: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.20)
        }
        public static var gray900: Color {
            Color(hue: config.brandHue/360, saturation: 0.10, brightness: 0.10)
        }
        
        // Semantic colors
        public static var primary: Color {
            brand600
        }
        public static var primaryForeground: Color {
            Color.white
        }
        public static var secondary: Color {
            brand100
        }
        public static var secondaryForeground: Color {
            brand700
        }
        public static var muted: Color {
            gray100
        }
        public static var mutedForeground: Color {
            gray600
        }
        public static var success: Color {
            Color(hex: "#22c55e")
        }
        public static var danger: Color {
            Color(hex: "#ef4444")
        }
        public static var warning: Color {
            Color(hex: "#f59e0b")
        }
        public static var info: Color {
            Color(hex: "#3b82f6")
        }
        
        // Functional colors
        public static var background: Color {
            Color.white
        }
        public static var foreground: Color {
            gray900
        }
        public static var card: Color {
            Color.white
        }
        public static var cardForeground: Color {
            gray900
        }
        public static var border: Color {
            gray200
        }
        public static var input: Color {
            gray200
        }
        public static var ring: Color {
            brand500.opacity(0.3)
        }
        public static var disabled: Color {
            gray100
        }
        public static var disabledForeground: Color {
            gray400
        }
        
        // Dark mode colors (for environment-based switching)
        public struct Dark {
            public static var primary: Color { brand500 }
            public static var primaryForeground: Color { gray900 }
            public static var secondary: Color { brand900 }
            public static var secondaryForeground: Color { brand200 }
            public static var muted: Color { gray700 }
            public static var mutedForeground: Color { gray400 }
            public static var success: Color { Color(hex: "#6ee7b7") }
            public static var danger: Color { Color(hex: "#fca5a5") }
            public static var warning: Color { Color(hex: "#fcd34d") }
            public static var info: Color { Color(hex: "#93c5fd") }
            public static var background: Color { gray900 }
            public static var foreground: Color { Color(white: 0.95) }
            public static var card: Color { gray800 }
            public static var cardForeground: Color { gray100 }
            public static var border: Color { gray700 }
            public static var input: Color { gray700 }
            public static var ring: Color { brand500.opacity(0.3) }
            public static var disabled: Color { gray800 }
            public static var disabledForeground: Color { gray600 }
        }
    }
    
    // MARK: - Typography System
    public struct Typography {
        /// Base font size in points (matching 1rem = 16px in CSS)
        private static let baseFontSize: CGFloat = 16
        
        // Font sizes (rem to points conversion)
        public static var textXS: CGFloat { 0.75 * baseFontSize * config.fontScale }    // 12pt
        public static var textSM: CGFloat { 0.875 * baseFontSize * config.fontScale }   // 14pt
        public static var textBase: CGFloat { 1.0 * baseFontSize * config.fontScale }   // 16pt
        public static var textLG: CGFloat { 1.125 * baseFontSize * config.fontScale }   // 18pt
        public static var textXL: CGFloat { 1.25 * baseFontSize * config.fontScale }    // 20pt
        public static var text2XL: CGFloat { 1.5 * baseFontSize * config.fontScale }    // 24pt
        public static var text3XL: CGFloat { 1.875 * baseFontSize * config.fontScale }  // 30pt
        public static var text4XL: CGFloat { 2.25 * baseFontSize * config.fontScale }   // 36pt
        public static var text5XL: CGFloat { 3.0 * baseFontSize * config.fontScale }    // 48pt
        public static var text6XL: CGFloat { 3.75 * baseFontSize * config.fontScale }   // 60pt
        
        // Font weights
        public static let thin: Font.Weight = .thin
        public static let light: Font.Weight = .light
        public static let regular: Font.Weight = .regular
        public static let medium: Font.Weight = .medium
        public static let semibold: Font.Weight = .semibold
        public static let bold: Font.Weight = .bold
        public static let heavy: Font.Weight = .heavy
        public static let black: Font.Weight = .black
        
        // Letter spacing (tracking in SwiftUI, matches CSS em values)
        public static var letterSpacing: CGFloat {
            let fontSize = textBase
            return fontSize * config.letterSpacing.emValue
        }
        
        // Line spacing (matches CSS line-height)
        public static func lineSpacing(for fontSize: CGFloat) -> CGFloat {
            let lineHeight = config.lineHeight.value
            return (lineHeight - 1.0) * fontSize
        }
    }
    
    // MARK: - Spacing System
    public struct Spacing {
        private static let baseUnit: CGFloat = 4 // 0.25rem = 4px
        
        public static var space0: CGFloat { 0 }
        public static var space0_5: CGFloat { baseUnit * 0.5 * config.spacingScale }   // 2pt
        public static var space1: CGFloat { baseUnit * 1 * config.spacingScale }       // 4pt
        public static var space1_5: CGFloat { baseUnit * 1.5 * config.spacingScale }   // 6pt
        public static var space2: CGFloat { baseUnit * 2 * config.spacingScale }       // 8pt
        public static var space2_5: CGFloat { baseUnit * 2.5 * config.spacingScale }   // 10pt
        public static var space3: CGFloat { baseUnit * 3 * config.spacingScale }       // 12pt
        public static var space3_5: CGFloat { baseUnit * 3.5 * config.spacingScale }   // 14pt
        public static var space4: CGFloat { baseUnit * 4 * config.spacingScale }       // 16pt
        public static var space5: CGFloat { baseUnit * 5 * config.spacingScale }       // 20pt
        public static var space6: CGFloat { baseUnit * 6 * config.spacingScale }       // 24pt
        public static var space7: CGFloat { baseUnit * 7 * config.spacingScale }       // 28pt
        public static var space8: CGFloat { baseUnit * 8 * config.spacingScale }       // 32pt
        public static var space9: CGFloat { baseUnit * 9 * config.spacingScale }       // 36pt
        public static var space10: CGFloat { baseUnit * 10 * config.spacingScale }     // 40pt
        public static var space12: CGFloat { baseUnit * 12 * config.spacingScale }     // 48pt
        public static var space14: CGFloat { baseUnit * 14 * config.spacingScale }     // 56pt
        public static var space16: CGFloat { baseUnit * 16 * config.spacingScale }     // 64pt
        public static var space20: CGFloat { baseUnit * 20 * config.spacingScale }     // 80pt
        public static var space24: CGFloat { baseUnit * 24 * config.spacingScale }     // 96pt
    }
    
    // MARK: - Radius System
    public struct Radius {
        private static let baseRadius: CGFloat = 6 // 0.375rem = 6px
        
        public static var none: CGFloat { 0 }
        public static var sm: CGFloat { baseRadius * 0.66 * config.radiusScale }   // ~4pt
        public static var base: CGFloat { baseRadius * config.radiusScale }        // ~6pt
        public static var md: CGFloat { baseRadius * 1.33 * config.radiusScale }   // ~8pt
        public static var lg: CGFloat { baseRadius * 2 * config.radiusScale }      // ~12pt
        public static var xl: CGFloat { baseRadius * 3 * config.radiusScale }      // ~18pt
        public static var xl2: CGFloat { baseRadius * 4 * config.radiusScale }     // ~24pt
        public static var xl3: CGFloat { baseRadius * 5 * config.radiusScale }     // ~30pt
        public static var full: CGFloat { 9999 }
    }
    
    // MARK: - Shadow System
    public struct Shadows {
        public static let xs = Shadow(
            color: Color.black.opacity(0.05),
            radius: 1,
            x: 0,
            y: 1
        )
        
        public static let sm = Shadow(
            color: Color.black.opacity(0.1),
            radius: 2,
            x: 0,
            y: 1
        )
        
        public static let base = Shadow(
            color: Color.black.opacity(0.1),
            radius: 3,
            x: 0,
            y: 2
        )
        
        public static let md = Shadow(
            color: Color.black.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
        
        public static let lg = Shadow(
            color: Color.black.opacity(0.1),
            radius: 10,
            x: 0,
            y: 10
        )
        
        public static let xl = Shadow(
            color: Color.black.opacity(0.25),
            radius: 25,
            x: 0,
            y: 25
        )
        
        public static let xl2 = Shadow(
            color: Color.black.opacity(0.35),
            radius: 25,
            x: 0,
            y: 25
        )
        
        public static let inner = Shadow(
            color: Color.black.opacity(0.06),
            radius: 2,
            x: 0,
            y: 2
        )
    }
}

// MARK: - Shadow Helper
public struct Shadow {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
    
    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

// MARK: - Color Extension for Hex Support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}