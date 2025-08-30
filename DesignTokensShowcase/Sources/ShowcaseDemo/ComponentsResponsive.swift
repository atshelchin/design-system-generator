//
//  ComponentsResponsive.swift
//  完全响应式的组件示例
//  演示如何正确响应控制面板的所有设置
//

import SwiftUI
import DesignTokensKit

struct ComponentsResponsiveView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32 * config.spacingScale) {
                // 标题部分 - 响应所有设置
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    Text("响应式组件测试")
                        .globalTextStyle(config, size: 24, weight: contrastWeight(.bold))
                    
                    Text("所有组件都会响应控制面板的实时调整")
                        .secondaryTextStyle(config, size: 14)
                }
                
                // 测试卡片
                VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                    Text("实时响应测试")
                        .globalTextStyle(config, size: 16, weight: contrastWeight(.semibold))
                    
                    // 显示当前设置
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        ResponsiveInfoRow(label: "字体缩放", value: String(format: "%.2fx", config.fontScale), config: config)
                        ResponsiveInfoRow(label: "间距缩放", value: String(format: "%.2fx", config.spacingScale), config: config)
                        ResponsiveInfoRow(label: "圆角缩放", value: String(format: "%.2fx", config.radiusScale), config: config)
                        ResponsiveInfoRow(label: "色调", value: "\(Int(config.brandHue))°", config: config)
                        ResponsiveInfoRow(label: "饱和度", value: "\(Int(config.brandSaturation))%", config: config)
                        ResponsiveInfoRow(label: "对比度", value: contrastName, config: config)
                        ResponsiveInfoRow(label: "字间距", value: letterSpacingName, config: config)
                        ResponsiveInfoRow(label: "行高", value: lineHeightName, config: config)
                        ResponsiveInfoRow(label: "主题", value: config.isDarkMode ? "暗色" : "亮色", config: config)
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(12 * config.radiusScale)
                .overlay(
                    RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
                
                // 按钮测试组
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    Text("按钮响应测试")
                        .globalTextStyle(config, size: 14, weight: contrastWeight(.medium))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    HStack(spacing: 12 * config.spacingScale) {
                        ResponsiveButton(title: "Primary", style: .primary, config: config)
                        ResponsiveButton(title: "Secondary", style: .secondary, config: config)
                        ResponsiveButton(title: "Outline", style: .outline, config: config)
                    }
                }
                
                // 输入框测试
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    Text("输入框响应测试")
                        .globalTextStyle(config, size: 14, weight: contrastWeight(.medium))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    ResponsiveTextField(placeholder: "输入文本查看响应效果...", config: config)
                }
                
                // 颜色测试
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    Text("颜色响应测试")
                        .globalTextStyle(config, size: 14, weight: contrastWeight(.medium))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    HStack(spacing: 8 * config.spacingScale) {
                        ColorBox(color: DesignTokens.Colors.primary, label: "Primary", config: config)
                        ColorBox(color: DesignTokens.Colors.secondary, label: "Secondary", config: config)
                        ColorBox(color: DesignTokens.Colors.success, label: "Success", config: config)
                        ColorBox(color: DesignTokens.Colors.warning, label: "Warning", config: config)
                        ColorBox(color: DesignTokens.Colors.danger, label: "Danger", config: config)
                    }
                }
            }
            .padding(32 * config.spacingScale)
        }
    }
    
    // MARK: - 辅助计算属性
    
    private var contrastName: String {
        switch config.contrast {
        case .high: return language == "zh" ? "高" : "High"
        case .ultra: return language == "zh" ? "超高" : "Ultra"
        default: return language == "zh" ? "标准" : "Normal"
        }
    }
    
    private var letterSpacingName: String {
        switch config.letterSpacing {
        case .wide: return language == "zh" ? "宽松" : "Wide"
        case .wider: return language == "zh" ? "更宽" : "Wider"
        case .widest: return language == "zh" ? "最宽" : "Widest"
        default: return language == "zh" ? "标准" : "Normal"
        }
    }
    
    private var lineHeightName: String {
        switch config.lineHeight {
        case .relaxed: return language == "zh" ? "舒适" : "Relaxed"
        case .loose: return language == "zh" ? "宽松" : "Loose"
        default: return language == "zh" ? "标准" : "Normal"
        }
    }
    
    private var borderColor: Color {
        config.contrast == .ultra ? DesignTokens.Colors.foreground : DesignTokens.Colors.border
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 1
    }
    
    // MARK: - 辅助函数
    
    private func contrastWeight(_ base: Font.Weight) -> Font.Weight {
        switch config.contrast {
        case .high:
            switch base {
            case .regular: return .medium
            case .medium: return .semibold
            case .semibold: return .bold
            case .bold: return .heavy
            default: return base
            }
        case .ultra:
            switch base {
            case .regular: return .semibold
            case .medium: return .bold
            case .semibold: return .heavy
            case .bold: return .black
            default: return base
            }
        default:
            return base
        }
    }
    
    private func letterSpacing(_ fontSize: CGFloat) -> CGFloat {
        return config.letterSpacing.emValue * fontSize * config.fontScale
    }
    
    private func lineHeight(_ fontSize: CGFloat) -> CGFloat {
        let actualSize = fontSize * config.fontScale
        let multiplier = config.lineHeight.value
        return actualSize * (multiplier - 1)
    }
}

