//
//  SpacingSystem.swift
//  100% 还原showcase.html的间距系统
//

import SwiftUI
import DesignTokensKit

struct SpacingSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        // 使用响应式网格，4列布局
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 120), spacing: 24 * config.spacingScale)
            ],
            spacing: 24 * config.spacingScale
        ) {
            ForEach(spacingValues, id: \.name) { spacing in
                VStack(spacing: 8 * config.spacingScale) {
                    // 可视化展示
                    HStack {
                        Rectangle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: min(spacing.value * config.spacingScale, 80), height: 32)
                        Spacer()
                    }
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    
                    // 标签
                    Text(spacing.name)
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    // 值
                    Text("\(Int(spacing.value))px")
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
}

// 间距值定义 - 与showcase.html完全一致
private let spacingValues: [(name: String, value: CGFloat)] = [
    (name: "space-0-5", value: 2),
    (name: "space-1", value: 4),
    (name: "space-2", value: 8),
    (name: "space-3", value: 12),
    (name: "space-4", value: 16),
    (name: "space-5", value: 20),
    (name: "space-6", value: 24),
    (name: "space-8", value: 32),
    (name: "space-10", value: 40),
    (name: "space-12", value: 48),
    (name: "space-16", value: 64),
    (name: "space-20", value: 80)
]