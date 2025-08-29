//
//  SpacingSystem.swift
//  100% 还原showcase.html的间距系统
//

import SwiftUI

struct SpacingSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "4. 间距系统" : "4. Spacing System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                
                Text(language == "zh" ? "统一的间距规范" : "Unified spacing specifications")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 间距展示
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "间距值" : "Spacing Values")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    ForEach(spacingValues, id: \.name) { spacing in
                        HStack(spacing: 16 * config.spacingScale) {
                            // 变量名
                            Text(spacing.name)
                                .font(.system(size: 11 * config.fontScale, design: .monospaced))
                                .foregroundColor(DesignTokens.Colors.primary)
                                .frame(width: 80, alignment: .leading)
                            
                            // 可视化条形 - 外层显示最大宽度，内层显示实际间距
                            ZStack(alignment: .leading) {
                                // 背景条（显示缩放后的尺寸）
                                Rectangle()
                                    .fill(DesignTokens.Colors.primary.opacity(0.1))
                                    .frame(width: min(spacing.value * config.spacingScale * 3, 300), height: 20)
                                
                                // 实际间距条
                                Rectangle()
                                    .fill(DesignTokens.Colors.primary)
                                    .frame(width: spacing.value * config.spacingScale, height: 20)
                            }
                            
                            // 像素值
                            Text("\(Int(spacing.value))px")
                                .globalTextStyle(config, size: 11)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                                .frame(width: 40, alignment: .trailing)
                            
                            // 计算值（带缩放）
                            if config.spacingScale != 1.0 {
                                Text("→ \(Int(spacing.value * config.spacingScale))px")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.accent)
                            }
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
                .overlay(
                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                )
            }
            
            // 间距应用示例
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "间距应用示例" : "Spacing Examples")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                HStack(spacing: 24 * config.spacingScale) {
                    // Padding 示例
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "内边距 Padding" : "Padding")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(spacing: 8 * config.spacingScale) {
                            ForEach(["space-2", "space-4", "space-6"], id: \.self) { space in
                                let value = spacingValueFor(space)
                                HStack {
                                    Text(space)
                                        .globalTextStyle(config, size: 12)
                                        .padding(value * config.spacingScale)
                                        .background(DesignTokens.Colors.primary.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                                .stroke(DesignTokens.Colors.primary, lineWidth: 1)
                                        )
                                }
                            }
                        }
                    }
                    
                    // Margin 示例
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "外边距 Margin" : "Margin")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(["space-2", "space-4", "space-6"], id: \.self) { space in
                                let value = spacingValueFor(space)
                                HStack {
                                    Rectangle()
                                        .fill(DesignTokens.Colors.primary)
                                        .frame(width: 60, height: 30)
                                    Text(space)
                                        .globalTextStyle(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                                .padding(.bottom, value * config.spacingScale)
                            }
                        }
                        .padding()
                        .background(DesignTokens.Colors.muted.opacity(0.3))
                        .cornerRadius(4 * config.radiusScale)
                    }
                    
                    // Gap 示例
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "间隙 Gap" : "Gap")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            ForEach(["space-2", "space-4", "space-6"], id: \.self) { space in
                                let value = spacingValueFor(space)
                                HStack(spacing: value * config.spacingScale) {
                                    ForEach(0..<3) { _ in
                                        Rectangle()
                                            .fill(DesignTokens.Colors.primary)
                                            .frame(width: 30, height: 30)
                                    }
                                    Text(space)
                                        .globalTextStyle(config, size: 10)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                            }
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 响应式间距
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "响应式间距" : "Responsive Spacing")
                    .globalTextStyle(config, size: 16, weight: .medium)
                
                Text(language == "zh" ? 
                     "间距会根据 spacing-scale 缩放因子动态调整。当前缩放: \(String(format: "%.1fx", config.spacingScale))" :
                     "Spacing adapts based on spacing-scale factor. Current scale: \(String(format: "%.1fx", config.spacingScale))")
                    .globalTextStyle(config, size: 13)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                HStack(spacing: 16 * config.spacingScale) {
                    Text("1x")
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(config.spacingScale == 1.0 ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                    
                    Slider(value: $config.spacingScale, in: 0.5...2.0)
                        .accentColor(DesignTokens.Colors.primary)
                        .frame(width: 200)
                    
                    Text("2x")
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(config.spacingScale == 2.0 ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                }
                .padding(12 * config.spacingScale)
                .background(DesignTokens.Colors.muted.opacity(0.3))
                .cornerRadius(6 * config.radiusScale)
            }
        }
    }
    
    private func spacingValueFor(_ name: String) -> CGFloat {
        switch name {
        case "space-0": return 0
        case "space-0-5", "space-0.5": return 2
        case "space-1": return 4
        case "space-1-5", "space-1.5": return 6
        case "space-2": return 8
        case "space-2-5", "space-2.5": return 10
        case "space-3": return 12
        case "space-3-5", "space-3.5": return 14
        case "space-4": return 16
        case "space-5": return 20
        case "space-6": return 24
        case "space-7": return 28
        case "space-8": return 32
        case "space-9": return 36
        case "space-10": return 40
        case "space-12": return 48
        case "space-14": return 56
        case "space-16": return 64
        case "space-20": return 80
        case "space-24": return 96
        default: return 16
        }
    }
}

// 间距值定义
private let spacingValues: [(name: String, value: CGFloat)] = [
    (name: "space-0", value: 0),
    (name: "space-0.5", value: 2),
    (name: "space-1", value: 4),
    (name: "space-1.5", value: 6),
    (name: "space-2", value: 8),
    (name: "space-2.5", value: 10),
    (name: "space-3", value: 12),
    (name: "space-3.5", value: 14),
    (name: "space-4", value: 16),
    (name: "space-5", value: 20),
    (name: "space-6", value: 24),
    (name: "space-7", value: 28),
    (name: "space-8", value: 32),
    (name: "space-9", value: 36),
    (name: "space-10", value: 40),
    (name: "space-12", value: 48),
    (name: "space-14", value: 56),
    (name: "space-16", value: 64),
    (name: "space-20", value: 80),
    (name: "space-24", value: 96)
]