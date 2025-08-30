//
//  TypographySystem.swift
//  100% 还原showcase.html的文字系统
//

import SwiftUI
import DesignTokensKit
struct TypographySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            GeometryReader { geometry in
                let screenSize = ScreenSize.from(width: geometry.size.width)
                let columnCount = screenSize == .compact ? 1 : 2
                
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: columnCount),
                    spacing: 24 * config.spacingScale
                ) {
                    // 字体大小 - 完整展示
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "字体大小 (完整)" : "Font Sizes (Complete)")
                            .globalTextStyle(config, size: 16, weight: .semibold)
                        
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            ForEach(fontSizes, id: \.name) { size in
                                HStack {
                                    Text(size.label)
                                        .globalTextStyle(config, size: size.value)
                                    Spacer()
                                }
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                .stroke(DesignTokens.Colors.border, lineWidth: 1)
                        )
                    }
                    
                    // 字重 - 完整展示
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "字重 (完整)" : "Font Weights (Complete)")
                            .globalTextStyle(config, size: 16, weight: .semibold)
                        
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            ForEach(fontWeights, id: \.name) { weight in
                                Text(weight.label)
                                    .globalTextStyle(config, size: 16, weight: weight.value)
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                .stroke(DesignTokens.Colors.border, lineWidth: 1)
                        )
                    }
                    
                    // 字体族
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "字体族" : "Font Families")
                            .globalTextStyle(config, size: 16, weight: .semibold)
                        
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            // Sans-serif
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("Sans-serif")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text("The quick brown fox jumps over the lazy dog")
                                    .globalTextStyle(config, size: 16)
                                
                                Text(language == "zh" ? "快速的棕色狐狸跳过懒狗" : "1234567890")
                                    .globalTextStyle(config, size: 16)
                            }
                            
                            Divider()
                            
                            // Serif
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("Serif")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text("The quick brown fox jumps over the lazy dog")
                                    .font(.system(size: 16 * config.fontScale, design: .serif))
                                    .tracking(config.letterSpacing.emValue * 16 * config.fontScale)
                                    .lineSpacing((config.lineHeight.value - 1.0) * 16 * config.fontScale)
                                
                                Text(language == "zh" ? "快速的棕色狐狸跳过懒狗" : "1234567890")
                                    .font(.system(size: 16 * config.fontScale, design: .serif))
                                    .tracking(config.letterSpacing.emValue * 16 * config.fontScale)
                                    .lineSpacing((config.lineHeight.value - 1.0) * 16 * config.fontScale)
                            }
                            
                            Divider()
                            
                            // Monospace
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("Monospace")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text("The quick brown fox jumps over the lazy dog")
                                    .monoTextStyle(config, size: 16)
                                
                                Text("1234567890 !@#$%^&*()")
                                    .monoTextStyle(config, size: 16)
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                .stroke(DesignTokens.Colors.border, lineWidth: 1)
                        )
                    }
                    
                    // 文本样式组合
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "文本样式组合" : "Text Style Combinations")
                            .globalTextStyle(config, size: 16, weight: .semibold)
                        
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            // 标题样式
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "标题 H1" : "Heading H1")
                                    .globalTextStyle(config, size: 36, weight: .bold)
                                    .foregroundColor(DesignTokens.Colors.heading(1))
                                
                                Text(language == "zh" ? "标题 H2" : "Heading H2")
                                    .globalTextStyle(config, size: 30, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.heading(2))
                                
                                Text(language == "zh" ? "标题 H3" : "Heading H3")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.heading(3))
                                
                                Text(language == "zh" ? "标题 H4" : "Heading H4")
                                    .globalTextStyle(config, size: 20, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(4))
                                
                                Text(language == "zh" ? "标题 H5" : "Heading H5")
                                    .globalTextStyle(config, size: 18, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(5))
                                
                                Text(language == "zh" ? "标题 H6" : "Heading H6")
                                    .globalTextStyle(config, size: 16, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(6))
                            }
                            
                            Divider()
                            
                            // 正文样式
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "正文内容" : "Body Text")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text(language == "zh" ? 
                                     "这是一段正文内容。设计系统通过统一的文字样式，确保界面的一致性和可读性。" :
                                     "This is body text. The design system ensures consistency and readability through unified text styles.")
                                    .globalTextStyle(config, size: 16)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            
                            Divider()
                            
                            // 小字和注释
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text(language == "zh" ? "小字和注释" : "Small Text & Captions")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text(language == "zh" ? "这是小字文本" : "This is small text")
                                    .globalTextStyle(config, size: 12)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                Text(language == "zh" ? "* 这是一条注释" : "* This is a caption")
                                    .globalTextStyle(config, size: 11)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .italic()
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                .stroke(DesignTokens.Colors.border, lineWidth: 1)
                        )
                    }
                }
            }
            .frame(minHeight: 800)
        }
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