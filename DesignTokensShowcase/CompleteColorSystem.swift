//
//  CompleteColorSystem.swift
//  100% 还原showcase.html的色彩系统
//

import SwiftUI

struct CompleteColorSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题 - 使用间距缩放
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "1. 色彩系统" : "1. Color System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                
                Text(language == "zh" ? "品牌色、中性色和语义色" : "Brand, neutral, and semantic colors")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 品牌色 - 左对齐标题，响应式网格布局
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "品牌色" : "Brand Colors")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                ColorGrid(
                    colors: [50, 100, 200, 300, 400, 500, 600, 700, 800, 900].map { shade in
                        (name: "brand-\(shade)", color: DesignTokens.Colors.brandColor(for: shade))
                    },
                    config: config
                )
            }
            
            // 中性色 - 左对齐标题
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "中性色" : "Neutral Colors")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                ColorGrid(
                    colors: [50, 100, 200, 300, 400, 500, 600, 700, 800, 900].map { shade in
                        (name: "gray-\(shade)", color: DesignTokens.Colors.grayColor(for: shade))
                    },
                    config: config
                )
            }
            
            // 语义色 - 2x4布局
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "语义色" : "Semantic Colors")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                SemanticColorGrid(
                    colors: [
                        ("Primary", "--color-primary", DesignTokens.Colors.primary),
                        ("Secondary", "--color-secondary", DesignTokens.Colors.secondary),
                        ("Muted", "--color-muted", DesignTokens.Colors.muted),
                        ("Accent", "--color-accent", DesignTokens.Colors.accent),
                        ("Success", "--color-success", DesignTokens.Colors.success),
                        ("Warning", "--color-warning", DesignTokens.Colors.warning),
                        ("Danger", "--color-danger", DesignTokens.Colors.danger),
                        ("Info", "--color-info", DesignTokens.Colors.info),
                        ("Positive", "--color-positive", DesignTokens.Colors.success),
                        ("Negative", "--color-negative", DesignTokens.Colors.danger),
                        ("Neutral", "--color-neutral", Color(NSColor.systemGray))
                    ],
                    config: config
                )
            }
            
            // 功能色 - 3列布局
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "功能色" : "Functional Colors")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                FunctionalColorGrid(language: language, config: config)
            }
            
        }
    }
    
    // 计算文字间距
    private var letterSpacingValue: CGFloat {
        switch config.letterSpacing {
        case .wide: return 0.5
        case .wider: return 1.0
        default: return 0
        }
    }
    
    // 计算行高
    private var lineHeightValue: CGFloat {
        switch config.lineHeight {
        case .relaxed: return 4
        case .loose: return 8
        default: return 0
        }
    }
    
    // 计算对比度
    private var contrastValue: Double {
        switch config.contrast {
        case .high: return 1.0
        case .ultra: return 1.0
        default: return 0.8
        }
    }
}

// 响应式色彩网格 - 10个色块一行紧凑排列
struct ColorGrid: View {
    let colors: [(name: String, color: Color)]
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 8 * config.spacingScale), count: 10),
            spacing: 8 * config.spacingScale
        ) {
            ForEach(colors, id: \.name) { item in
                ColorItem(
                    name: item.name,
                    color: item.color,
                    config: config
                )
            }
        }
    }
}

// 单个色块项 - 更紧凑的设计
struct ColorItem: View {
    let name: String
    let color: Color
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 4 * config.spacingScale) {
            // 色块 - 更小的圆角和高度
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .fill(color)
                .aspectRatio(1.2, contentMode: .fit)
                .shadow(
                    color: Color.black.opacity(0.05),
                    radius: 1,
                    y: 1
                )
            
            // 色值名称
            Text(name)
                .secondaryTextStyle(config, size: 10)
        }
    }
}

