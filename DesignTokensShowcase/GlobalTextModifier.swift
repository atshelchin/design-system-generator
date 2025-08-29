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
            .font(customFont(size: baseSize * config.fontScale))
            .tracking(letterSpacingValue)
            .lineSpacing(lineHeightValue)
            .foregroundColor(textColorWithContrast)
    }
    
    // 自定义字体
    private func customFont(size: CGFloat) -> Font {
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
    
    // 计算字间距
    private var letterSpacingValue: CGFloat {
        let base = baseSize * 0.01 // 基础间距为字体大小的1%
        switch config.letterSpacing {
        case .wide:
            return base * 2.5  // 0.025em
        case .wider:
            return base * 5    // 0.05em
        case .widest:
            return base * 10   // 0.1em
        default:
            return 0
        }
    }
    
    // 计算行高
    private var lineHeightValue: CGFloat {
        switch config.lineHeight {
        case .relaxed:
            return baseSize * 0.25  // 增加25%行高
        case .loose:
            return baseSize * 0.5   // 增加50%行高
        default:
            return 0
        }
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
            .font(customFont(size: baseSize * config.fontScale))
            .tracking(letterSpacingValue)
            .lineSpacing(lineHeightValue)
            // 不设置foregroundColor，让元素保持自己的颜色
    }
    
    // 自定义字体
    private func customFont(size: CGFloat) -> Font {
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
    
    // 计算字间距
    private var letterSpacingValue: CGFloat {
        let base = baseSize * 0.01 // 基础间距为字体大小的1%
        switch config.letterSpacing {
        case .wide:
            return base * 2.5  // 0.025em
        case .wider:
            return base * 5    // 0.05em
        case .widest:
            return base * 10   // 0.1em
        default:
            return 0
        }
    }
    
    // 计算行高
    private var lineHeightValue: CGFloat {
        switch config.lineHeight {
        case .relaxed:
            return baseSize * 0.25  // 增加25%行高
        case .loose:
            return baseSize * 0.5   // 增加50%行高
        default:
            return 0
        }
    }
}

// 扩展View以便使用
extension View {
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