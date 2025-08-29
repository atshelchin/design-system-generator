//
//  DesignTokens.swift
//  100% Implementation of design-tokens.css for SwiftUI
//
//  This file provides a complete, reactive implementation of all design tokens
//  ensuring 100% visual parity between Web and SwiftUI
//

import SwiftUI
import Combine

/// Observable Design Tokens Configuration
/// This class ensures all changes are reactive and update the UI in real-time
public class DesignTokensConfig: ObservableObject {
    /// Brand color hue (0-360) matching CSS --brand-hue
    @Published public var brandHue: Double = 217 {
        didSet { objectWillChange.send() }
    }
    
    /// Brand color saturation (0-100) matching CSS --brand-saturation
    @Published public var brandSaturation: Double = 91 {
        didSet { objectWillChange.send() }
    }
    
    /// Border radius scale factor matching CSS --radius-scale
    @Published public var radiusScale: Double = 1.0 {
        didSet { objectWillChange.send() }
    }
    
    /// Spacing scale factor matching CSS --spacing-scale
    @Published public var spacingScale: Double = 1.0 {
        didSet { objectWillChange.send() }
    }
    
    /// Global font scale factor matching CSS --font-scale
    @Published public var fontScale: Double = 1.0 {
        didSet { objectWillChange.send() }
    }
    
    /// Dark mode toggle
    @Published public var isDarkMode: Bool = false {
        didSet { objectWillChange.send() }
    }
    
    /// Selected font family
    @Published public var selectedFont: String = "system" {
        didSet { objectWillChange.send() }
    }
    
    /// Contrast mode enum matching CSS data-contrast
    @Published public var contrast: ContrastMode = .normal {
        didSet { objectWillChange.send() }
    }
    
    /// Letter spacing mode matching CSS data-letter-spacing
    @Published public var letterSpacing: LetterSpacingMode = .normal {
        didSet { objectWillChange.send() }
    }
    
    /// Line height mode matching CSS data-line-height
    @Published public var lineHeight: LineHeightMode = .normal {
        didSet { objectWillChange.send() }
    }
    
    /// Font size preset matching CSS data-font-size
    @Published public var fontSizePreset: FontSizePreset = .normal {
        didSet { objectWillChange.send() }
    }
    
    /// Shared instance for global access
    public static let shared = DesignTokensConfig()
    
    public init() {}
}

// MARK: - Enums matching CSS

public enum ContrastMode: String, CaseIterable {
    case normal = "normal"
    case high = "high"
    case ultra = "ultra"
}

public enum LetterSpacingMode: String, CaseIterable {
    case normal = "normal"
    case wide = "wide"      // 0.025em
    case wider = "wider"    // 0.05em
    case widest = "widest"  // 0.1em
    
    var emValue: Double {
        switch self {
        case .normal: return 0
        case .wide: return 0.025
        case .wider: return 0.05
        case .widest: return 0.1
        }
    }
}

public enum LineHeightMode: String, CaseIterable {
    case tight = "tight"      // 1.25
    case normal = "normal"    // 1.6
    case relaxed = "relaxed"  // 1.8
    case loose = "loose"      // 2.2
    
    var value: Double {
        switch self {
        case .tight: return 1.25
        case .normal: return 1.6
        case .relaxed: return 1.8
        case .loose: return 2.2
        }
    }
}

public enum FontSizePreset: String, CaseIterable {
    case small = "small"        // 0.875
    case normal = "normal"      // 1
    case large = "large"        // 1.125
    case xLarge = "x-large"     // 1.25
    case xxLarge = "xx-large"   // 1.5
    
    var scale: Double {
        switch self {
        case .small: return 0.875
        case .normal: return 1.0
        case .large: return 1.125
        case .xLarge: return 1.25
        case .xxLarge: return 1.5
        }
    }
}

// MARK: - Main Design Tokens Structure

public struct DesignTokens {
    
    // MARK: - Dynamic Color System (100% matching CSS)
    
    public struct Colors {
        private static var config: DesignTokensConfig { DesignTokensConfig.shared }
        
        // MARK: - 面板背景色 Panel Colors
        public static var panel0: Color {
            config.isDarkMode ? Color(NSColor(white: 0.11, alpha: 1)) : Color.white
        }
        
