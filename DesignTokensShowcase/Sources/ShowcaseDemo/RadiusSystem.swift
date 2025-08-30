//
//  RadiusSystem.swift
//  100% 还原showcase.html的圆角系统
//

import SwiftUI
import DesignTokensKit

struct RadiusSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        // 使用自适应网格展示圆角值，每行最多6个
        GeometryReader { geometry in
            let width = geometry.size.width
            let itemWidth: CGFloat = 120
            let spacing: CGFloat = 24 * config.spacingScale
            let maxColumns = min(6, Int((width + spacing) / (itemWidth + spacing)))
            let columnCount = max(1, maxColumns)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: spacing), count: columnCount),
                spacing: spacing
            ) {
            ForEach(radiusValues, id: \.name) { radius in
                VStack(spacing: 8 * config.spacingScale) {
                    // 可视化展示
                    if radius.name == "full" {
                        Circle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: 60, height: 60)
                    } else {
                        RoundedRectangle(cornerRadius: radius.value * config.radiusScale)
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: 60, height: 60)
                    }
                    
                    // 标签
                    Text(radius.name)
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    // 值
                    Text(radius.displayValue)
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(DesignTokens.Colors.description(3))
                }
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
        .frame(minHeight: 200)
    }
}

// 圆角值定义 - 与showcase.html完全一致
private let radiusValues: [(name: String, value: CGFloat, displayValue: String)] = [
    (name: "none", value: 0, displayValue: "0px"),
    (name: "sm", value: 4, displayValue: "~4px"),
    (name: "md", value: 8, displayValue: "~8px"),
    (name: "lg", value: 12, displayValue: "~12px"),
    (name: "xl", value: 18, displayValue: "~18px"),
    (name: "2xl", value: 24, displayValue: "~24px"),
    (name: "3xl", value: 30, displayValue: "~30px"),
    (name: "full", value: 9999, displayValue: "9999px")
]