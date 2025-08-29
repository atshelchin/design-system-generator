//
//  AccessibilitySystem.swift
//  100% 还原showcase.html的无障碍系统
//

import SwiftUI

struct AccessibilitySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "7. 无障碍" : "7. Accessibility")
                    .globalTextStyle(config, size: 24, weight: .bold)
                
                Text(language == "zh" ? "提升可访问性的设计考虑" : "Design considerations for improved accessibility")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 控制说明
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(DesignTokens.Colors.info)
                        .font(.system(size: 16))
                    
                    Text(language == "zh" ? 
                         "所有无障碍控制现在都在右下角的悬浮面板中。您可以调整：" :
                         "All accessibility controls are now in the floating panel on the bottom right. You can adjust:")
                        .globalTextStyle(config, size: 13)
                }
                
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    ForEach(accessibilityFeatures, id: \.0) { feature in
                        HStack(spacing: 8 * config.spacingScale) {
                            Circle()
                                .fill(DesignTokens.Colors.primary)
                                .frame(width: 4, height: 4)
                            Text(language == "zh" ? feature.0 : feature.1)
                                .globalTextStyle(config, size: 12)
                        }
                    }
                }
                .padding(.leading, 24 * config.spacingScale)
                
                // 示例文本框
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    Text(language == "zh" ? 
                         "此文本将响应所有无障碍设置。尝试调整悬浮面板中的控件以查看更改。" :
                         "This text will respond to all accessibility settings. Try adjusting the controls in the floating panel to see the changes.")
                        .globalTextStyle(config, size: 14)
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.panel(1))
                        .cornerRadius(8 * config.radiusScale)
                }
            }
            .padding(20 * config.spacingScale)
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
            
            // 对比度演示
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "对比度模式" : "Contrast Modes")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                HStack(spacing: 24 * config.spacingScale) {
                    ForEach(contrastModes, id: \.mode) { contrast in
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? contrast.nameZh : contrast.nameEn)
                                .globalTextStyle(config, size: 14, weight: .medium)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                // 标题示例
                                Text(language == "zh" ? "标题文字" : "Heading Text")
                                    .font(.system(size: 16 * config.fontScale, weight: contrast.weight))
                                    .foregroundColor(contrast.foreground)
                                
                                // 正文示例
                                Text(language == "zh" ? "正文内容示例" : "Body text example")
                                    .font(.system(size: 14 * config.fontScale, weight: contrast.bodyWeight))
                                    .foregroundColor(contrast.bodyColor)
                                
                                // 按钮示例
                                Button(language == "zh" ? "按钮" : "Button") {}
                                    .font(.system(size: 13 * config.fontScale, weight: contrast.weight))
                                    .foregroundColor(contrast.buttonForeground)
                                    .padding(.horizontal, 12 * config.spacingScale)
                                    .padding(.vertical, 6 * config.spacingScale)
                                    .background(contrast.buttonBackground)
                                    .cornerRadius(4 * config.radiusScale)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                            .stroke(contrast.border, lineWidth: contrast.borderWidth)
                                    )
                                    .buttonStyle(PlainButtonStyle())
                            }
                            .padding(12 * config.spacingScale)
                            .background(contrast.background)
                            .cornerRadius(6 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                                    .stroke(contrast.border, lineWidth: 1)
                            )
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.background)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 文字调整演示
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "文字调整" : "Text Adjustments")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                VStack(spacing: 20 * config.spacingScale) {
                    // 字体大小
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        Text(language == "zh" ? "字体大小缩放" : "Font Size Scaling")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        HStack(spacing: 16 * config.spacingScale) {
                            ForEach(["A-", "A", "A+", "A++"], id: \.self) { size in
                                let scale = scaleForSize(size)
                                VStack(spacing: 4 * config.spacingScale) {
                                    Text(size)
                                        .font(.system(size: 16 * scale, weight: .medium))
                                    Text("\(Int(scale * 100))%")
                                        .globalTextStyle(config, size: 10)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                                .padding(8 * config.spacingScale)
                                .background(config.fontScale == scale ? DesignTokens.Colors.primary.opacity(0.1) : Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                        .stroke(config.fontScale == scale ? DesignTokens.Colors.primary : DesignTokens.Colors.border, lineWidth: 1)
                                )
                                .cornerRadius(4 * config.radiusScale)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // 字间距
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        Text(language == "zh" ? "字间距" : "Letter Spacing")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            ForEach(letterSpacingExamples, id: \.mode) { spacing in
                                HStack {
                                    Text(language == "zh" ? spacing.nameZh : spacing.nameEn)
                                        .globalTextStyle(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        .frame(width: 60, alignment: .leading)
                                    
                                    Text("The quick brown fox jumps over the lazy dog")
                                        .font(.system(size: 13 * config.fontScale))
                                        .tracking(spacing.value * 13 * config.fontScale)
                                }
                                .padding(8 * config.spacingScale)
                                .background(config.letterSpacing == spacing.mode ? DesignTokens.Colors.primary.opacity(0.05) : Color.clear)
                                .cornerRadius(4 * config.radiusScale)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // 行高
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        Text(language == "zh" ? "行高" : "Line Height")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        HStack(alignment: .top, spacing: 20 * config.spacingScale) {
                            ForEach(lineHeightExamples, id: \.mode) { height in
                                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                    Text(language == "zh" ? height.nameZh : height.nameEn)
                                        .globalTextStyle(config, size: 11, weight: .medium)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    
                                    Text(language == "zh" ? 
                                         "这是一段测试文本。\n用于展示不同的行高设置。\n行高会影响阅读体验。" :
                                         "This is test text.\nTo demonstrate different line heights.\nLine height affects reading experience.")
                                        .font(.system(size: 12 * config.fontScale))
                                        .lineSpacing((height.value - 1.0) * 12 * config.fontScale)
                                        .padding(8 * config.spacingScale)
                                        .background(config.lineHeight == height.mode ? DesignTokens.Colors.primary.opacity(0.05) : Color.clear)
                                        .cornerRadius(4 * config.radiusScale)
                                }
                            }
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 焦点指示器
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "焦点指示器" : "Focus Indicators")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                HStack(spacing: 20 * config.spacingScale) {
                    // 默认焦点环
                    VStack(spacing: 8 * config.spacingScale) {
                        Button(language == "zh" ? "默认焦点环" : "Default Focus Ring") {}
                            .buttonStyle(PlainButtonStyle())
                            .globalTextStyle(config, size: 12)
                            .padding(12 * config.spacingScale)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(4 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.ring, lineWidth: 2)
                            )
                        
                        Text("2px ring")
                            .globalTextStyle(config, size: 10)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    
                    // 高对比焦点环
                    VStack(spacing: 8 * config.spacingScale) {
                        Button(language == "zh" ? "高对比焦点环" : "High Contrast Focus") {}
                            .buttonStyle(PlainButtonStyle())
                            .globalTextStyle(config, size: 12)
                            .padding(12 * config.spacingScale)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(4 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                        
                        Text("3px solid")
                            .globalTextStyle(config, size: 10)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    
                    // 自定义焦点环
                    VStack(spacing: 8 * config.spacingScale) {
                        Button(language == "zh" ? "自定义焦点环" : "Custom Focus Ring") {}
                            .buttonStyle(PlainButtonStyle())
                            .globalTextStyle(config, size: 12)
                            .padding(12 * config.spacingScale)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(4 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.accent, lineWidth: 2)
                                    .shadow(color: DesignTokens.Colors.accent.opacity(0.3), radius: 4)
                            )
                        
                        Text("accent + glow")
                            .globalTextStyle(config, size: 10)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.background)
                .cornerRadius(8 * config.radiusScale)
            }
        }
    }
    
    private func scaleForSize(_ size: String) -> CGFloat {
        switch size {
        case "A-": return 0.875
        case "A": return 1.0
        case "A+": return 1.125
        case "A++": return 1.25
        default: return 1.0
        }
    }
}

// 无障碍功能列表
private let accessibilityFeatures = [
    ("字体大小缩放", "Font Size Scaling"),
    ("对比度模式", "Contrast Mode"),
    ("字间距", "Letter Spacing"),
    ("行高", "Line Height")
]

// 对比度模式示例
private struct ContrastModeExample {
    let mode: ContrastMode
    let nameZh: String
    let nameEn: String
    let weight: Font.Weight
    let bodyWeight: Font.Weight
    let foreground: Color
    let bodyColor: Color
    let background: Color
    let border: Color
    let borderWidth: CGFloat
    let buttonBackground: Color
    let buttonForeground: Color
}

private var contrastModes: [ContrastModeExample] {
    let config = DesignTokensConfig.shared
    let isDark = config.isDarkMode
    
    return [
        ContrastModeExample(
            mode: .normal,
            nameZh: "默认",
            nameEn: "Default",
            weight: .medium,
            bodyWeight: .regular,
            foreground: DesignTokens.Colors.foreground,
            bodyColor: DesignTokens.Colors.mutedForeground,
            background: DesignTokens.Colors.card,
            border: DesignTokens.Colors.border,
            borderWidth: 1,
            buttonBackground: DesignTokens.Colors.primary,
            buttonForeground: DesignTokens.Colors.primaryForeground
        ),
        ContrastModeExample(
            mode: .high,
            nameZh: "高对比",
            nameEn: "High Contrast",
            weight: .semibold,
            bodyWeight: .medium,
            foreground: isDark ? DesignTokens.Colors.grayColor(for: 100) : DesignTokens.Colors.grayColor(for: 900),
            bodyColor: isDark ? DesignTokens.Colors.grayColor(for: 200) : DesignTokens.Colors.grayColor(for: 800),
            background: isDark ? DesignTokens.Colors.grayColor(for: 900) : DesignTokens.Colors.grayColor(for: 50),
            border: isDark ? DesignTokens.Colors.grayColor(for: 300) : DesignTokens.Colors.grayColor(for: 700),
            borderWidth: 2,
            buttonBackground: isDark ? DesignTokens.Colors.brandColor(for: 300) : DesignTokens.Colors.brandColor(for: 700),
            buttonForeground: isDark ? Color.black : Color.white
        ),
        ContrastModeExample(
            mode: .ultra,
            nameZh: "超高对比",
            nameEn: "Ultra High",
            weight: .bold,
            bodyWeight: .semibold,
            foreground: isDark ? Color.white : Color.black,
            bodyColor: isDark ? Color.white : Color.black,
            background: isDark ? Color.black : Color.white,
            border: isDark ? Color.white : Color.black,
            borderWidth: 3,
            buttonBackground: isDark ? Color.white : Color.black,
            buttonForeground: isDark ? Color.black : Color.white
        )
    ]
}

// 字间距示例
private struct LetterSpacingExample {
    let mode: LetterSpacingMode
    let nameZh: String
    let nameEn: String
    let value: CGFloat
}

private let letterSpacingExamples = [
    LetterSpacingExample(mode: .normal, nameZh: "标准", nameEn: "Normal", value: 0),
    LetterSpacingExample(mode: .wide, nameZh: "宽松", nameEn: "Wide", value: 0.025),
    LetterSpacingExample(mode: .wider, nameZh: "更宽", nameEn: "Wider", value: 0.05),
    LetterSpacingExample(mode: .widest, nameZh: "最宽", nameEn: "Widest", value: 0.1)
]

// 行高示例
private struct LineHeightExample {
    let mode: LineHeightMode
    let nameZh: String
    let nameEn: String
    let value: Double
}

private let lineHeightExamples = [
    LineHeightExample(mode: .tight, nameZh: "紧凑", nameEn: "Tight", value: 1.25),
    LineHeightExample(mode: .normal, nameZh: "标准", nameEn: "Normal", value: 1.6),
    LineHeightExample(mode: .relaxed, nameZh: "舒适", nameEn: "Relaxed", value: 1.8),
    LineHeightExample(mode: .loose, nameZh: "宽松", nameEn: "Loose", value: 2.2)
]