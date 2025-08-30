//
//  TypographySystem.swift
//  100% 还原showcase.html的文字系统
//

import SwiftUI
import DesignTokensKit

// MARK: - Unified Showcase Card Component
struct ShowcaseCard<Content: View>: View {
    let title: String
    let config: DesignTokensConfig
    let minHeight: CGFloat
    @ViewBuilder let content: () -> Content
    
    init(
        title: String,
        config: DesignTokensConfig,
        minHeight: CGFloat = 200,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.config = config
        self.minHeight = minHeight
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            Text(title)
                .globalTextStyle(config, size: 16, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                content()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer(minLength: 0)
        }
        .padding(20 * config.spacingScale)
        .frame(minHeight: minHeight, alignment: .top)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct TypographySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(minimum: 280), spacing: 24 * config.spacingScale),
                        GridItem(.flexible(minimum: 280), spacing: 24 * config.spacingScale)
                    ],
                    spacing: 24 * config.spacingScale
                ) {
                    // 字体大小 - 完整展示
                    ShowcaseCard(
                        title: language == "zh" ? "字体大小" : "Font Sizes",
                        config: config,
                        minHeight: 0
                    ) {
                        VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                            ForEach(fontSizes, id: \.name) { size in
                                HStack(alignment: .firstTextBaseline) {
                                    Text(size.label)
                                        .globalTextStyleNoColor(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Aa")
                                        .globalTextStyle(config, size: size.value)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    // 字重 - 完整展示
                    ShowcaseCard(
                        title: language == "zh" ? "字重" : "Font Weights",
                        config: config,
                        minHeight: 0
                    ) {
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                ForEach(fontWeights, id: \.name) { weight in
                                    HStack {
                                        Text(weight.name)
                                            .globalTextStyleNoColor(config, size: 11)
                                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                                            .frame(width: 80, alignment: .leading)
                                        Text("Sample")
                                            .globalTextStyle(config, size: 16, weight: weight.value)
                                        Spacer()
                                    }
                                }
                        }
                    }
                    
                    // 字体族
                    ShowcaseCard(
                        title: language == "zh" ? "字体族" : "Font Families",
                        config: config,
                        minHeight: 0
                    ) {
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                                // Sans Serif
                                VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                    Text("Sans Serif")
                                        .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("System UI Font - " + (language == "zh" ? "系统默认字体" : "System Default Font"))
                                        .globalTextStyle(config, size: 14)
                                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                                        .globalTextStyle(config, size: 14)
                                    Text("abcdefghijklmnopqrstuvwxyz")
                                        .globalTextStyle(config, size: 14)
                                    Text("0123456789")
                                        .globalTextStyle(config, size: 14)
                                    Text("--font-family-sans")
                                        .globalTextStyleNoColor(config, size: 10)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                                
                                Divider()
                                
                                // Monospace
                                VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                    Text("Monospace")
                                        .globalTextStyleNoColor(config, size: 12, weight: .medium)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("Monospace Font - " + (language == "zh" ? "等宽字体" : "Monospace Font"))
                                        .monoTextStyle(config, size: 14)
                                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                                        .monoTextStyle(config, size: 14)
                                    Text("abcdefghijklmnopqrstuvwxyz")
                                        .monoTextStyle(config, size: 14)
                                    Text("0123456789")
                                        .monoTextStyle(config, size: 14)
                                    Text("--font-family-mono")
                                        .globalTextStyleNoColor(config, size: 10)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                        }
                    }
                }
            }
            .padding(.horizontal)
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