// 语义色网格 - 一行最多6个
struct SemanticColorGrid: View {
    let colors: [(String, String, Color)]
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 10 * config.spacingScale), count: 6),
            spacing: 10 * config.spacingScale
        ) {
            ForEach(colors, id: \.0) { item in
                VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                    // 色块 - 更小更紧凑
                    RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                        .fill(item.2)
                        .frame(height: 50)
                        .shadow(color: Color.black.opacity(0.05), radius: 1, y: 1)
                    
                    // 标签
                    Text(item.0)
                        .globalTextStyle(config, size: 10, weight: .medium)
                    
                    // CSS变量名
                    Text(item.1)
                        .secondaryTextStyle(config, size: 9)
                }
            }
        }
    }
}

// 功能色网格 - 完整3x3布局
struct FunctionalColorGrid: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        HStack(alignment: .top, spacing: 24 * config.spacingScale) {
            // 第一列：背景
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "背景" : "Background")
                    .globalTextStyle(config, size: 13, weight: .semibold)
                
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    ColorSampleRow(
                        label: language == "zh" ? "页面背景" : "Page Background",
                        color: DesignTokens.Colors.background,
                        config: config
                    )
                    ColorSampleRow(
                        label: language == "zh" ? "卡片背景" : "Card Background", 
                        color: DesignTokens.Colors.card,
                        config: config
                    )
                    ColorSampleRow(
                        label: language == "zh" ? "弹出背景" : "Popover Background",
                        color: DesignTokens.Colors.popover,
                        config: config
                    )
                }
            }
            .frame(maxWidth: .infinity)
            
            // 第二列：按钮
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "按钮" : "Buttons")
                    .globalTextStyle(config, size: 13, weight: .semibold)
                
                VStack(spacing: 8 * config.spacingScale) {
                    Button("Primary Button") {}
                        .buttonStyle(PrimaryButtonStyle(config: config))
                        .frame(maxWidth: .infinity)
                    
                    Button("Secondary Button") {}
                        .buttonStyle(SecondaryButtonStyle(config: config))
                        .frame(maxWidth: .infinity)
                    
                    Button("Disabled Button") {}
                        .disabled(true)
                        .buttonStyle(DisabledButtonStyle(config: config))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            
            // 第三列：边框与输入
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "边框与输入" : "Borders & Input")
                    .globalTextStyle(config, size: 13, weight: .semibold)
                
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    Text(language == "zh" ? "边框" : "Border")
                        .globalTextStyle(config, size: 11)
                        .padding(.horizontal, 8 * config.spacingScale)
                        .padding(.vertical, 6 * config.spacingScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                .stroke(DesignTokens.Colors.border, lineWidth: 1)
                        )
                    
                    HStack {
                        Text("Input Field")
                            .globalTextStyle(config, size: 11)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(8 * config.spacingScale)
                    .background(Color(NSColor.controlBackgroundColor))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                            .stroke(DesignTokens.Colors.input, lineWidth: 1)
                    )
                    
                    Button(language == "zh" ? "聚焦环" : "Focus Ring") {}
                        .buttonStyle(PlainButtonStyle())
                        .globalTextStyle(config, size: 11)
                        .padding(8 * config.spacingScale)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                .stroke(DesignTokens.Colors.ring, lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// 色彩样本行
struct ColorSampleRow: View {
    let label: String
    let color: Color
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        HStack {
            Text(label)
                .globalTextStyle(config, size: 11)
            Spacer()
        }
        .padding(.horizontal, 8 * config.spacingScale)
        .padding(.vertical, 6 * config.spacingScale)
        .background(color)
        .overlay(
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 0.5)
        )
        .cornerRadius(4 * config.radiusScale)
    }
}


// Button styles
struct PrimaryButtonStyle: ButtonStyle {
    @ObservedObject var config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13 * config.fontScale, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.primary)
            .cornerRadius(4 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    @ObservedObject var config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13 * config.fontScale, weight: .medium))
            .foregroundColor(DesignTokens.Colors.primary)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(Color(NSColor.controlBackgroundColor))
            .overlay(
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .cornerRadius(4 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct DisabledButtonStyle: ButtonStyle {
    @ObservedObject var config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13 * config.fontScale, weight: .medium))
            .foregroundColor(Color(NSColor.tertiaryLabelColor))
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
            .cornerRadius(4 * config.radiusScale)
    }
}