        public static var panel1: Color {
            let h = config.brandHue
            if config.isDarkMode {
                return hsl(h, 10, 15)
            }
            return hsl(h, 10, 98)
        }
        
        public static var panel2: Color {
            let h = config.brandHue
            if config.isDarkMode {
                return hsl(h, 12, 18)
            }
            return hsl(h, 12, 95)
        }
        
        public static var panel3: Color {
            let h = config.brandHue
            if config.isDarkMode {
                return hsl(h, 14, 22)
            }
            return hsl(h, 14, 92)
        }
        
        public static var panelBorder: Color {
            config.isDarkMode ? Color(NSColor(white: 0.2, alpha: 1)) : Color(NSColor(white: 0.9, alpha: 1))
        }
        
        // Helper to create HSL colors matching CSS hsl() function
        private static func hsl(_ hue: Double, _ saturation: Double, _ lightness: Double, opacity: Double = 1.0) -> Color {
            // Convert HSL to RGB for SwiftUI Color
            let h = hue / 360.0
            let s = saturation / 100.0
            let l = lightness / 100.0
            
            let c = (1 - abs(2 * l - 1)) * s
            let x = c * (1 - abs((h * 6).truncatingRemainder(dividingBy: 2) - 1))
            let m = l - c / 2
            
            var r: Double = 0, g: Double = 0, b: Double = 0
            
            let hPrime = (h * 6).truncatingRemainder(dividingBy: 6)
            
            switch hPrime {
            case 0..<1: r = c; g = x; b = 0
            case 1..<2: r = x; g = c; b = 0
            case 2..<3: r = 0; g = c; b = x
            case 3..<4: r = 0; g = x; b = c
            case 4..<5: r = x; g = 0; b = c
            case 5..<6: r = c; g = 0; b = x
            default: r = c; g = x; b = 0  // 处理360度的情况，返回红色
            }
            
            return Color(red: r + m, green: g + m, blue: b + m, opacity: opacity)
        }
        
        // Brand colors (dynamic, matching CSS)
        public static var brand50: Color { hsl(config.brandHue, config.brandSaturation, 98) }
        public static var brand100: Color { hsl(config.brandHue, config.brandSaturation, 96) }
        public static var brand200: Color { hsl(config.brandHue, config.brandSaturation, 91) }
        public static var brand300: Color { hsl(config.brandHue, config.brandSaturation, 84) }
        public static var brand400: Color { hsl(config.brandHue, config.brandSaturation, 65) }
        public static var brand500: Color { hsl(config.brandHue, config.brandSaturation, 50) }
        public static var brand600: Color { hsl(config.brandHue, config.brandSaturation, 40) }
        public static var brand700: Color { hsl(config.brandHue, config.brandSaturation, 30) }
        public static var brand800: Color { hsl(config.brandHue, config.brandSaturation, 20) }
        public static var brand900: Color { hsl(config.brandHue, config.brandSaturation, 10) }
        
        // Neutral colors (gray scale with brand hue tint)
        public static var gray50: Color { hsl(config.brandHue, 10, 98) }
        public static var gray100: Color { hsl(config.brandHue, 10, 96) }
        public static var gray200: Color { hsl(config.brandHue, 10, 91) }
        public static var gray300: Color { hsl(config.brandHue, 10, 84) }
        public static var gray400: Color { hsl(config.brandHue, 10, 65) }
        public static var gray500: Color { hsl(config.brandHue, 10, 50) }
        public static var gray600: Color { hsl(config.brandHue, 10, 40) }
        public static var gray700: Color { hsl(config.brandHue, 10, 30) }
        public static var gray800: Color { hsl(config.brandHue, 10, 20) }
        public static var gray900: Color { hsl(config.brandHue, 10, 10) }
        
        // Helper methods for accessing colors by shade - 直接计算以确保实时更新
        public static func brandColor(for shade: Int) -> Color {
            let lightness: Double
            switch shade {
            case 50: lightness = 98
            case 100: lightness = 96
            case 200: lightness = 91
            case 300: lightness = 84
            case 400: lightness = 65
            case 500: lightness = 50
            case 600: lightness = 40
            case 700: lightness = 30
            case 800: lightness = 20
            case 900: lightness = 10
            case 950: lightness = 5
            default: lightness = 50
            }
            return hsl(config.brandHue, config.brandSaturation, lightness)
        }
        