// MARK: - 响应式组件

struct ResponsiveInfoRow: View {
    let label: String
    let value: String
    let config: DesignTokensConfig
    
    var body: some View {
        HStack {
            Text(label)
                .globalTextStyle(config, size: 12, weight: fontWeight)
                .tracking(letterSpacing)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Spacer()
            
            Text(value)
                .globalTextStyle(config, size: 12, weight: .medium)
                .tracking(letterSpacing)
                .foregroundColor(DesignTokens.Colors.foreground)
        }
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
    
    private var letterSpacing: CGFloat {
        let fontSize = 12 * config.fontScale
        switch config.letterSpacing {
        case .wide: return fontSize * 0.025
        case .wider: return fontSize * 0.05
        case .widest: return fontSize * 0.1
        default: return 0
        }
    }
}

enum ButtonVariant {
    case primary, secondary, outline
}

struct ResponsiveButton: View {
    let title: String
    let style: ButtonVariant
    let config: DesignTokensConfig
    
    var body: some View {
        Button(title) {}
            .globalTextStyle(config, size: 14, weight: fontWeight)
            .tracking(letterSpacing)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(backgroundColor)
            .overlay(overlayBorder)
            .cornerRadius(8 * config.radiusScale)
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
    
    private var letterSpacing: CGFloat {
        let fontSize = 14 * config.fontScale
        switch config.letterSpacing {
        case .wide: return fontSize * 0.025
        case .wider: return fontSize * 0.05
        case .widest: return fontSize * 0.1
        default: return 0
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary: return .white
        case .secondary: return DesignTokens.Colors.secondaryForeground
        case .outline: return DesignTokens.Colors.primary
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .primary: return DesignTokens.Colors.primary
        case .secondary: return DesignTokens.Colors.secondary
        case .outline: return Color.clear
        }
    }
    
    @ViewBuilder
    private var overlayBorder: some View {
        if style == .outline || config.contrast == .ultra {
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(borderColor, lineWidth: borderWidth)
        }
    }
    
    private var borderColor: Color {
        if config.contrast == .ultra {
            return style == .primary ? Color.black : DesignTokens.Colors.foreground
        }
        return style == .outline ? DesignTokens.Colors.border : Color.clear
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 1
    }
}

struct ResponsiveTextField: View {
    let placeholder: String
    let config: DesignTokensConfig
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .globalTextStyle(config, size: 14, weight: fontWeight)
            .tracking(letterSpacing)
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 10 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                    .stroke(isFocused ? DesignTokens.Colors.ring : borderColor, 
                           lineWidth: isFocused ? 2 : borderWidth)
            )
            .focused($isFocused)
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
    
    private var letterSpacing: CGFloat {
        let fontSize = 14 * config.fontScale
        switch config.letterSpacing {
        case .wide: return fontSize * 0.025
        case .wider: return fontSize * 0.05
        case .widest: return fontSize * 0.1
        default: return 0
        }
    }
    
    private var borderColor: Color {
        config.contrast == .ultra ? DesignTokens.Colors.foreground : DesignTokens.Colors.input
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 1
    }
}

struct ColorBox: View {
    let color: Color
    let label: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 4 * config.spacingScale) {
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .fill(color)
                .frame(width: 60 * config.spacingScale, height: 60 * config.spacingScale)
                .overlay(
                    RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
            
            Text(label)
                .globalTextStyle(config, size: 10, weight: fontWeight)
                .tracking(letterSpacing)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
    
    private var letterSpacing: CGFloat {
        let fontSize = 10 * config.fontScale
        switch config.letterSpacing {
        case .wide: return fontSize * 0.025
        case .wider: return fontSize * 0.05
        case .widest: return fontSize * 0.1
        default: return 0
        }
    }
    
    private var borderColor: Color {
        config.contrast == .ultra ? DesignTokens.Colors.foreground : Color.clear
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 0
    }
}