//
//  TypographySystemComplete.swift
//  完整的文字系统展示，所有面板自动撑开
//

import SwiftUI
import DesignTokensKit

struct TypographySystemCompleteView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24 * config.spacingScale) {
                // 使用2列布局
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(minimum: 300), spacing: 24 * config.spacingScale),
                        GridItem(.flexible(minimum: 300), spacing: 24 * config.spacingScale)
                    ],
                    spacing: 24 * config.spacingScale
                ) {
                    // 1. 字体大小
                    TypographyCard(
                        title: language == "zh" ? "字体大小" : "Font Sizes",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            ForEach(fontSizes, id: \.name) { size in
                                HStack(alignment: .firstTextBaseline) {
                                    Text(size.label)
                                        .globalTextStyleNoColor(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        .frame(width: 90, alignment: .leading)
                                    Text("Aa")
                                        .globalTextStyle(config, size: size.value)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    // 2. 字重
                    TypographyCard(
                        title: language == "zh" ? "字重" : "Font Weights",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            ForEach(fontWeights, id: \.name) { weight in
                                HStack(alignment: .firstTextBaseline) {
                                    Text(weight.label)
                                        .globalTextStyleNoColor(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        .frame(width: 90, alignment: .leading)
                                    Text("Sample")
                                        .globalTextStyle(config, size: 16, weight: weight.value)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    // 3. 字体族
                    TypographyCard(
                        title: language == "zh" ? "字体族" : "Font Families",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                            // Sans Serif
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("Sans Serif")
                                    .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                                    .globalTextStyle(config, size: 14)
                                Text("abcdefghijklmnopqrstuvwxyz")
                                    .globalTextStyle(config, size: 14)
                                Text("0123456789")
                                    .globalTextStyle(config, size: 14)
                            }
                            
                            Divider()
                            
                            // Monospace
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("Monospace")
                                    .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                                    .monoTextStyle(config, size: 14)
                                Text("abcdefghijklmnopqrstuvwxyz")
                                    .monoTextStyle(config, size: 14)
                                Text("0123456789")
                                    .monoTextStyle(config, size: 14)
                            }
                        }
                    }
                    
                    // 4. 标题样式
                    TypographyCard(
                        title: language == "zh" ? "标题样式" : "Heading Styles",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "标题 H1" : "Heading H1")
                                .globalTextStyle(config, size: 32, weight: .bold)
                            Text(language == "zh" ? "标题 H2" : "Heading H2")
                                .globalTextStyle(config, size: 24, weight: .bold)
                            Text(language == "zh" ? "标题 H3" : "Heading H3")
                                .globalTextStyle(config, size: 20, weight: .semibold)
                            Text(language == "zh" ? "标题 H4" : "Heading H4")
                                .globalTextStyle(config, size: 18, weight: .semibold)
                            Text(language == "zh" ? "标题 H5" : "Heading H5")
                                .globalTextStyle(config, size: 16, weight: .medium)
                            Text(language == "zh" ? "标题 H6" : "Heading H6")
                                .globalTextStyle(config, size: 14, weight: .medium)
                        }
                    }
                    
                    // 5. 文本样式组合
                    TypographyCard(
                        title: language == "zh" ? "文本样式组合" : "Text Style Combinations",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                            // 正文
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "正文" : "Body Text")
                                    .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("The quick brown fox jumps over the lazy dog. " + 
                                     (language == "zh" ? "这是一段示例文字。" : "This is sample text."))
                                    .globalTextStyle(config, size: 14)
                                    .lineLimit(3)
                            }
                            
                            Divider()
                            
                            // 引用
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "引用" : "Quote")
                                    .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text(language == "zh" ? "「设计不仅仅是外观和感觉，设计是它的工作原理。」" : 
                                     "\"Design is not just what it looks like and feels like. Design is how it works.\"")
                                    .globalTextStyle(config, size: 16)
                                    .italic()
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .lineLimit(3)
                            }
                            
                            Divider()
                            
                            // 代码
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "代码" : "Code")
                                    .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("const designSystem = { color: 'blue' };")
                                    .monoTextStyle(config, size: 13)
                                    .padding(8 * config.spacingScale)
                                    .background(DesignTokens.Colors.muted)
                                    .cornerRadius(4 * config.radiusScale)
                            }
                        }
                    }
                    
                    // 6. 行高示例
                    TypographyCard(
                        title: language == "zh" ? "行高" : "Line Height",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                            // 紧凑
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("line-height: 1.2 (紧凑)")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("The quick brown fox\njumps over the lazy dog.\n" + 
                                     (language == "zh" ? "敏捷的棕色狐狸\n跳过了懒狗。" : "Multiple lines of text."))
                                    .globalTextStyleNoColor(config, size: 14)
                                    .lineSpacing(14 * 0.2)
                            }
                            
                            Divider()
                            
                            // 标准
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("line-height: 1.5 (标准)")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("The quick brown fox\njumps over the lazy dog.\n" + 
                                     (language == "zh" ? "敏捷的棕色狐狸\n跳过了懒狗。" : "Multiple lines of text."))
                                    .globalTextStyleNoColor(config, size: 14)
                                    .lineSpacing(14 * 0.5)
                            }
                            
                            Divider()
                            
                            // 宽松
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("line-height: 1.8 (宽松)")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("The quick brown fox\njumps over the lazy dog.\n" + 
                                     (language == "zh" ? "敏捷的棕色狐狸\n跳过了懒狗。" : "Multiple lines of text."))
                                    .globalTextStyleNoColor(config, size: 14)
                                    .lineSpacing(14 * 0.8)
                            }
                        }
                    }
                    
                    // 7. 字间距示例
                    TypographyCard(
                        title: language == "zh" ? "字间距" : "Letter Spacing",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                            // 紧凑
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("letter-spacing: -0.05em")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("TYPOGRAPHY EXAMPLE")
                                    .globalTextStyleNoColor(config, size: 16)
                                    .tracking(-0.8)
                            }
                            
                            Divider()
                            
                            // 标准
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("letter-spacing: normal")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("TYPOGRAPHY EXAMPLE")
                                    .globalTextStyleNoColor(config, size: 16)
                                    .tracking(0)
                            }
                            
                            Divider()
                            
                            // 宽松
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("letter-spacing: 0.1em")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("TYPOGRAPHY EXAMPLE")
                                    .globalTextStyleNoColor(config, size: 16)
                                    .tracking(1.6)
                            }
                            
                            Divider()
                            
                            // 更宽
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("letter-spacing: 0.2em")
                                    .globalTextStyleNoColor(config, size: 11, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                Text("TYPOGRAPHY EXAMPLE")
                                    .globalTextStyleNoColor(config, size: 16)
                                    .tracking(3.2)
                            }
                        }
                    }
                    
                    // 8. 文本装饰
                    TypographyCard(
                        title: language == "zh" ? "文本装饰" : "Text Decoration",
                        config: config
                    ) {
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text("Normal Text")
                                .globalTextStyle(config, size: 14)
                            
                            Text("Bold Text")
                                .globalTextStyle(config, size: 14, weight: .bold)
                            
                            Text("Italic Text")
                                .globalTextStyle(config, size: 14)
                                .italic()
                            
                            Text("Underlined Text")
                                .globalTextStyle(config, size: 14)
                                .underline()
                            
                            Text("Strikethrough Text")
                                .globalTextStyle(config, size: 14)
                                .strikethrough()
                            
                            Text("UPPERCASE TEXT")
                                .globalTextStyle(config, size: 14)
                                .textCase(.uppercase)
                            
                            Text("Colored Text")
                                .globalTextStyleNoColor(config, size: 14)
                                .foregroundColor(DesignTokens.Colors.primary)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// 可复用的卡片组件 - 自动撑开高度
struct TypographyCard<Content: View>: View {
    let title: String
    let config: DesignTokensConfig
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
            Text(title)
                .globalTextStyle(config, size: 16, weight: .semibold)
            
            content()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20 * config.spacingScale)
        .frame(maxWidth: .infinity)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// Font size definitions
private let fontSizes: [(name: String, label: String, value: CGFloat)] = [
    (name: "xs", label: "text-xs (12px)", value: DesignTokens.Typography.textXS),
    (name: "sm", label: "text-sm (14px)", value: DesignTokens.Typography.textSM),
    (name: "base", label: "text-base (16px)", value: DesignTokens.Typography.textBase),
    (name: "lg", label: "text-lg (18px)", value: DesignTokens.Typography.textLG),
    (name: "xl", label: "text-xl (20px)", value: DesignTokens.Typography.textXL),
    (name: "2xl", label: "text-2xl (24px)", value: DesignTokens.Typography.text2XL),
    (name: "3xl", label: "text-3xl (30px)", value: DesignTokens.Typography.text3XL),
    (name: "4xl", label: "text-4xl (36px)", value: DesignTokens.Typography.text4XL),
    (name: "5xl", label: "text-5xl (48px)", value: DesignTokens.Typography.text5XL),
    (name: "6xl", label: "text-6xl (60px)", value: DesignTokens.Typography.text6XL)
]

// Font weight definitions
private let fontWeights: [(name: String, label: String, value: Font.Weight)] = [
    (name: "thin", label: "Thin (100)", value: .thin),
    (name: "light", label: "Light (300)", value: .light),
    (name: "normal", label: "Normal (400)", value: .regular),
    (name: "medium", label: "Medium (500)", value: .medium),
    (name: "semibold", label: "Semibold (600)", value: .semibold),
    (name: "bold", label: "Bold (700)", value: .bold),
    (name: "extrabold", label: "Extrabold (800)", value: .heavy),
    (name: "black", label: "Black (900)", value: .black)
]