//
//  GlobalTextModifier.swift
//  全局文本样式修饰器
//

import SwiftUI

// 全局文本样式修饰器
struct GlobalTextStyle: ViewModifier {
    @ObservedObject var config: DesignTokensConfig
    let baseSize: CGFloat
    let weight: Font.Weight
    
    init(config: DesignTokensConfig, size: CGFloat = 14, weight: Font.Weight = .regular) {
        self.config = config
        self.baseSize = size
        self.weight = weight
    }
    
    func body(content: Content) -> some View {
        content
            .font(customFont(size: baseSize * config.fontScale, weight: contrastAdjustedWeight))
            .tracking(letterSpacingValue)
            .lineSpacing(lineHeightValue)
            .foregroundColor(textColorWithContrast)
    }
    
    // 自定义字体
    private func customFont(size: CGFloat, weight: Font.Weight) -> Font {
        switch config.selectedFont {
        case "serif":
            return .custom("Georgia", size: size).weight(weight)
        case "sans-serif":
            return .custom("Helvetica Neue", size: size).weight(weight)
        case "monospace":
            return .custom("Menlo", size: size).weight(weight)
        default:
            return .system(size: size, weight: weight)
        }
    }
    
    // 根据对比度模式调整字重 - 匹配CSS font-weight
    private var contrastAdjustedWeight: Font.Weight {
        switch config.contrast {
        case .high:
            return .medium // CSS: font-weight: 500
        case .ultra:
            return .semibold // CSS: font-weight: 600
        default:
            return weight // 使用原始字重
        }
    }
    
    // 计算字间距 - 匹配CSS letter-spacing值
    private var letterSpacingValue: CGFloat {
        switch config.letterSpacing {
        case .wide:
            return baseSize * 0.025  // CSS: letter-spacing: 0.025em
        case .wider:
            return baseSize * 0.05   // CSS: letter-spacing: 0.05em
        case .widest:
            return baseSize * 0.1    // CSS: letter-spacing: 0.1em
        default:
            return 0  // CSS: normal (no extra spacing)
        }
    }
    
    // 计算行高 - 匹配CSS line-height值
    private var lineHeightValue: CGFloat {
        // CSS line-height计算：
        // 实际行高 = fontSize * lineHeight倍数
        // SwiftUI lineSpacing = 实际行高 - fontSize
        let actualFontSize = baseSize * config.fontScale
        let lineHeightMultiplier: CGFloat
        
        switch config.lineHeight {
        case .relaxed:
            lineHeightMultiplier = 1.8  // CSS: line-height: 1.8
        case .loose:
            lineHeightMultiplier = 2.2  // CSS: line-height: 2.2
        default:
            lineHeightMultiplier = 1.6  // CSS: line-height: 1.6 (normal)
        }
        
        let totalLineHeight = actualFontSize * lineHeightMultiplier
        return max(0, totalLineHeight - actualFontSize)  // 返回额外间距
    }
    
    // 应用对比度
    private var textColorWithContrast: Color {
        let baseOpacity: Double
        switch config.contrast {
        case .high:
            baseOpacity = 1.0
        case .ultra:
            baseOpacity = 1.0
        default:
            baseOpacity = 0.87
        }
        return Color(NSColor.labelColor).opacity(baseOpacity)
    }
}

// 次要文本样式
struct SecondaryTextStyle: ViewModifier {
    @ObservedObject var config: DesignTokensConfig
    let baseSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .modifier(GlobalTextStyle(config: config, size: baseSize))
            .foregroundColor(secondaryColorWithContrast)
    }
    
    private var secondaryColorWithContrast: Color {
        let baseOpacity: Double
        switch config.contrast {
        case .high:
            baseOpacity = 0.8
        case .ultra:
            baseOpacity = 0.9
        default:
            baseOpacity = 0.6
        }
        return Color(NSColor.labelColor).opacity(baseOpacity)
    }
}

// 全局文本样式但不设置颜色（用于层级系统等需要自定义颜色的地方）
struct GlobalTextStyleNoColor: ViewModifier {
    @ObservedObject var config: DesignTokensConfig
    let baseSize: CGFloat
    let weight: Font.Weight
    
    init(config: DesignTokensConfig, size: CGFloat = 14, weight: Font.Weight = .regular) {
        self.config = config
        self.baseSize = size
        self.weight = weight
    }
    
    func body(content: Content) -> some View {
        content
            .font(customFont(size: baseSize * config.fontScale, weight: contrastAdjustedWeight))
            .tracking(letterSpacingValue)
            .lineSpacing(lineHeightValue)
            // 不设置foregroundColor，让元素保持自己的颜色
    }
    
    // 自定义字体
    private func customFont(size: CGFloat, weight: Font.Weight) -> Font {
        switch config.selectedFont {
        case "serif":
            return .custom("Georgia", size: size).weight(weight)
        case "sans-serif":
            return .custom("Helvetica Neue", size: size).weight(weight)
        case "monospace":
            return .custom("Menlo", size: size).weight(weight)
        default:
            return .system(size: size, weight: weight)
        }
    }
    
    // 根据对比度模式调整字重 - 匹配CSS font-weight
    private var contrastAdjustedWeight: Font.Weight {
        switch config.contrast {
        case .high:
            return .medium // CSS: font-weight: 500
        case .ultra:
            return .semibold // CSS: font-weight: 600
        default:
            return weight // 使用原始字重
        }
    }
    
    // 计算字间距 - 匹配CSS letter-spacing值
    private var letterSpacingValue: CGFloat {
        switch config.letterSpacing {
        case .wide:
            return baseSize * 0.025  // CSS: letter-spacing: 0.025em
        case .wider:
            return baseSize * 0.05   // CSS: letter-spacing: 0.05em
        case .widest:
            return baseSize * 0.1    // CSS: letter-spacing: 0.1em
        default:
            return 0  // CSS: normal (no extra spacing)
        }
    }
    
    // 计算行高 - 匹配CSS line-height值
    private var lineHeightValue: CGFloat {
        // CSS line-height计算：
        // 实际行高 = fontSize * lineHeight倍数
        // SwiftUI lineSpacing = 实际行高 - fontSize
        let actualFontSize = baseSize * config.fontScale
        let lineHeightMultiplier: CGFloat
        
        switch config.lineHeight {
        case .relaxed:
            lineHeightMultiplier = 1.8  // CSS: line-height: 1.8
        case .loose:
            lineHeightMultiplier = 2.2  // CSS: line-height: 2.2
        default:
            lineHeightMultiplier = 1.6  // CSS: line-height: 1.6 (normal)
        }
        
        let totalLineHeight = actualFontSize * lineHeightMultiplier
        return max(0, totalLineHeight - actualFontSize)  // 返回额外间距
    }
}

// 扩展View以便使用
public extension View {
    func globalTextStyle(_ config: DesignTokensConfig, size: CGFloat = 14, weight: Font.Weight = .regular) -> some View {
        self.modifier(GlobalTextStyle(config: config, size: size, weight: weight))
    }
    
    func globalTextStyleNoColor(_ config: DesignTokensConfig, size: CGFloat = 14, weight: Font.Weight = .regular) -> some View {
        self.modifier(GlobalTextStyleNoColor(config: config, size: size, weight: weight))
    }
    
    func secondaryTextStyle(_ config: DesignTokensConfig, size: CGFloat = 14) -> some View {
        self.modifier(SecondaryTextStyle(config: config, baseSize: size))
    }
}