        public static func grayColor(for shade: Int) -> Color {
            // 在暗色模式下，调整亮度值以获得更好的对比度
            if config.isDarkMode {
                switch shade {
                case 50: return Color(white: 0.98)
                case 100: return Color(white: 0.94)
                case 200: return Color(white: 0.86)
                case 300: return Color(white: 0.74)
                case 400: return Color(white: 0.62)
                case 500: return Color(white: 0.50)
                case 600: return Color(white: 0.38)
                case 700: return Color(white: 0.26)
                case 800: return Color(white: 0.14)
                case 900: return Color(white: 0.06)
                case 950: return Color(white: 0.02)
                default: return Color(white: 0.50)
                }
            } else {
                switch shade {
                case 50: return Color(white: 0.98)
                case 100: return Color(white: 0.96)
                case 200: return Color(white: 0.91)
                case 300: return Color(white: 0.84)
                case 400: return Color(white: 0.65)
                case 500: return Color(white: 0.50)
                case 600: return Color(white: 0.40)
                case 700: return Color(white: 0.30)
                case 800: return Color(white: 0.20)
                case 900: return Color(white: 0.10)
                case 950: return Color(white: 0.05)
                default: return Color(white: 0.50)
                }
            }
        }
        
        // Semantic colors - Light Mode
        public static var primary: Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            // Handle high contrast mode
            if config.contrast == .high {
                return config.isDarkMode ? brand300 : brand700
            }
            return config.isDarkMode ? brand500 : brand600
        }
        public static var primaryForeground: Color {
            config.isDarkMode ? gray900 : Color.white
        }
        public static var secondary: Color {
            config.isDarkMode ? brand900 : brand100
        }
        public static var secondaryForeground: Color {
            config.isDarkMode ? brand200 : brand700
        }
        public static var muted: Color {
            config.isDarkMode ? gray700 : gray100
        }
        public static var mutedForeground: Color {
            config.isDarkMode ? gray400 : gray600
        }
        
