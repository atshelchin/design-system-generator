//
//  AccessibilitySystem.swift
//  100% 还原showcase.html的无障碍系统
//

import SwiftUI
import DesignTokensKit
struct AccessibilitySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        // 与showcase.html完全一致，只有两个部分
        HStack(alignment: .top, spacing: 24 * config.spacingScale) {
            // 左侧：无障碍功能
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "无障碍功能" : "Accessibility Features")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                Text(language == "zh" ? 
                     "所有无障碍控制现在都在右下角的悬浮面板中。您可以调整：" :
                     "All accessibility controls are now in the floating panel on the bottom right. You can adjust:")
                    .globalTextStyle(config, size: 14)
                
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    ForEach(accessibilityFeatures, id: \.0) { feature in
                        HStack(spacing: 8 * config.spacingScale) {
                            Circle()
                                .fill(DesignTokens.Colors.primary)
                                .frame(width: 4, height: 4)
                            Text(language == "zh" ? feature.0 : feature.1)
                                .globalTextStyle(config, size: 13)
                        }
                    }
                }
                .padding(.leading, 24 * config.spacingScale)
                
                // 示例文本框
                Text(language == "zh" ? 
                     "此文本将响应所有无障碍设置。尝试调整悬浮面板中的控件以查看更改。" :
                     "This text will respond to all accessibility settings. Try adjusting the controls in the floating panel to see the changes.")
                    .globalTextStyle(config, size: 14)
                    .padding(16 * config.spacingScale)
                    .background(DesignTokens.Colors.panel(1))
                    .cornerRadius(8 * config.radiusScale)
            }
            .frame(maxWidth: .infinity)
            .padding(20 * config.spacingScale)
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            
            // 右侧：设计系统变量
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "设计系统变量" : "Design System Variables")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                Text(language == "zh" ? 
                     "您可以动态调整核心设计变量：" :
                     "You can dynamically adjust the core design variables:")
                    .globalTextStyle(config, size: 14)
                
                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                    ForEach(designVariables, id: \.0) { variable in
                        HStack(spacing: 8 * config.spacingScale) {
                            Circle()
                                .fill(DesignTokens.Colors.primary)
                                .frame(width: 4, height: 4)
                            Text(language == "zh" ? variable.0 : variable.1)
                                .globalTextStyle(config, size: 13)
                        }
                    }
                }
                .padding(.leading, 24 * config.spacingScale)
                
                // 颜色示例
                HStack(spacing: 12 * config.spacingScale) {
                    RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                        .fill(DesignTokens.Colors.primary)
                        .frame(width: 60, height: 60)
                    
                    RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                        .fill(DesignTokens.Colors.brandColor(for: 500))
                        .frame(width: 60, height: 60)
                    
                    RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                        .fill(DesignTokens.Colors.brandColor(for: 300))
                        .frame(width: 60, height: 60)
                }
                .padding(.top, 8 * config.spacingScale)
            }
            .frame(maxWidth: .infinity)
            .padding(20 * config.spacingScale)
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
        }
    }
}

// 无障碍功能列表 - 与showcase.html完全一致
private let accessibilityFeatures = [
    ("字体大小缩放", "Font Size Scaling"),
    ("对比度模式", "Contrast Mode"),
    ("字间距", "Letter Spacing"),
    ("行高", "Line Height")
]

// 设计系统变量列表 - 与showcase.html完全一致
private let designVariables = [
    ("品牌色调 (0-360°)", "Brand Hue (0-360°)"),
    ("品牌饱和度 (0-100%)", "Brand Saturation (0-100%)"),
    ("圆角缩放", "Radius Scale"),
    ("间距缩放", "Spacing Scale")
]