        // Status colors
        public static var success: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0x6e/255.0, green: 0xe7/255.0, blue: 0xb7/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0x22/255.0, green: 0xc5/255.0, blue: 0x5e/255.0, alpha: 1.0))
            }
        }
        public static var danger: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0xfc/255.0, green: 0xa5/255.0, blue: 0xa5/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0xef/255.0, green: 0x44/255.0, blue: 0x44/255.0, alpha: 1.0))
            }
        }
        public static var error: Color { danger } // Alias for danger
        public static var warning: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0xfc/255.0, green: 0xd3/255.0, blue: 0x4d/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0xf5/255.0, green: 0x9e/255.0, blue: 0x0b/255.0, alpha: 1.0))
            }
        }
        public static var info: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0x93/255.0, green: 0xc5/255.0, blue: 0xfd/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0x3b/255.0, green: 0x82/255.0, blue: 0xf6/255.0, alpha: 1.0))
            }
        }
        
        // Additional semantic colors
        public static var positive: Color {
            config.isDarkMode ? Color(hex: "#86efac") : Color(hex: "#22c55e")
        }
        public static var negative: Color {
            config.isDarkMode ? Color(hex: "#fca5a5") : Color(hex: "#ef4444")
        }
        public static var neutral: Color {
            config.isDarkMode ? gray400 : gray600
        }
        public static var code: Color {
            config.isDarkMode ? gray200 : gray800
        }
        
        // Functional colors
        public static var background: Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.black : Color.white
            }
            return config.isDarkMode ? gray900 : Color.white
        }
        public static var foreground: Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            if config.isDarkMode {
                return Color(white: 0.95) // Text brightness control
            }
            return gray900
        }
        public static var card: Color {
            config.isDarkMode ? gray800 : Color.white
        }
        public static var cardForeground: Color {
            config.isDarkMode ? gray100 : gray900
        }
        public static var popover: Color {
            config.isDarkMode ? gray800 : Color.white
        }
        public static var popoverForeground: Color {
            config.isDarkMode ? gray100 : gray900
        }
        public static var accent: Color {
            config.isDarkMode ? brand400 : brand500
        }
        public static var accentForeground: Color {
            config.isDarkMode ? gray900 : Color.white
        }
        public static var border: Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            // Handle high contrast mode
            if config.contrast == .high {
                return config.isDarkMode ? gray600 : gray400
            }
            return config.isDarkMode ? gray700 : gray200
        }
        public static var input: Color {
            config.isDarkMode ? gray700 : gray200
        }
        public static var ring: Color {
            hsl(config.brandHue, config.brandSaturation, 50, opacity: 0.3)
        }
        public static var disabled: Color {
            config.isDarkMode ? gray800 : gray100
        }
        public static var disabledForeground: Color {
            config.isDarkMode ? gray600 : gray400
        }
        
        // Button colors
        public static var buttonPrimary: Color {
            config.isDarkMode ? brand500 : brand600
        }
        public static var buttonPrimaryForeground: Color {
            config.isDarkMode ? gray300 : Color.white
        }
        public static var buttonSecondary: Color {
            config.isDarkMode ? brand900 : brand100
        }
        public static var buttonSecondaryForeground: Color {
            config.isDarkMode ? brand800 : brand700
        }
        public static var buttonDisabled: Color {
            config.isDarkMode ? gray700 : gray100
        }
        public static var buttonDisabledForeground: Color {
            config.isDarkMode ? gray400 : gray600
        }
        
        // Panel hierarchy colors
        public static func panel(_ level: Int) -> Color {
            if config.isDarkMode {
                switch level {
                case 0: return hsl(config.brandHue, 10, 8)
                case 1: return hsl(config.brandHue, 10, 11)
                case 2: return hsl(config.brandHue, 10, 14)
                case 3: return hsl(config.brandHue, 10, 17)
                case 4: return hsl(config.brandHue, 10, 20)
                case 5: return hsl(config.brandHue, 10, 24)
                default: return background
                }
            } else {
                switch level {
                case 0: return background
                case 1: return hsl(config.brandHue, 10, 98)
                case 2: return hsl(config.brandHue, 12, 95)
                case 3: return hsl(config.brandHue, 14, 92)
                case 4: return hsl(config.brandHue, 16, 88)
                case 5: return hsl(config.brandHue, 18, 84)
                default: return background
                }
            }
        }
        
        // Special panels
        public static var panelElevated: Color {
            config.isDarkMode ? hsl(config.brandHue, 10, 15) : Color.white
        }
        public static var panelSunken: Color {
            config.isDarkMode ? hsl(config.brandHue, 10, 10) : gray50
        }
        public static var panelAccent: Color {
            config.isDarkMode ? hsl(config.brandHue, 30, 15) : brand50
        }
        public static var panelMuted: Color {
            config.isDarkMode ? hsl(config.brandHue, 5, 13) : hsl(config.brandHue, 5, 97)
        }
        
        // Panel borders
        public static func panelBorder(_ level: Int) -> Color {
            if config.isDarkMode {
                switch level {
                case 1: return hsl(config.brandHue, 10, 20)
                case 2: return hsl(config.brandHue, 10, 25)
                case 3: return hsl(config.brandHue, 10, 30)
                case 4: return hsl(config.brandHue, 10, 35)
                case 5: return hsl(config.brandHue, 10, 40)
                default: return border
                }
            } else {
                switch level {
                case 1: return gray100
                case 2: return gray200
                case 3: return gray300
                case 4: return gray400
                case 5: return gray500
                default: return border
                }
            }
        }
        
        // Heading hierarchy colors
        public static func heading(_ level: Int) -> Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            
            if config.isDarkMode {
                switch level {
                case 1: return grayColor(for: 100)
                case 2: return grayColor(for: 200)
                case 3: return grayColor(for: 300)
                case 4: return grayColor(for: 400)
                case 5: return grayColor(for: 500)
                case 6: return grayColor(for: 600)
                default: return grayColor(for: 100)
                }
            } else {
                switch level {
                case 1: return grayColor(for: 900)
                case 2: return grayColor(for: 800)
                case 3: return grayColor(for: 700)
                case 4: return grayColor(for: 600)
                case 5: return grayColor(for: 500)
                case 6: return grayColor(for: 400)
                default: return grayColor(for: 900)
                }
            }
        }
        
        // Semantic heading colors
        public static var headingPrimary: Color {
            config.isDarkMode ? brandColor(for: 400) : brandColor(for: 600)
        }
        public static var headingMuted: Color {
            config.isDarkMode ? grayColor(for: 500) : grayColor(for: 400)
        }
        public static var headingSuccess: Color { success }
        public static var headingDanger: Color { danger }
        
        // Description hierarchy colors
        public static func description(_ level: Int) -> Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            
            if config.isDarkMode {
                switch level {
                case 1: return grayColor(for: 300)
                case 2: return grayColor(for: 400)
                case 3: return grayColor(for: 500)
                case 4: return grayColor(for: 600)
                default: return grayColor(for: 400)
                }
            } else {
                switch level {
                case 1: return grayColor(for: 700)
                case 2: return grayColor(for: 600)
                case 3: return grayColor(for: 500)
                case 4: return grayColor(for: 400)
                default: return grayColor(for: 600)
                }
            }
        }
        
        // Semantic description colors
        public static var descriptionPrimary: Color {
            config.isDarkMode ? brandColor(for: 400) : brandColor(for: 500)
        }
        public static var descriptionMuted: Color {
            config.isDarkMode ? grayColor(for: 600) : grayColor(for: 400)
        }
        public static var descriptionSuccess: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0x6e/255.0, green: 0xe7/255.0, blue: 0xb7/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0x22/255.0, green: 0xc5/255.0, blue: 0x5e/255.0, alpha: 1.0))
            }
        }
        public static var descriptionWarning: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0xfc/255.0, green: 0xd3/255.0, blue: 0x4d/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0xf5/255.0, green: 0x9e/255.0, blue: 0x0b/255.0, alpha: 1.0))
            }
        }
        public static var descriptionDanger: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0xfc/255.0, green: 0xa5/255.0, blue: 0xa5/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0xef/255.0, green: 0x44/255.0, blue: 0x44/255.0, alpha: 1.0))
            }
        }
        
        // Value hierarchy colors
        public static func value(_ level: Int) -> Color {
            // Handle ultra contrast mode
            if config.contrast == .ultra {
                return config.isDarkMode ? Color.white : Color.black
            }
            
            if config.isDarkMode {
                switch level {
                case 1: return grayColor(for: 100)
                case 2: return grayColor(for: 200)
                case 3: return grayColor(for: 300)
                case 4: return grayColor(for: 400)
                case 5: return grayColor(for: 500)
                case 6: return grayColor(for: 600)
                default: return grayColor(for: 100)
                }
            } else {
                switch level {
                case 1: return grayColor(for: 900)
                case 2: return grayColor(for: 800)
                case 3: return grayColor(for: 700)
                case 4: return grayColor(for: 600)
                case 5: return grayColor(for: 500)
                case 6: return grayColor(for: 400)
                default: return grayColor(for: 900)
                }
            }
        }
        
        // Semantic value colors
        public static var valuePrimary: Color {
            config.isDarkMode ? brandColor(for: 400) : brandColor(for: 600)
        }
        public static var valuePositive: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0x86/255.0, green: 0xef/255.0, blue: 0xac/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0x22/255.0, green: 0xc5/255.0, blue: 0x5e/255.0, alpha: 1.0))
            }
        }
        public static var valueNegative: Color {
            if config.isDarkMode {
                return Color(NSColor(red: 0xfc/255.0, green: 0xa5/255.0, blue: 0xa5/255.0, alpha: 1.0))
            } else {
                return Color(NSColor(red: 0xef/255.0, green: 0x44/255.0, blue: 0x44/255.0, alpha: 1.0))
            }
        }
        public static var valueNeutral: Color {
            config.isDarkMode ? grayColor(for: 400) : grayColor(for: 600)
        }
        public static var valueCode: Color {
            config.isDarkMode ? grayColor(for: 200) : grayColor(for: 800)
        }
    }
    
    // MARK: - Typography System (100% matching CSS)
    
    public struct Typography {
        private static var config: DesignTokensConfig { DesignTokensConfig.shared }
        
        /// Base font size in points (1rem = 16px)
        private static let baseFontSize: CGFloat = 16
        
        /// Combined font scale (fontScale * fontSizePreset)
        private static var combinedScale: CGFloat {
            CGFloat(config.fontScale * config.fontSizePreset.scale)
        }
        
        // Font sizes (exact rem to points conversion)
        public static var textXS: CGFloat { 0.75 * baseFontSize * combinedScale }    // 12pt
        public static var textSM: CGFloat { 0.875 * baseFontSize * combinedScale }   // 14pt
        public static var textBase: CGFloat { 1.0 * baseFontSize * combinedScale }   // 16pt
        public static var textLG: CGFloat { 1.125 * baseFontSize * combinedScale }   // 18pt
        public static var textXL: CGFloat { 1.25 * baseFontSize * combinedScale }    // 20pt
        public static var text2XL: CGFloat { 1.5 * baseFontSize * combinedScale }    // 24pt
        public static var text3XL: CGFloat { 1.875 * baseFontSize * combinedScale }  // 30pt
        public static var text4XL: CGFloat { 2.25 * baseFontSize * combinedScale }   // 36pt
        public static var text5XL: CGFloat { 3.0 * baseFontSize * combinedScale }    // 48pt
        public static var text6XL: CGFloat { 3.75 * baseFontSize * combinedScale }   // 60pt
        
        // Font weights (matching CSS)
        public static let thin: Font.Weight = .thin           // 100
        public static let light: Font.Weight = .light         // 300
        public static let normal: Font.Weight = .regular      // 400
        public static let medium: Font.Weight = .medium       // 500
        public static let semibold: Font.Weight = .semibold   // 600
        public static let bold: Font.Weight = .bold           // 700
        public static let extrabold: Font.Weight = .heavy     // 800
        public static let black: Font.Weight = .black         // 900
        
        // Letter spacing (tracking) - exact CSS em to points
        public static func letterSpacing(for fontSize: CGFloat) -> CGFloat {
            fontSize * config.letterSpacing.emValue
        }
        
        // Line spacing - exact CSS line-height calculation
        public static func lineSpacing(for fontSize: CGFloat) -> CGFloat {
            let lineHeight = config.lineHeight.value
            return (lineHeight - 1.0) * fontSize
        }
        
        // Font families
        public static let fontFamilySans = Font.system(.body).weight(.regular)
        public static let fontFamilyMono = Font.system(.body, design: .monospaced)
    }
    
    // MARK: - Spacing System (100% matching CSS)
    
    public struct Spacing {
        private static var config: DesignTokensConfig { DesignTokensConfig.shared }
        private static let baseUnit: CGFloat = 4 // 0.25rem = 4px
        
        public static var space0: CGFloat { 0 }
        public static var space0_5: CGFloat { baseUnit * 0.5 * CGFloat(config.spacingScale) }   // 2pt
        public static var space1: CGFloat { baseUnit * 1 * CGFloat(config.spacingScale) }       // 4pt
        public static var space1_5: CGFloat { baseUnit * 1.5 * CGFloat(config.spacingScale) }   // 6pt
        public static var space2: CGFloat { baseUnit * 2 * CGFloat(config.spacingScale) }       // 8pt
        public static var space2_5: CGFloat { baseUnit * 2.5 * CGFloat(config.spacingScale) }   // 10pt
        public static var space3: CGFloat { baseUnit * 3 * CGFloat(config.spacingScale) }       // 12pt
        public static var space3_5: CGFloat { baseUnit * 3.5 * CGFloat(config.spacingScale) }   // 14pt
        public static var space4: CGFloat { baseUnit * 4 * CGFloat(config.spacingScale) }       // 16pt
        public static var space5: CGFloat { baseUnit * 5 * CGFloat(config.spacingScale) }       // 20pt
        public static var space6: CGFloat { baseUnit * 6 * CGFloat(config.spacingScale) }       // 24pt
        public static var space7: CGFloat { baseUnit * 7 * CGFloat(config.spacingScale) }       // 28pt
        public static var space8: CGFloat { baseUnit * 8 * CGFloat(config.spacingScale) }       // 32pt
        public static var space9: CGFloat { baseUnit * 9 * CGFloat(config.spacingScale) }       // 36pt
        public static var space10: CGFloat { baseUnit * 10 * CGFloat(config.spacingScale) }     // 40pt
        public static var space12: CGFloat { baseUnit * 12 * CGFloat(config.spacingScale) }     // 48pt
        public static var space14: CGFloat { baseUnit * 14 * CGFloat(config.spacingScale) }     // 56pt
        public static var space16: CGFloat { baseUnit * 16 * CGFloat(config.spacingScale) }     // 64pt
        public static var space20: CGFloat { baseUnit * 20 * CGFloat(config.spacingScale) }     // 80pt
        public static var space24: CGFloat { baseUnit * 24 * CGFloat(config.spacingScale) }     // 96pt
    }
    
    // MARK: - Radius System (100% matching CSS)
    
    public struct Radius {
        private static var config: DesignTokensConfig { DesignTokensConfig.shared }
        private static let baseRadius: CGFloat = 6 // 0.375rem = 6px
        
        public static var none: CGFloat { 0 }
        public static var sm: CGFloat { baseRadius * 0.66 * CGFloat(config.radiusScale) }   // ~4pt
        public static var base: CGFloat { baseRadius * CGFloat(config.radiusScale) }        // ~6pt
        public static var md: CGFloat { baseRadius * 1.33 * CGFloat(config.radiusScale) }   // ~8pt
        public static var lg: CGFloat { baseRadius * 2 * CGFloat(config.radiusScale) }      // ~12pt
        public static var xl: CGFloat { baseRadius * 3 * CGFloat(config.radiusScale) }      // ~18pt
        public static var xl2: CGFloat { baseRadius * 4 * CGFloat(config.radiusScale) }     // ~24pt
        public static var xl3: CGFloat { baseRadius * 5 * CGFloat(config.radiusScale) }     // ~30pt
        public static var full: CGFloat { 9999 }
    }
    
    // MARK: - Shadow System (100% matching CSS)
    
    public struct Shadows {
        public static let xs = ShadowStyle(
            color: Color.black.opacity(0.05),
            radius: 1,
            x: 0,
            y: 1
        )
        
        public static let sm = ShadowStyle(
            color: Color.black.opacity(0.1),
            radius: 2,
            x: 0,
            y: 1
        )
        
        public static let base = ShadowStyle(
            color: Color.black.opacity(0.1),
            radius: 3,
            x: 0,
            y: 2
        )
        
        public static let md = ShadowStyle(
            color: Color.black.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
        
        public static let lg = ShadowStyle(
            color: Color.black.opacity(0.1),
            radius: 10,
            x: 0,
            y: 10
        )
        
        public static let xl = ShadowStyle(
            color: Color.black.opacity(0.25),
            radius: 25,
            x: 0,
            y: 25
        )
        
        public static let xl2 = ShadowStyle(
            color: Color.black.opacity(0.35),
            radius: 25,
            x: 0,
            y: 25
        )
        
        public static let inner = ShadowStyle(
            color: Color.black.opacity(0.06),
            radius: 2,
            x: 0,
            y: 2
        )
        
        public static let none = ShadowStyle(
            color: Color.clear,
            radius: 0,
            x: 0,
            y: 0
        )
    }
}

// MARK: - Helper Structures

public struct ShadowStyle {
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

// MARK: - View Modifiers for Easy Usage

extension View {
    /// Apply design token text style
    @available(macOS 13.0, iOS 16.0, *)
    public func textStyle(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self
            .font(.system(size: size, weight: weight))
            .tracking(DesignTokens.Typography.letterSpacing(for: size))
            .lineSpacing(DesignTokens.Typography.lineSpacing(for: size))
    }
    
    /// Apply design token shadow
    public func tokenShadow(_ shadow: ShadowStyle) -> some View {
        self.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
    }
    
    /// Apply design token corner radius
    public func tokenRadius(_ radius: CGFloat) -> some View {
        self.cornerRadius(radius)
    }
    
    /// Apply design token padding
    public func tokenPadding(_ spacing: CGFloat) -> some View {
        self.padding(spacing)
    }
}